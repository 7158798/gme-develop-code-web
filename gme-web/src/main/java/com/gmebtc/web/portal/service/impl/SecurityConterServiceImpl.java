package com.gmebtc.web.portal.service.impl;

import com.gmebtc.web.portal.service.SecurityConterService;
import com.gmebtc.web.portal.utils.ConfigUtil;
import com.gmebtc.web.portal.utils.SendRequestUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

/*
 * @Author zhou
 * @Date 2018/5/30 18:26
 * @Desc 安全中心
 */
@Service(value = "securityConterService")
public class SecurityConterServiceImpl implements SecurityConterService {

    /**
     * @throws Exception 
     * @Author zhou
     * @Date 2018/5/30 18:50
     * @Param [request, hashMap]
     * @Desc 修改登录密码
     */
    @Override
    public String modifyLoginPwd(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
        String method = "modifyLoginPwd&";
        return SendRequestUtil.sendMapRequest(request, hashMap, method);
    }

    

    /**
     * @throws Exception 
     * @Author zhou
     * @Date 2018/5/30 20:05
     * @Param [request, hashMap]
     * @Desc 发生邮件
     */
    @Override
    public String sendEmail(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
       String method = ConfigUtil.get("SECURITY_SENDEMAIL");
       return SendRequestUtil.sendMapRequest(request, hashMap, method);
    }

    /**
     * @throws Exception 
     * @Author zhou
     * @Date 2018/5/30 20:21
     * @Param [request, hashMap]
     * @Desc 实名认证
     */
    @Override
    public String identifyAuth(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
       String method = ConfigUtil.get("SECURITY_IDENTIFYAUTH");
        return SendRequestUtil.sendMapRequest(request, hashMap, method);
    }


    /**
     * @throws Exception 
     * @Author zhou
     * @Date 2018/5/30 20:27
     * @Param [request]
     * @Desc 检验是否实名认证
     */
    @Override
    public String checkHasIdentify(HttpServletRequest request) throws Exception {
        String method = "checkHasIdentify&";
        return SendRequestUtil.sendRequest(request, method);
    }


    /**
     * @throws Exception 
     * @Author zhou
     * @Date 2018/5/30 20:48
     * @Param [request, hashMap]
     * @Desc 绑定银行卡
     */
    @Override
    public String payMethedBank(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
        String method = ConfigUtil.get("SECURITY_PAYMETHODBANK");
        return SendRequestUtil.sendMapRequest(request, hashMap, method);
    }


    /**
     * @throws Exception 
     * @Author zhou
     * @Date 2018/5/30 21:01
     * @Param [request, hashMap]
     * @Desc 绑定支付宝或者微信
     */
    @Override
    public String payMethedAlipayWeChat(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
        String method = ConfigUtil.get("SECURITY_PAYMETHODALI");
        return SendRequestUtil.sendMapRequest(request, hashMap, method);
    }


   /**
    * 
    * Title: checkUserIdentify
    * Description: 检查用户信息
    * @param request
    * @param hashMap
    * @return  
 * @throws Exception 
    * @see com.gmebtc.web.portal.service.SecurityConterService#checkUserIdentify(javax.servlet.http.HttpServletRequest, java.util.HashMap)
    */
    @Override
    public String checkUserIdentify(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
        String method = ConfigUtil.get("SECURITY_CHECKUSERIDENTIFY");
        return SendRequestUtil.sendMapRequest(request, hashMap, method);
    }


    /**
     * @throws Exception 
     * @Author zhou
     * @Date 2018/5/30 21:25
     * @Param [request, hashMap]
     * @Desc 绑定手机号
     */
    @Override
    public String bindPhone(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
        String method = ConfigUtil.get("SECURITY_BINDPHONE");
        return SendRequestUtil.sendMapRequest(request, hashMap, method);
    }


