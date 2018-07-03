package com.gmebtc.web.portal.entity;

import java.io.Serializable;

/**
 * 
 * @Project：gme-web   
 * @Class：UserInfo   
 * @Description 类描述： 检查用户信息   
 * @Author：zzh 
 * @Date：2018年7月2日 下午6:23:57   
 * @version v1.0
 */
public class UserInfo implements Serializable{

	private static final long serialVersionUID = 1L;

	/**
	 * idCard: 身份证号
	 */
	private String idCard;
	/**
	 * email: 邮箱
	 */
	private String email;
	/**
	 * phone: 手机号
	 */
	private String phone;
	/**
	 * payMethod: 支付方式
	 */
	private PayMethod payMethod;
	/**
	 * isAlipay:是否开启支付宝
	 */
	private Boolean alipay;
	/**
	 *isBankCard:是否开启银行卡
	 */
	private Boolean bankCard;
	/**
	 *isWechat: 是否开启微信
	 */
	private Boolean wechat;
	/**
	 *isBindEmail:是否绑定邮箱
	 */
	private Boolean bindEmail;
	/**
	 *isAuthIdCard: 是否实名认证
	 */
	private Boolean authIdCard;
	/**
	 *isBindPhone: 是否绑定手机
	 */
	private Boolean bindPhone;
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public PayMethod getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(PayMethod payMethod) {
		this.payMethod = payMethod;
	}
	public Boolean getAlipay() {
		return alipay;
	}
	public void setAlipay(Boolean alipay) {
		this.alipay = alipay;
	}
	public Boolean getBankCard() {
		return bankCard;
	}
	public void setBankCard(Boolean bankCard) {
		this.bankCard = bankCard;
	}
	public Boolean getWechat() {
		return wechat;
	}
	public void setWechat(Boolean wechat) {
		this.wechat = wechat;
	}
	public Boolean getBindEmail() {
		return bindEmail;
	}
	public void setBindEmail(Boolean bindEmail) {
		this.bindEmail = bindEmail;
	}
	public Boolean getAuthIdCard() {
		return authIdCard;
	}
	public void setAuthIdCard(Boolean authIdCard) {
		this.authIdCard = authIdCard;
	}
	public Boolean getBindPhone() {
		return bindPhone;
	}
	public void setBindPhone(Boolean bindPhone) {
		this.bindPhone = bindPhone;
	}
	
}
