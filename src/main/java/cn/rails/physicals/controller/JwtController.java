package cn.rails.physicals.controller;

import cn.rails.physicals.entity.UserInfo;
import cn.rails.physicals.enums.RespCode;
import cn.rails.physicals.exception.MarsException;
import cn.rails.physicals.mapper.PhysicalReportMapper;
import cn.rails.physicals.mapper.UserMapper;
import cn.rails.physicals.util.DES;
import cn.rails.physicals.vo.RespVo;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.idsmanager.dingdang.jwt.DingdangUserRetriever;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/3/3 14:30
 */
@Controller
@RequestMapping("/jwt")
@Slf4j
public class JwtController {

    //体检公钥
    @Value("${tjPublicKey}")
    private String tjPublicKey;
    //移动端密钥
    @Value("${DES_KEY}")
    private String desKey;


    @Resource
    private UserMapper userMapper;

    @Resource
    private PhysicalReportMapper physicalReportMapper;

    @RequestMapping("/pcIndex")
    public String pcIndex(){
        return "index";
    }

    /**
     * pc单点登录
     * @param request
     * @return
     */
    @PostMapping("/pcLogin")
    @ResponseBody
    public RespVo pcLogin(HttpServletRequest request) {
        String id_token = request.getParameter("id_token");
        //1.使用公钥，解析id_token
        // 使用publicKey解密上一步获取的id_token令牌
        DingdangUserRetriever retriever = new DingdangUserRetriever(id_token, tjPublicKey);
        DingdangUserRetriever.User user = null;
        try {
            //2.获取用户信息
            user = retriever.retrieve();
        } catch (Exception e) {
            throw new MarsException("解析失败");
        }
        String jobNumber = user.getUsername();//工号
        if (StringUtils.isEmpty(jobNumber)) {
            throw new MarsException("用户无工号");
        }
        UserInfo userInfo = userMapper.selectOne(new QueryWrapper<UserInfo>().eq("job_number", jobNumber));
        if (userInfo == null) {
            throw new MarsException("用户不存在");
        }
        if (userInfo.getDelFlag() == 1) {
            throw new MarsException("用户已禁用");
        }
        userMapper.updateLastLoginTime(userInfo.getId(), new Timestamp(System.currentTimeMillis()));
        request.getSession().setAttribute("userInfo", userInfo);
        return RespVo.success();
    }


    /**
     * 移动端单点登录
     * @param request
     * @return
     * @throws Exception
     */
    @GetMapping(value = "/mobileLogin")
    @ResponseBody
    public String mobileLogin(HttpServletRequest request) throws Exception {
        String id_token = request.getParameter("id_token");
        //1.使用公钥，解析id_token
        // 使用publicKey解密上一步获取的id_token令牌
        DingdangUserRetriever retriever = new DingdangUserRetriever(id_token, tjPublicKey);
        DingdangUserRetriever.User user = null;
        try {
            //2.获取用户信息
            user = retriever.retrieve();
        } catch (Exception e) {
            throw new MarsException("解析失败");
        }
        String jobNumber = user.getUsername();//工号
        UserInfo userInfo = userMapper.selectOne(new QueryWrapper<UserInfo>().eq("job_number", jobNumber));
        if (userInfo == null) {
            throw new MarsException("用户不存在");
        }
        if (userInfo.getDelFlag() == 1) {
            throw new MarsException("用户已禁用");
        }
        Map<String, Object> userMap = new HashMap<>();
        userMap.put("userInfo", userInfo);
        String abc = JSON.toJSONString(userMap);
        return DES.encrypt(JSON.toJSONString(userMap), desKey);
    }


    /**
     * 查看体检列表
     * @param request
     * @return
     * @throws Exception
     */
    @GetMapping(value = "/queryPhysicalReport")
    @ResponseBody
    public String queryPhysicalReport(HttpServletRequest request) throws Exception {
        String userId=request.getParameter("id");
        String jobNumber=request.getParameter("jobNumber");
        if(StringUtils.isEmpty(userId)){
            throw new MarsException("id不能为空");
        }
        List<Map<String, Object>> mapList = null;
//        Object obj=request.getSession().getAttribute("userInfo");
//        if(Objects.isNull(obj)){
//            throw new MarsException("session中用户为空");
//        }
//        UserInfo userInfo = (UserInfo) obj;
//        Long id = userInfo.getId();
//        if(Objects.equals(jobNumber,userInfo.getJobNumber())){
//            mapList = physicalReportMapper.queryReportList(Long.valueOf(userId));
//        }
        mapList = physicalReportMapper.queryReportList(Long.valueOf(userId));
        String abc = JSON.toJSONString(mapList);
        return JSON.toJSONString(mapList);
//        return DES.encrypt(JSON.toJSONString(mapList), desKey);
    }


    /**
     * 查看体检详情
     * @param request
     * @return
     * @throws Exception
     */
    @GetMapping(value = "/mobileTjData")
    @ResponseBody
    public String mobileTjData(HttpServletRequest request) throws Exception {
        Map<String, Object> map = new HashMap<>();
        String id = request.getParameter("id");
        if(StringUtils.isEmpty(id)){
            throw new MarsException("id不能为空");
        }
        Map<String, Object> resultMap = physicalReportMapper.queryUserMedicalExaminationReportByInfo(Long.valueOf(id));
        Object obj = resultMap.get("identityCard");
        Object obj1 = resultMap.get("yearFlag");
        if (obj != null && obj1 !=null) {
            String identityCard = obj.toString();
            String yearFlag = obj1.toString();
            List<Map<String, Object>> mapList = physicalReportMapper.queryUserMedicalExaminationReport(identityCard,yearFlag);
            map.put("userInfo", resultMap);
            map.put("reportInfo", mapList);
        }
        String abc = JSON.toJSONString(map);
        return JSON.toJSONString(map);
//        return DES.encrypt(JSON.toJSONString(map), desKey);
    }







}
