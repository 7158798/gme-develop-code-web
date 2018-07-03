package com.gmebtc.web.portal.service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

public interface NoticeService {

    String getCoinIntroduce(HttpServletRequest request, HashMap<String, String> hashMap);

    String getNotice(HttpServletRequest request, HashMap<String, String> hashMap);
}
