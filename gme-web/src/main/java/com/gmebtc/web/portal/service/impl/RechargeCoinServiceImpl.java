package com.gmebtc.web.portal.service.impl;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.gmebtc.web.portal.service.RechargeCoinService;
import com.gmebtc.web.portal.utils.ConfigUtil;
import com.gmebtc.web.portal.utils.SendRequestUtil;

/*
 * @Author zhou
 * @Date 2018/5/31 16:06
 * @Desc 充币
 */
@Service(value = "rechargeCoinService")
public class RechargeCoinServiceImpl implements RechargeCoinService {
    
    

    /**
     * @Author zhou
     * @Date 2018/5/31 16:28
     * @Param [request, hashMap]
     * @Desc 查询充币记录
     */
    
    public String getWalletRechargeRecord(HttpServletRequest request, HashMap<String, Object> hashMap) {
        String method = ConfigUtil.get("WALLET_RECHARGERECORD");
        return SendRequestUtil.sendMapRequest(request, hashMap, method);
    }
    
    
    /**
     * 
     * @Title: getRechargeAddress
     * @Description: TODO 查询充币地址
     * @param @param request
     * @param @param hashMap
     * @param @return
     * @return String
     * @throws
     */
    @Override
	public String getRechargeAddress(HttpServletRequest request, HashMap<String, Object> hashMap) {
		String method = ConfigUtil.get("WALLET_RECHARGERECORD");
        return SendRequestUtil.sendMapRequest(request, hashMap, method);
	}

}
