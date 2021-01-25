package cn.rails.physicals.vo;

import cn.rails.physicals.constant.MarsConst;
import cn.rails.physicals.enums.RespCode;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

/**
 * @Description: 返回结果集
 * @Author: pan zhenghui
 * @Date: 2021/1/25 9:29
 */
@Data
@Builder
@AllArgsConstructor
public class RespVo implements Serializable {


    private int code;
    private String msg;
    private Object data;


    public static RespVo fail(String msg) {
        return RespVo.builder().code(MarsConst.FAILED).msg(msg).build();
    }

    public static RespVo fail(String msg, int code) {
        return RespVo.builder().code(code).msg(msg).build();
    }

    public static RespVo success(Object data) {
        return RespVo.builder().code(MarsConst.SUCCESS).msg("成功").data(data).build();
    }

    public static RespVo success() {
        return MarsConst.RESP_VO;
    }

    public static RespVo respCode(RespCode respCode) {
        return RespVo.builder().code(respCode.getCode()).msg(respCode.getMsg()).build();
    }

}