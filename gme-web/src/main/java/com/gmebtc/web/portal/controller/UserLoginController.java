package com.gmebtc.web.portal.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.gmebtc.web.portal.constant.ResultCode;
import com.gmebtc.web.portal.constant.SessionAttributes;
import com.gmebtc.web.portal.entity.User;
import com.gmebtc.web.portal.result.ResponseResult;
import com.gmebtc.web.portal.service.UserLoginService;
import com.gmebtc.web.portal.service.impl.UserLoginServiceImpl;
import com.gmebtc.web.portal.utils.Toolkits;
import com.gmebtc.web.portal.vo.UserVO;

/**
 * @Author zhou
 * @Date 2018/5/28 11:59
 * @Desc 用户登录,忘记登录密码,注销登录 控制类
 */
@Controller
@RequestMapping(value = "${ROOT_PATH}/user")
public class UserLoginController {

	private static final Logger log = LoggerFactory.getLogger(UserLoginController.class);
	
    @Resource(name = "userLoginService")
    private UserLoginService userLoginService;


    /**
     * @throws ServletException 
     * @throws IOException 
     * 
     * @Title: userLogin
     * @Description: TODO 用户登录
     * @param @param request
     * @param @param user
     * @param @return
     * @return Object
     * @throws
     */
   /* @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public Object userLogin (HttpServletRequest request,User user){
        HttpSession session = request.getSession();
        // 获取当前本地语言
        Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        Map<String,String> map = new HashMap<String,String>();
        ResponseResult result = new ResponseResult();
        if ("zh_CN".equals(locale.toString())) {
            map.put("msg1", "登录账号不能为空");
            map.put("msg2", "登录账号格式不正确");
            map.put("msg3", "登录密码不能为空");
            map.put("msg4", "图片验证码不正确");
            map.put("msg5", "服务器异常,请稍后重试");
            map.put("msg6", "你已登录");
            
        }
        if ("en_US".equals(locale.toString())) {
            map.put("msg1", "The login account cannot be empty");
            map.put("msg2", "Login account format is not correct");
            map.put("msg3", "The login password can not be empty");
            map.put("msg4", "Image verification code is incorrect");
            map.put("msg5", "Server exception,please try again later");
            map.put("msg6", "You have logged in");
        }
        
        result.setCode(ResultCode.FORM_INFO_ERROR);
        
        // 判断图片验证码是否正确
        String validateCode = (String) session.getAttribute(SessionAttributes.VALIDATE_CODE);
        if (null == validateCode || !user.getImgCode().equalsIgnoreCase(validateCode)) {
            result.setMessage(Toolkits.defaultString(map.get("msg4")));
            result.setData("");
            return result;
        }
        if (null == user.getLoginId() || StringUtils.isBlank(user.getLoginId())) {
            result.setMessage(Toolkits.defaultString(map.get("msg1")));
            result.setData("");
            return result;
        }
        if (!Toolkits.isEmail(user.getLoginId()) && !Toolkits.isPhone(user.getLoginId())) {
            result.setMessage(Toolkits.defaultString(map.get("msg2")));
            result.setData(""); 
            return result;
        }
        if (null == user.getPassword() || StringUtils.isBlank(user.getPassword())) {
            result.setMessage(Toolkits.defaultString(map.get("msg3")));
            result.setData("");
            return result;
        }
        

        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("loginId", user.getLoginId());
        hashMap.put("password", user.getPassword());
        hashMap.put("ip", Toolkits.getIpAddress(request));
        hashMap.put("loginTime", new Date().getTime());
        try {
        	UserVO userVO = null;
        	// 判断用户是否已经登录，如果已经登录，提示不可重复登录
        	userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
        	if (null != userVO) {
        		result.setCode(ResultCode.FORM_INFO_ERROR);
        		result.setMessage(Toolkits.defaultString(map.get("msg6")));
        		result.setData("");
        		return result;
        	}
        	String json = userLoginService.login(request,hashMap);
        	// 如果用户登录成功,获取用户的登录状态
        	result = (ResponseResult) Toolkits.fromJsonToPojo(json, ResponseResult.class);
        	if (null != result) {
        		// 用户开启二步登录,并且用户第一步登录已经成功
        		if (result.getCode().equals(ResultCode.SECOND_LOGIN)) {
        			userVO = (UserVO) Toolkits.fromJsonToPojo(Toolkits.fromPojotoJson(result.getData()), UserVO.class);
        			// 记录用户第一步登录成功,并将状态码返回给前端判断是否前往第二步登录
        			session.setAttribute(SessionAttributes.LOGIN_FIRSTLOGIN,userVO);
        			
        			
        			// 测试数据，在用户第一次登录之后就存第二次登录的session，因为二步登录需要发送短信验证码的接口
        			session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, userVO);
        			
        			return result;
        		// 用户没有开启二次验证并且登录成功
        		}else if (result.getCode().equals(ResultCode.SUCCESS)){
        			userVO = (UserVO) Toolkits.fromJsonToPojo(Toolkits.fromPojotoJson(result.getData()), UserVO.class);
        			session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, userVO);
        		}
        	}
        	return Toolkits.handleResp(json);
        } catch (Exception e) {
        	result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg5")));
			result.setData("");
			log.error("{} 用户登录.处理后台返回的结果出现错误.",e.toString());
			return result;
		}
    }*/


    
    
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public Object userLogin (HttpServletRequest request,HttpServletResponse response,User user) throws IOException, ServletException{
    	ResponseResult result = new ResponseResult();
    	HttpSession session = request.getSession();
    	
    	result.setCode(ResultCode.FORM_INFO_ERROR);
    	
		UserVO userVO1 = new UserVO();
        // 测试数据，
		userVO1.setUid("fdafas");
        session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, userVO1);
        
