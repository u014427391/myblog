package net.myblog.core;

public class ResultModel {
	private String code;
	
	private String message;
	
	public ResultModel() {
        this.code = "0";
        this.message = "success";
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
