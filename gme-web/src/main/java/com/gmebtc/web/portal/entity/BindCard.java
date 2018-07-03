package com.gmebtc.web.portal.entity;

import java.io.Serializable;

public class BindCard implements Serializable{
	private static final long serialVersionUID = 1L;
	/* 姓名*/
    private String name;
    /* 开户行*/
    private String bank;
    /* 支行*/
    private String branch;
    /* 银行卡号*/
    private String bankCard;
    /* 资金密码*/
    private String tradeAuth;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getBankCard() {
        return bankCard;
    }

    public void setBankCard(String bankCard) {
        this.bankCard = bankCard;
    }

	public String getTradeAuth() {
		return tradeAuth;
	}

	public void setTradeAuth(String tradeAuth) {
		this.tradeAuth = tradeAuth;
	}

}
