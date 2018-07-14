package com.gmebtc.web.portal.service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

public interface SecurityConterService {
    String modifyLoginPwd(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;

    String resetPayPasswordFirst(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;
    
    String resetPayPasswordSecond(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;

    String sendEmail(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;

    String identifyAuth(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;

    String checkHasIdentify(HttpServletRequest request) throws Exception;

    String payMethedBank(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;

    String payMethedAlipayWeChat(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;

    String checkUserIdentify(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;

    String bindPhone(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;

    String bindEmail(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;

    String emailActiveCheck(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;
    
    String checkEmailCode(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;
    
    String getSecurityLogList(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;
    
    String getSecurityOperationHistory(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;
    
    String systemTime(HttpServletRequest request, HashMap<String, String> hashMap) throws Exception;
}
