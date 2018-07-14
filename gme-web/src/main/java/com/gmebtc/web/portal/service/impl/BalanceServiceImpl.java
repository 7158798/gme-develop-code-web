package com.gmebtc.web.portal.service.impl;

import com.gmebtc.web.portal.service.BalanceService;
import com.gmebtc.web.portal.utils.SendRequestUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/*
 * @Author zhou
 * @Date 2018/5/29 18:02
 * @Desc 我的资产
 */
@Service(value = "balanceService")
public class BalanceServiceImpl implements BalanceService {


    /**
     * @throws Exception 
     * @Author zhou
     * @Date 2018/5/29 18:03
     * @Param [request]
     * @Desc 查询我的资产
     */
    @Override
    public String getBalance(HttpServletRequest request) throws Exception {
        String method = "getBalance";
        return SendRequestUtil.sendRequest(request, method);
    }
}
