package cn.rails.physicals.exception;

import cn.rails.physicals.enums.RespCode;
import lombok.Getter;
import lombok.Setter;

/**
 * @Description: 异常处理
 * @Author: pan zhenghui
 * @Date: 2021/1/25 9:29
 */
@Getter
@Setter
public class MarsException extends RuntimeException {

    private int code;
    private String msg;


    public MarsException(String msg) {
        super(msg);
        this.code = RespCode.FAIL.getCode();
        this.msg = msg;
    }

    public MarsException(int code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }

    public MarsException(RespCode respCode) {
        super(respCode.getMsg());
        this.code = respCode.getCode();
        this.msg = respCode.getMsg();
    }

    public MarsException(RespCode respCode, String msg) {
        super(respCode.getMsg());
        this.code = respCode.getCode();
        this.msg = msg + respCode.getMsg();
    }

}