    	result.setCode("205");
    	result.setMessage("成功");
    	result.setData("");
    	return result;
    }
    
    
    /**
     * @Author zhou
     * @Date 2018/5/28 14:33
     * @Param [request]
     * @Desc 用户登出
     */
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    @ResponseBody
    public Object userLogout (HttpServletRequest request){
    	HttpSession session = request.getSession();
    	 // 获取当前本地语言
        Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        Map<String,String> map = new HashMap<String,String>();
        ResponseResult result = new ResponseResult();
        if ("zh_CN".equals(locale.toString())) {
            map.put("msg1", "服务器异常,请稍后重试");
            map.put("msg2", "你还没有登录,请登录后重试");
        }
        if ("en_US".equals(locale.toString())) {
            map.put("msg1", "Server exception,please try again later.");
            map.put("msg2", "You haven't logged in yet,please login and try again");
        }
        
        HashMap<String, String> hashMap = new HashMap<String, String>();
    	try {
    		//得到用户session
    		UserVO userVO = (UserVO) request.getSession().getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
    		if (null != userVO) {
    			String uid = userVO.getUid();
    			hashMap.put("uid", uid);
    			String json = userLoginService.logout(request,hashMap);
    			result = (ResponseResult) Toolkits.fromJsonToPojo(json, ResponseResult.class);
    			// 如果后台确认了登出,清除session
    			if (null != result && result.getCode().equals(ResultCode.SUCCESS)) {
    				request.getSession().setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, null);
    			}
    			return Toolkits.handleResp(json);
    		}else {
    			result.setCode(ResultCode.FORM_INFO_ERROR);
    			result.setMessage(Toolkits.defaultString(map.get("msg2")));
    			result.setData("");
    			return result;
    		}
    	} catch (Exception e) {
    		result.setCode(ResultCode.SYSTEM_ERROR);
    		result.setMessage(Toolkits.defaultString(map.get("msg1")));
    		result.setData("");
    		log.error("{} 用户登出发生异常.",e.toString());
    		return result;
		}
    }
    
    
    
    @RequestMapping(value = "/resetPassword",method = RequestMethod.POST)
    @ResponseBody
    public Object resetPassword (HttpServletRequest request,@RequestParam String password){
    	HttpSession session = request.getSession();
    	ResponseResult result = new ResponseResult();
    	
    	
    	 // 从session中拿到在重置密码页面用户的账号
        String loginId = (String) session.getAttribute(SessionAttributes.USER_LOGINID);
        // 说明上一步 验证验证码失败，或者session失效
        if (null == loginId) {
        	result.setCode(ResultCode.FORM_INFO_ERROR);
        	result.setMessage(Toolkits.defaultString("session失效"));
        	result.setData("");
        	return result;
        }
    	result.setCode(ResultCode.SUCCESS);
		result.setMessage(Toolkits.defaultString("成功"));
		result.setData("");
		return result;
    }
    
    


    /**
     * @Author zhou
     * @Date 2018/5/28 16:23
     * @Param [request, user]
     * @Desc 重置登陆密码
     */
    /*@RequestMapping(value = "/resetPassword",method = RequestMethod.POST)
    @ResponseBody
    public Object resetPassword (HttpServletRequest request,@RequestParam String password){
        HttpSession session = request.getSession();
        // 获取当前本地语言
        Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        Map<String,String> map = new HashMap<String,String>();
        ResponseResult result = new ResponseResult();
        if ("zh_CN".equals(locale.toString())) {
            map.put("msg1","操作失败,请重试");
            map.put("msg2", "服务器异常,请稍后重试");
        }
        if ("en_US".equals(locale.toString())) {
            map.put("msg1", "The operation failure,please try again");
            map.put("msg2", "Server exception,please try again later.");
        }

        // 测试数据，   此处后台返回500
        session.setAttribute(SessionAttributes.USER_LOGINID, "13666666");
        
        // 从session中拿到在重置密码页面用户的账号
        String loginId = (String) session.getAttribute(SessionAttributes.USER_LOGINID);
        // 说明上一步 验证验证码失败，或者session失效
        if (null == loginId) {
        	result.setCode(ResultCode.FORM_INFO_ERROR);
        	result.setMessage(Toolkits.defaultString(map.get("msg1")));
        	result.setData("");
        	return result;
        }
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("loginId", loginId);
        hashMap.put("password", password);

        try {
        	String json = userLoginService.resetPassword(request,hashMap);
        	return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			result.setData("");
			log.error("{} 重置登录密码发生异常.",e.toString());
			return result;
		}
    }*/


    /**
     * @Author zhou
     * @Date 2018/5/31 10:21
     * @Param [request, nonce:时间戳]
     * @Desc 获取图像验证码
     */
   /* @RequestMapping(value = "/getImgCode",method = RequestMethod.GET)
    public void getImgCode (HttpServletRequest request, HttpServletResponse response,@RequestParam String nonce) throws IOException {
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("nonce", nonce);
        userLoginService.getImgCode(request,response,hashMap);
    }*/

}
