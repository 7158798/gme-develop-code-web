package com.gmebtc.web.portal.result;

import java.io.Serializable;

public class ResponseResult implements Serializable {
	private static final long serialVersionUID = 1L;
	private String code;
    private String message;
    private Object data;

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

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}