    /**
     * @throws Exception 
     * @Author zhou
     * @Date 2018/5/30 21:30
     * @Param [request, hashMap]
     * @Desc 绑定邮箱
     */
    @Override
    public String bindEmail(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
        String method = ConfigUtil.get("SECURITY_BINDEMAIL");
        return SendRequestUtil.sendMapRequest(request, hashMap, method);
    }


    /**
     * @throws Exception 
     * @Author zhou
     * @Date 2018/5/31 20:57
     * @Param [request, hashMap]
     * @Desc 邮箱激活验证
     */
    @Override
    public String emailActiveCheck(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
    	 String method = ConfigUtil.get("SECURITY_ACTIVECHECK");
         return SendRequestUtil.sendMapRequest(request, hashMap, method);
    }

    
    /**
     * @throws Exception 
     * @Author zhou
     * @Param [request, hashMap]
     * @Desc 验证邮箱验证码
     */
	public String checkEmailCode(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
		String method = ConfigUtil.get("SECURITY_CHECKEMAILCODE");
		return SendRequestUtil.sendMapRequest(request, hashMap, method);
	}

	
	
	 /**
     * 
     * Title: resetPayPasswordFirst
     * Description: 修改资金密码第一步
     * @param request
     * @param hashMap
     * @return  
	 * @throws Exception 
     * @see com.gmebtc.web.portal.service.SecurityConterService#resetPayPasswordFirst(javax.servlet.http.HttpServletRequest, java.util.HashMap)
     */
    @Override
    public String resetPayPasswordFirst(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
        String method = ConfigUtil.get("SECURITY_RESETPAYPWDFIRST");
        return SendRequestUtil.sendMapRequest(request, hashMap, method);
    }
	
	
	/**
	 * 
	 * Title: resetPayPasswordSecond
	 * Description: 修改资金密码第
	 * @param request
	 * @param hashMap
	 * @return  
	 * @throws Exception 
	 * @see com.gmebtc.web.portal.service.SecurityConterService#resetPayPasswordSecond(javax.servlet.http.HttpServletRequest, java.util.HashMap)
	 */
	@Override
	public String resetPayPasswordSecond(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
		String method = ConfigUtil.get("SECURITY_RESETPAYPWDSECOND");
		return SendRequestUtil.sendMapRequest(request, hashMap, method);
	}



	/**
	 * 
	 * Title: getSecurityLogList
	 * Description: 查询安全日志
	 * @param request
	 * @param hashMap
	 * @return  
	 * @throws Exception 
	 * @see com.gmebtc.web.portal.service.SecurityConterService#getSecurityLogList(javax.servlet.http.HttpServletRequest, java.util.HashMap)
	 */
	@Override
	public String getSecurityLogList(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
		String method = ConfigUtil.get("aa");
		return SendRequestUtil.sendMapRequest(request, hashMap, method);
	}



	/**
	 * 
	 * Title: getSecurityOperationHistory
	 * Description: 查询安全设置历史
	 * @param request
	 * @param hashMap
	 * @return  
	 * @throws Exception 
	 * @see com.gmebtc.web.portal.service.SecurityConterService#getSecurityOperationHistory(javax.servlet.http.HttpServletRequest, java.util.HashMap)
	 */
	@Override
	public String getSecurityOperationHistory(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
		String method = ConfigUtil.get("aa");
		return SendRequestUtil.sendMapRequest(request, hashMap, method);
	}



	/**
	 * 
	 * Title: systemTime
	 * Description: 查询当前服务器时间
	 * @param request
	 * @param hashMap
	 * @return  
	 * @throws Exception 
	 * @see com.gmebtc.web.portal.service.SecurityConterService#systemTime(javax.servlet.http.HttpServletRequest, java.util.HashMap)
	 */
	@Override
	public String systemTime(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception {
		String method = ConfigUtil.get("aa");
		return SendRequestUtil.sendMapRequest(request, hashMap, method);
	}
}
