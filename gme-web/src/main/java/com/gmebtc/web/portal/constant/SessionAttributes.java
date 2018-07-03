package com.gmebtc.web.portal.constant;


/**
 * 
 * @Project：gme-web   
 * @Class：SessionAttributes   
 * @Description 存入session中的key常量    
 * @Author：zhou   
 * @Date：2018年6月27日 上午10:45:29   
 * @version V1.0
 */
public class SessionAttributes {
	
	/**
	 * 验证码存储变量名称
	 */
	public static final String VALIDATE_CODE="VALIDATE_CODE";

	/**
	 * 第一步登录成功
	 */
	public static final String LOGIN_FIRSTLOGIN = "LOGIN_FIRSTLOGIN";
	/**
	 * 第二步登录成功
	 */
	public static final String LOGIN_SECONDLOGIN = "LOGIN_SECONDLOGIN";
	/**
	 * 存用户的账号(页面无法传递)
	 */
	public static final String USER_LOGINID = "USER_LOGINID";
	/**
	 * 存用户重置资金密码的时候的账号
	 */
	public static final String USER_RESETPAYPWD = "USER_RESETPAYPWD";
	/**
	 * 存用户是否绑定过手机号
	 */
	public static final String USER_ISBINDPHONE = "USER_ISBINDPHONE";
	
	
}
