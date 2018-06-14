package com.gmebtc.web.portal.entity;

import java.io.Serializable;

public class User implements Serializable{
    private Integer id;
    /* 手机号码*/
    private String phoneCode;
    /* 区号*/
    private String countryCode;
    /* 手机验证码*/
    private String identCode;
    /* 登录密码*/
    private String password;
    /* 资金密码*/
    private String tradeAuth;
    /* 推荐人ID*/
    private String refereeId;
    /* 邮箱*/
    private String email;
    /* 图像验证码*/
    private String checkCode;
    /* 手机号或者邮箱*/
    private String loginId;
    /* 发送的短信验证码类型*/
    private String type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhoneCode() {
		return phoneCode;
	}

	public void setPhoneCode(String phoneCode) {
		this.phoneCode = phoneCode;
	}

	public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }


    public String getIdentCode() {
		return identCode;
	}

	public void setIdentCode(String identCode) {
		this.identCode = identCode;
	}

	public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTradeAuth() {
		return tradeAuth;
	}

	public void setTradeAuth(String tradeAuth) {
		this.tradeAuth = tradeAuth;
	}

	public String getRefereeId() {
        return refereeId;
    }

    public void setRefereeId(String refereeId) {
        this.refereeId = refereeId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {

        this.email = email;
    }

    public String getCheckCode() {
        return checkCode;
    }


    public void setCheckCode(String checkCode) {
        this.checkCode = checkCode;
    }


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

}