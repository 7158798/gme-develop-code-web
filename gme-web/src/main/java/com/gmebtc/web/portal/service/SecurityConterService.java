package com.gmebtc.web.portal.service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

public interface SecurityConterService {
    String modifyLoginPwd(HttpServletRequest request, HashMap<String, String> hashMap);

    String resetPayPasswordFirst(HttpServletRequest request, HashMap<String, String> hashMap);
    
    String resetPayPasswordSecond(HttpServletRequest request, HashMap<String, String> hashMap);

    String sendEmail(HttpServletRequest request, HashMap<String, String> hashMap);

    String identifyAuth(HttpServletRequest request, HashMap<String, String> hashMap);

    String checkHasIdentify(HttpServletRequest request);

    String payMethedBank(HttpServletRequest request, HashMap<String, String> hashMap);

    String payMethedAlipayWeChat(HttpServletRequest request, HashMap<String, String> hashMap);

    String checkUserIdentify(HttpServletRequest request, HashMap<String, String> hashMap);

    String bindPhone(HttpServletRequest request, HashMap<String, String> hashMap);

    String bindEmail(HttpServletRequest request, HashMap<String, String> hashMap);

    String emailActiveCheck(HttpServletRequest request, HashMap<String, String> hashMap);
    
    String checkEmailCode(HttpServletRequest request, HashMap<String, String> hashMap);
}
