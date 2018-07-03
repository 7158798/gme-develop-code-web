package com.gmebtc.web.portal.service.impl;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.gmebtc.web.portal.service.QuotationService;
import com.gmebtc.web.portal.utils.ConfigUtil;
import com.gmebtc.web.portal.utils.SendRequestUtil;

@Service(value = "quotationService")
public class QuotationServiceImpl implements QuotationService {

    
    

    /**
     * @Author zhou
     * @Date 2018/5/29 11:54
     * @Param [request, map]
     * @Desc k线接口
     */
    @Override
    public String kline(HttpServletRequest request,HashMap<String, String> hashMap) {
        String method = ConfigUtil.get("KLINE_KLINE");
        return SendRequestUtil.sendMapRequest(request,hashMap, method);
    }


    /**
     * @Author zhou
     * @Date 2018/5/29 12:00
     * @Param [request, map]
     * @Desc 币行情
     */
    @Override
    public String ticker(HttpServletRequest request,HashMap<String, String> hashMap) {
        String method = "ticker&";
        return SendRequestUtil.sendMapRequest(request,hashMap, method);
    }
}
