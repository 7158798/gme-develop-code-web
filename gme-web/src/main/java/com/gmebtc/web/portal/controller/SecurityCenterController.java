package com.gmebtc.web.portal.controller;

import java.util.HashMap;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.gmebtc.web.portal.constant.ResultCode;
import com.gmebtc.web.portal.constant.SessionAttributes;
import com.gmebtc.web.portal.entity.BindCard;
import com.gmebtc.web.portal.entity.BindAliPayWeChat;
import com.gmebtc.web.portal.entity.UploadIDCard;
import com.gmebtc.web.portal.result.ResponseResult;
import com.gmebtc.web.portal.service.SecurityConterService;
import com.gmebtc.web.portal.utils.Regex;
import com.gmebtc.web.portal.utils.RegexUtil;
import com.gmebtc.web.portal.utils.Toolkits;
import com.gmebtc.web.portal.vo.UserVO;

/*
 * @Author zhou
 * @Date 2018/5/30 18:06
 * @Desc 安全中心
 */
@RestController
@RequestMapping("${ROOT_PATH}/security")
public class SecurityCenterController {
	private static final Logger log = LoggerFactory.getLogger(SecurityCenterController.class);

	@Resource(name = "securityConterService")
	private SecurityConterService securityConterService;

	/**
	 * @Author zhou
	 * @Date 2018/5/30 18:27
	 * @Param [request, oldPassword, newPassword, checkCode:图片验证码]
	 * @Desc 修改登录密码
	 */
	@RequestMapping(value = "/modifyLoginPwd", method = RequestMethod.POST)
	public Object modifyLoginPwd(HttpServletRequest request, @RequestParam String oldPassword,
			@RequestParam String newPassword, @RequestParam String checkCode) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "旧密码不能为空");
			map.put("msg2", "新密码不能为空");
			map.put("msg3", "图像验证码不能为空");
			map.put("msg4", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Old passwords cannot be empty");
			map.put("msg2", "New passwords cannot be empty");
			map.put("msg3", "Image verification code can not be empty");
			map.put("msg4", "Server exception,please try again later.");
		}

		if (null == oldPassword || StringUtils.isBlank(oldPassword)) {
			result.setCode("-1");
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			return result;
		}
		if (null == newPassword || StringUtils.isBlank(newPassword)) {
			result.setCode("-1");
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			result.setData("");
			return result;
		}
		if (null == checkCode || StringUtils.isBlank(checkCode)) {
			result.setCode("-1");
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			result.setData("");
			return result;
		}

		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("oldPassword", oldPassword);
		hashMap.put("newPassword", newPassword);
		hashMap.put("checkCode", checkCode);

		
		try {
			String json = securityConterService.modifyLoginPwd(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg4")));
			result.setData("");
			log.error("{} ", e.toString());
			return result;
		}
	}

	/**
	 * 
	* @Title: resetPayPassword  
	* @Description: 修改资金密码 (第一步) 
	* @param request
	* @param account
	* @param loginPassword
	* @param imgCode
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/resetPayPasswordFirst", method = RequestMethod.POST)
	public Object resetPayPasswordFirst(HttpServletRequest request, String account,String loginPassword,String imgCode) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "用户账号不能为空");
			map.put("msg2", "用户账号格式不正确");
			map.put("msg3", "登录密码不能为空");
			map.put("msg4", "图像验证码不能为空");
			map.put("msg5", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "The user account cannot be empty");
			map.put("msg2", "The user account format is incorrect");
			map.put("msg3", "The login password cannot be empty");
			map.put("msg4", "Image verification code can not be empty");
			map.put("msg5", "Server exception,please try again later.");
		}
		
		result.setCode(ResultCode.FORM_INFO_ERROR);
		
		
		/*String validateCode = (String) session.getAttribute(SessionAttributes.VALIDATE_CODE);
		if (null == validateCode || !validateCode.equals(imgCode)) {
			result.setMessage(Toolkits.defaultString(map.get("msg4")));
			result.setData("");
			return result;
		}*/
		
		if (null == account || StringUtils.isBlank(account)) {
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			return result;
		}
		if (!RegexUtil.isPhoneNumber(account) && !RegexUtil.isEmail(account)) {
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			result.setData("");
			return result;
		}
		if (null == loginPassword || StringUtils.isBlank(loginPassword)) {
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			result.setData("");
			return result;
		}
		
		
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("account", account);
		hashMap.put("loginPassword", loginPassword);
		try {
			String json = securityConterService.resetPayPasswordFirst(request, hashMap);
			result = (ResponseResult) Toolkits.fromJsonToPojo(json, ResponseResult.class);
			// 说明第一步已经成功，保存用户输入的账号，给下一步使用
			if (null != request && result.getCode().equals("200")) {
				session.setAttribute(SessionAttributes.USER_RESETPAYPWD, account);
				return request;
			}
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg5")));
			result.setData("");
			log.error("{} 重置资金密码第一步发生异常", e.toString());
			return result;
		}
	}
	
	
	
	
	
	
	@RequestMapping(value = "/resetPayPasswordSecond", method = RequestMethod.POST)
	public Object resetPayPasswordSecond(HttpServletRequest request, String newPassword) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "新资金密码不能为空");
			map.put("msg2", "服务器异常,请稍后重试");
			map.put("msg3", "操作失败,请重新登录");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "The new money password cannot be empty");
			map.put("msg2", "Server exception,please try again later");
			map.put("msg3", "The operation failure,please login again");
		}
		
		result.setCode(ResultCode.FORM_INFO_ERROR);
		
		String account = (String) session.getAttribute(SessionAttributes.USER_RESETPAYPWD);
		// 说明session失效，或者用户没有经过第一步重置资金密码
		if (null == account) {
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			result.setData("");
			return result;
		}
		
		HashMap<String, String> hashMap = new HashMap<String, String>();
		
		hashMap.put("newPassword", newPassword);
		hashMap.put("account", account);
		
		try {
			String json = securityConterService.resetPayPasswordSecond(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			result.setData("");
			log.error("{} 重置资金密码第二步发生异常", e.toString());
			return result;
		}
		
	}
	
	
	
	
	
	
	
	
	/**
	 * 
	* @Title: sendEmail  
	* @Description: 发送邮件
	* @param request
	* @param email
	* @param type 1.激活邮箱url；2.用户登录code，3重置登录密码code，4.重置资金密码code，5.提币申请code,6绑定邮箱
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
	public Object sendEmail(HttpServletRequest request, String email, @RequestParam String type) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();

		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "邮箱不能为空");
			map.put("msg2", "邮箱格式错误");
			map.put("msg3", "服务器异常,请稍后重试");
			map.put("msg4", "你还没有登录,请登录后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Email cannot be empty");
			map.put("msg2", "Email format error");
			map.put("msg3", "Server exception,please try again later.");
			map.put("msg4", "You haven't logged in yet,please login and try again");
		}

		result.setCode(ResultCode.FORM_INFO_ERROR);
		result.setData("");
		/*session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, "1");
		UserVO userVO = null;
		userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
		if (null == userVO) {
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			result.setData("");
			return result;
		}*/

		if (null == email || StringUtils.isBlank(email)) {
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			return result;
		}
		if (!RegexUtil.isEmail(email)) {
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			return result;
		}
		
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("email", email);
		hashMap.put("type", type);
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");

		try {
			String json = securityConterService.sendEmail(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			result.setData("");
			log.error("{} 发送邮箱验证码发生异常", e.toString());
			return result;
		}
	}

	
	/**
	 * 
	* @Title: identifyAuth  
	* @Description: 实名认证 
	* @param request
	* @param uploadIdCard
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/identifyAuth", method = RequestMethod.POST)
	public Object identifyAuth(HttpServletRequest request, UploadIDCard uploadIdCard) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "姓名必填");
			map.put("msg2", "证件号码不能为空");
			map.put("msg3", "请上传证件正面照");
			map.put("msg4", "请上传证件反面照");
			map.put("msg4", "请上传手持证件照");
			map.put("msg5", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "The name cannot be empty");
			map.put("msg2", "The id number should not be blank");
			map.put("msg3", "Please upload the certificate to the front");
			map.put("msg4", "Please upload the certificate in the opposite direction");
			map.put("msg4", "Please upload a handheld certificate");
			map.put("msg5", "Server exception,please try again later.");
		}

		result.setCode(ResultCode.FORM_INFO_ERROR);
		result.setData("");

		if (null == uploadIdCard.getName() || StringUtils.isBlank(uploadIdCard.getName())) {
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			return result;
		}
		if (null == uploadIdCard.getCardNumber() || StringUtils.isBlank(uploadIdCard.getCardNumber())) {
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			return result;
		}
		if (null == uploadIdCard.getFaceImgId() || StringUtils.isBlank(uploadIdCard.getFaceImgId())) {
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			return result;
		}
		if (null == uploadIdCard.getBackImgId() || StringUtils.isBlank(uploadIdCard.getBackImgId())) {
			result.setMessage(Toolkits.defaultString(map.get("msg4")));
			return result;
		}
		if (null == uploadIdCard.getHandImgId() || StringUtils.isBlank(uploadIdCard.getHandImgId())) {
			result.setMessage(Toolkits.defaultString(map.get("msg4")));
			return result;
		}

		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("name", uploadIdCard.getName());
		hashMap.put("cardType", uploadIdCard.getCardType());
		hashMap.put("cardNumber", uploadIdCard.getCardNumber());
		hashMap.put("faceImgId", uploadIdCard.getFaceImgId());
		hashMap.put("backImgId", uploadIdCard.getBackImgId());
		hashMap.put("handImgId", uploadIdCard.getHandImgId());
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");
		
		try {
			String json = securityConterService.identifyAuth(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg5")));
			result.setData("");
			log.error("{} 实名认证发生异常", e.toString());
			return result;
		}
	}

	/**
	 * @Author zhou
	 * @Date 2018/5/30 20:26
	 * @Param [request]
	 * @Desc 检验是否实名认证
	 */
	@RequestMapping(value = "/checkHasIdentify", method = RequestMethod.POST)
	public Object checkHasIdentify(HttpServletRequest request) {
		ResponseResult result = new ResponseResult();
		
		try {
			String json = securityConterService.checkHasIdentify(request);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			//result.setMessage(Toolkits.defaultString(map.get(value)));
			result.setData("");
			log.error("{} ", e.toString());
			return result;
		}
	}

	/**
	 * @Author zhou
	 * @Date 2018/5/30 20:40
	 * @Param [request, bindCard:银行卡信息]
	 * @Desc 绑定银行卡
	 */
	@RequestMapping(value = "/payMethedBank", method = RequestMethod.POST)
	public Object payMethedBank(HttpServletRequest request, BindCard bindCard) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "开户行不能为空");
			map.put("msg2", "支行不能为空");
			map.put("msg3", "银行卡号不能为空");
			map.put("msg4", "资金密码不能为空");
			map.put("msg5", "服务器异常,请稍后重试");
			map.put("msg6", "你还没有登录,请登录后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "The opening bank cannot be empty");
			map.put("msg2", "Branches cannot be empty");
			map.put("msg3", "The bank card number cannot be empty");
			map.put("msg4", "Capital cipher can not be empty");
			map.put("msg5", "Server exception,please try again later.");
			map.put("msg6", "You haven't logged in yet,please login and try again");
		}

		result.setCode(ResultCode.FORM_INFO_ERROR);
		result.setData("");
		/*session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, "1");
		UserVO userVO = null;
		userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
		if (null == userVO) {
			result.setMessage(Toolkits.defaultString(map.get("msg7")));
			result.setData("");
			return result;
		}*/

		if (null == bindCard.getBank() || StringUtils.isBlank(bindCard.getBank())) {
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			return result;
		}
		if (null == bindCard.getBranch() || StringUtils.isBlank(bindCard.getBranch())) {
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			return result;
		}
		if (null == bindCard.getBankCard() || StringUtils.isBlank(bindCard.getBankCard())) {
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			return result;
		}
		if (null == bindCard.getTradeAuth() || StringUtils.isBlank(bindCard.getTradeAuth())) {
			result.setMessage(Toolkits.defaultString(map.get("msg4")));
			return result;
		}

		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("bank", bindCard.getBank());
		hashMap.put("branch", bindCard.getBranch());
		hashMap.put("bankCard", bindCard.getBankCard());
		hashMap.put("tradeAuth", bindCard.getTradeAuth());
		hashMap.put("uid", "42");

		try {
			String json = securityConterService.payMethedBank(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg6")));
			result.setData("");
			log.error("{} 绑定银行卡 发生异常", e.toString());
			return result;

		}
	}

	
	/**
	 * 
	* @Title: payMethodAlipayWeChat  
	* @Description: 绑定支付宝或者微信 
	* @param request
	* @param payMethod
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/payMethodAlipayWeChat", method = RequestMethod.POST)
	public Object payMethodAlipayWeChat(HttpServletRequest request, BindAliPayWeChat payMethod) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "请上传收款码图片");
			map.put("msg2", "账号不能为空");
			map.put("msg3", "资金密码不能为空");
			map.put("msg4", "服务器异常,请稍后重试");
			map.put("msg5", "你还没有登录,请登录后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "The name cannot be empty");
			map.put("msg2", "The account cannot be empty");
			map.put("msg3", "Capital cipher can not be empty");
			map.put("msg4", "Server exception,please try again later.");
			map.put("msg5", "You haven't logged in yet,please login and try again");
		}

		result.setCode(ResultCode.FORM_INFO_ERROR);
		result.setData("");
		/*session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, "1");
		UserVO userVO = null;
		userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
		if (null == userVO) {
			result.setMessage(Toolkits.defaultString(map.get("msg5")));
			result.setData("");
			return result;
		}*/

		if (null == payMethod.getQrImgId() || StringUtils.isBlank(payMethod.getQrImgId())) {
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			return result;
		}
		if (null == payMethod.getAccount() || StringUtils.isBlank(payMethod.getAccount())) {
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			return result;
		}
		if (null == payMethod.getTradeAuth() || StringUtils.isBlank(payMethod.getTradeAuth())) {
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			return result;
		}

		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("qrImgId", payMethod.getQrImgId());
		hashMap.put("type", payMethod.getType());
		hashMap.put("account", payMethod.getAccount());
		hashMap.put("remark", payMethod.getRemark());
		hashMap.put("tradeAuth", payMethod.getTradeAuth());
		hashMap.put("uid", "42");
		try {
			String json = securityConterService.payMethedAlipayWeChat(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg4")));
			result.setData("");
			log.error("{} ", e.toString());
			return result;
		}
	}

	/**
	 * 
	 * @Title: checkUserIdentify
	 * @Description: 检查用户信息
	 * @param request
	 * @return
	 * @return Object
	 */
	@RequestMapping(value = "/checkUserIdentify", method = RequestMethod.GET)
	public Object checkUserIdentify(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "你还没有登录,请登录后重试");
			map.put("msg2", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "You haven't logged in yet,please login and try again");
			map.put("msg2", "Server exception,please try again later.");
		}

		/*session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, "1");
		UserVO userVO = null;
		userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
		if (null == userVO) {
			result.setCode(ResultCode.FORM_INFO_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			return result;
		}*/
		
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("uid", "41");
		try {
			String json = securityConterService.checkUserIdentify(request, hashMap);
			return Toolkits.handleResp(json);
			/*String json = "'{'code':'200','message':'检查用户信息成功','data':{'idCard':'544323424234','email':'sfee@qq.com','phone':'15013668499','payMethod':{'name':'ld','bank':'中商银行','branch':'酹太想爱你支行','bankCard':'42108234234324324321','alipayImg':'http://img.zcool.cn/community/010a1b554c01d1000001bf72a68b37.jpg@1280w_1l_2o_100sh.png','alipayAccount':'1','alipayDesc':'1','wechatImg':'http://img.zcool.cn/community/010a1b554c01d1000001bf72a68b37.jpg@1280w_1l_2o_100sh.png','wechatAccount':'1','wechatDesc':'1'},'bankCard':true,'alipay':true,'wechat':true,'bindEmail':true,'authIdCard':true,'payMethod':false},'ext':null}'";*/
			//return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			result.setData("");
			log.error("{} 检查用户信息发生异常", e.toString());
			return result;
		}
	}

	/**
	 * 
	* @Title: payMethod  
	* @Description: 绑定手机号 
	* @param request
	* @param phoneCode
	* @param countryCode
	* @param identCode
	* @param tradeAuth
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/bindPhone", method = RequestMethod.POST)
	public Object bindPhone(HttpServletRequest request, String phoneCode, String countryCode, String identCode,
			String tradeAuth) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "手机号不能为空");
			map.put("msg2", "手机号格式不正确");
			map.put("msg3", "手机验证码不能为空");
			map.put("msg4", "资金密码不能为空");
			map.put("msg5", "服务器异常,请稍后重试");
			map.put("msg6", "你还没有登录,请登录后重试");

		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Cell phone number can not be empty");
			map.put("msg2", "The format of the phone number is not correct");
			map.put("msg3", "Cell phone verification code can not be empty");
			map.put("msg4", "Capital cipher can not be empty");
			map.put("msg5", "Server exception,please try again later.");
			map.put("msg6", "You haven't logged in yet,please login and try again");
		}

		result.setCode(ResultCode.FORM_INFO_ERROR);

		/*session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, "1");
		UserVO userVO = null;
		userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
		if (null == userVO) {
			result.setMessage(Toolkits.defaultString(map.get("msg5")));
			result.setData("");
			return result;
		}*/

		if (null == phoneCode || StringUtils.isBlank(phoneCode)) {
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			return result;
		}
		if (!RegexUtil.isPhoneNumber(phoneCode)) {
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			result.setData("");
			return result;
		}
		if (null == identCode || StringUtils.isBlank(identCode)) {
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			result.setData("");
			return result;
		}
		if (null == tradeAuth || StringUtils.isBlank(tradeAuth)) {
			result.setMessage(Toolkits.defaultString(map.get("msg4")));
			result.setData("");
			return result;
		}

		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("phoneCode", phoneCode);
		hashMap.put("countryCode", countryCode);
		hashMap.put("identCode", identCode);
		hashMap.put("tradeAuth", tradeAuth);
		hashMap.put("uid", "41");

		try {
			String json = securityConterService.bindPhone(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg5")));
			result.setData("");
			log.error("{} 绑定手机号发生异常", e.toString());
			return result;
		}
	}

	
	/**
	 * 
	* @Title: bindEmail  
	* @Description: 绑定邮箱 
	* @param request
	* @param email
	* @param emailCode
	* @param tradeAuth
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/bindEmail", method = RequestMethod.POST)
	public Object bindEmail(HttpServletRequest request, String email, String emailCode, String tradeAuth) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "邮箱不能为空");
			map.put("msg2", "邮箱号格式不正确");
			map.put("msg3", "邮箱验证码不能为空");
			map.put("msg4", "资金密码不能为空");
			map.put("msg5", "服务器异常,请稍后重试");
			map.put("msg6", "你还没有登录,请登录后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Mailbox cannot be empty");
			map.put("msg2", "Incorrect mailbox format");
			map.put("msg3", "Mailbox verification code can not be empty");
			map.put("msg4", "Capital cipher can not be empty");
			map.put("msg5", "Server exception,please try again later.");
			map.put("msg6", "You haven't logged in yet,please login and try again");
		}

		result.setCode(ResultCode.FORM_INFO_ERROR);
		result.setData("");

		/*
		 * UserVO userVO = new UserVO(); userVO.setUid("1");
		 * session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, userVO); userVO =
		 * (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN); if (null
		 * == userVO) { result.setMessage(Toolkits.defaultString(map.get("msg6")));
		 * result.setData(""); return result; }
		 */

		if (null == email || StringUtils.isBlank(email)) {
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			return result;
		}
		if (!RegexUtil.isEmail(email)) {
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			return result;
		}
		if (null == emailCode || StringUtils.isBlank(emailCode)) {
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			return result;
		}
		if (null == tradeAuth || StringUtils.isBlank(tradeAuth)) {
			result.setMessage(Toolkits.defaultString(map.get("msg4")));
			return result;
		}

		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("email", email);
		hashMap.put("emailCode", emailCode);
		hashMap.put("tradeAuth", tradeAuth);
		hashMap.put("uid", "41");
		
		try {
			String json = securityConterService.bindEmail(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg5")));
			result.setData("");
			log.error("{} 绑定邮箱发生异常", e.toString());
			return result;
		}
	}

	/**
	 * @Author zhou
	 * @Date 2018/5/31 20:55
	 * @Param [request, uid, email, nonce:时间, token:加密结果]
	 * @Desc 邮箱激活验证
	 */
	@RequestMapping(value = "/emailActiveCheck", method = RequestMethod.GET)
	public Object emailActiveCheck(HttpServletRequest request, String activeId) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Server exception,please try again later.");
		}
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("activeId", activeId);
		
		try {
			String json = securityConterService.emailActiveCheck(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} 激活邮箱发生异常", e.toString());
			return result;
		}
	}

	/**
	 * 
	 * @Title: checkEmailCode @Description: 验证邮箱验证码 @param @param
	 * request @param @param email @param @param emailCode @param @return @return
	 * Object @throws
	 */
	@RequestMapping(value = "/checkEmailCode", method = RequestMethod.POST)
	public Object checkEmailCode(HttpServletRequest request, @RequestParam String email,
			@RequestParam String emailCode) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "邮箱不能为空");
			map.put("msg2", "邮箱号格式不正确");
			map.put("msg3", "邮箱验证码不能为空");
			map.put("msg4", "服务器异常,请稍后重试");
			map.put("msg5", "你还没有登录,请登录后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Mailbox cannot be empty");
			map.put("msg2", "Incorrect mailbox format");
			map.put("msg3", "Mailbox verification code can not be empty");
			map.put("msg4", "Server exception,please try again later");
			map.put("msg5", "You haven't logged in yet,please login and try again");
		}

		result.setCode(ResultCode.FORM_INFO_ERROR);

		/*
		 * UserVO userVO = null; userVO = (UserVO)
		 * session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN); if (null ==
		 * userVO) { result.setMessage(Toolkits.defaultString(map.get("msg5")));
		 * result.setData(""); return result; }
		 */

		if (null == email || StringUtils.isBlank(email)) {
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			return result;
		}
		if (!Toolkits.isEmail(email)) {
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			result.setData("");
			return result;
		}
		if (null == emailCode || StringUtils.isBlank(emailCode)) {
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			result.setData("");
			return result;
		}

		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("email", email);
		hashMap.put("emailCode", emailCode);
		hashMap.put("uid", "41");

		try {
			String json = securityConterService.checkEmailCode(request, hashMap);
			result = (ResponseResult) Toolkits.fromJsonToPojo(json, ResponseResult.class);
			if (null != result && result.getCode().equals(ResultCode.SUCCESS)) {
				// 如果是 找回登陆密码 邮箱验证码，需要存用户的账号，给第二个页面确认找回使用
				session.setAttribute(SessionAttributes.USER_LOGINID, email);
				return result;
			}
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg4")));
			result.setData("");
			log.error("{} 验证邮箱验证码发生异常.", e.toString());
			return result;
		}
	}
	
	
	
	/**
	 * 
	* @Title: openCloseTwoStep  
	* @Description: 开启或者关闭二步登录保护 
	* @param request
	* @param checkCode
	* @param type
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/openCloseTwoStep", method = RequestMethod.POST)
	public Object openCloseTwoStep(HttpServletRequest request, String checkCode, @RequestParam String type) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "邮箱验证码不能为空");
			map.put("msg2", "服务器异常,请稍后重试");
			map.put("msg3", "你还没有登录,请登录后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Mailbox verification code can not be empty");
			map.put("msg2", "Server exception,please try again later");
			map.put("msg3", "You haven't logged in yet,please login and try again");
		}

		

		/*
		 * UserVO userVO = null; userVO = (UserVO)
		 * session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN); if (null ==
		 * userVO) { result.setMessage(Toolkits.defaultString(map.get("msg5")));
		 * result.setData(""); return result; }
		 */

		if (null == checkCode || StringUtils.isBlank(checkCode)) {
			result.setCode(ResultCode.FORM_INFO_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			return result;
		}

		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("checkCode", checkCode);
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");
		hashMap.put("type", type);
		
		
		try {
			String json = securityConterService.checkEmailCode(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			result.setData("");
			log.error("{} 开启或者关闭二步登录保护 发生异常.", e.toString());
			return result;
		}
	}
	
	
	
	/**
	 * 
	* @Title: getSecurityLogList  
	* @Description:  查询安全日志
	* @param request
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/securityLogList", method = RequestMethod.GET)
	public Object getSecurityLogList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Server exception,please try again later");
		}

		

		/*
		 * UserVO userVO = null; userVO = (UserVO)
		 * session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN); if (null ==
		 * userVO) { result.setMessage(Toolkits.defaultString(map.get("msg5")));
		 * result.setData(""); return result; }
		 */


		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");
		
		
		try {
			String json = securityConterService.getSecurityLogList(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} 查询安全日志 发生异常.", e.toString());
			return result;
		}
	}
	
	
	
	/**
	 * 
	* @Title: securityOperationHistory  
	* @Description: 查询安全设置历史记录
	* @param request
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/securityOperationHistory", method = RequestMethod.GET)
	public Object getSecurityOperationHistory(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Server exception,please try again later");
		}

		

		/*
		 * UserVO userVO = null; userVO = (UserVO)
		 * session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN); if (null ==
		 * userVO) { result.setMessage(Toolkits.defaultString(map.get("msg5")));
		 * result.setData(""); return result; }
		 */


		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");
		
		
		try {
			String json = securityConterService.getSecurityOperationHistory(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} 查询安全设置历史记录 发生异常.", e.toString());
			return result;
		}
	}
	
	
	
	
	/**
	 * 
	* @Title: systemTime  
	* @Description: 查询当前服务器时间
	* @param request
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/systemTime", method = RequestMethod.GET)
	public Object systemTime(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		HashMap<String, String> map = new HashMap<>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Server exception,please try again later");
		}

		

		/*
		 * UserVO userVO = null; userVO = (UserVO)
		 * session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN); if (null ==
		 * userVO) { result.setMessage(Toolkits.defaultString(map.get("msg5")));
		 * result.setData(""); return result; }
		 */


		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");
		
		
		try {
			String json = securityConterService.systemTime(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} 查询当前服务器时间 发生异常.", e.toString());
			return result;
		}
	}
	
	
}
