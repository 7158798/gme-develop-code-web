package com.gmebtc.web.portal.controller;

import java.util.HashMap;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.gmebtc.web.portal.constant.ResultCode;
import com.gmebtc.web.portal.result.ResponseResult;
import com.gmebtc.web.portal.service.CoinToCoinService;
import com.gmebtc.web.portal.utils.Toolkits;


/*
 * @Author zhou
 * @Date 2018/5/30 16:58
 * @Desc 币币交易
 */
@RestController
@RequestMapping(value = "${ROOT_PATH}/coin")
public class CoinToCoinController {

	
	private static final Logger log = LoggerFactory.getLogger(CoinToCoinController.class);

    @Resource(name = "coinToCoinService")
    private CoinToCoinService coinToCoinService;


    
    /**
     * 
    * @Title: cancelBBOrder  
    * @Description: 取消订单 
    * @param request
    * @param orderNum
    * @return
    * @return Object
     */
    @RequestMapping(value = "/cancelCoinOrder", method = RequestMethod.POST)
    public Object cancelCoinOrder(HttpServletRequest request,@RequestParam String orderId) {
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("orderId", orderId);
        
        try {
        	String json = coinToCoinService.cancelCoinOrder(request,hashMap);
            return Toolkits.handleResp(json);
		} catch (Exception e) {
			ResponseResult result = new ResponseResult();
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setData("");
			log.error("{} 取消订单 发生异常.", e.toString());
			return result;
		}
    }


    
    /**
     * 
    * @Title: bbBuySell  
    * @Description: 币币交易 
    * @param request
    * @param pairId 币种交易对编号
    * @param amount 数量
    * @param type 1买 2卖
    * @param price 价格
    * @param tradeAuth 资金密码
    * @return
    * @return Object
     */
    @RequestMapping(value = "/bbBuySell", method = RequestMethod.POST)
    public Object bbBuySell(HttpServletRequest request, @RequestParam String pairId, @RequestParam String amount
            , @RequestParam String type, @RequestParam String price, @RequestParam String tradeAuth) {
        HttpSession session = request.getSession();
        Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        HashMap<String, String> map = new HashMap<>();
        ResponseResult result = new ResponseResult();
        if ("zh_CN".equals(locale.toString())) {
            map.put("msg1", "交易数量不能为空");
            map.put("msg2", "交易价格不能为空");
            map.put("msg3", "资金密码不能为空");
        }
        if ("en_US".equals(locale.toString())) {
            map.put("msg1", "The number of transactions cannot be empty");
            map.put("msg2", "Trading prices cannot be empty");
            map.put("msg3", "Capital cipher can not be empty");
        }
        
        result.setCode(ResultCode.FORM_INFO_ERROR);
        result.setData("");
        
        if (null == amount || StringUtils.isBlank(amount)) {
            result.setMessage(Toolkits.defaultString(map.get("msg1")));
            return result;
        }
        if (null == price || StringUtils.isBlank(price)) {
        	result.setMessage(Toolkits.defaultString(map.get("msg2")));
        	return result;
        }
        if (null == tradeAuth || StringUtils.isBlank(tradeAuth)) {
            result.setMessage(Toolkits.defaultString(map.get("msg3")));
            return result;
        }

        
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("coinTradeId", pairId);
        hashMap.put("amount", amount);
        hashMap.put("type", type);
        hashMap.put("price", price);
        hashMap.put("payPassword", tradeAuth);
        
        try {
        	String json = coinToCoinService.bbBuySell(request, hashMap);
            return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setData("");
			log.error("{} 币币交易  发生异常", e.toString());
			return result;
		}
    }



    /**
     * 
    * @Title: realTimeTradeRecord  
    * @Description: 平台实时交易记录
    * @param request
    * @param pairId
    * @param page
    * @param pageSize
    * @return
    * @return Object
     */
    @RequestMapping(value = "/realTimeTradeRecord", method = RequestMethod.GET)
    public Object realTimeTradeRecord(HttpServletRequest request, @RequestParam String pairId, @RequestParam(defaultValue = "1") String page
            , @RequestParam(defaultValue="40") String pageSize) {
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("pairId", pairId);
        hashMap.put("page", page);
        hashMap.put("pageSize", pageSize);
       
        try {
        	 String json = coinToCoinService.realTimeTradeRecord(request, hashMap);
             return Toolkits.handleResp(json);
		} catch (Exception e) {
			ResponseResult result = new ResponseResult();
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setData("");
			log.error("{} 平台实时交易记录 发生异常", e.toString());
			return result;
		}
    }


    /**
     * 
    * @Title: getUserTransactions  
    * @Description:  查询我的交易记录
    * @param request
    * @param pairId
    * @param page
    * @param pageSize
    * @return
    * @return Object
     */
    @RequestMapping(value = "/transRecord", method = RequestMethod.POST)
    public Object transRecord(HttpServletRequest request, @RequestParam String pairId,@RequestParam String type
            , @RequestParam(defaultValue = "1") String page,@RequestParam(defaultValue = "10") String pageSize) {
        HashMap<String, String> hashMap = new HashMap<String, String>();
        
        hashMap.put("pairId", pairId);
        hashMap.put("type", type);
        hashMap.put("page", page);
        hashMap.put("pageSize",pageSize);
       
        try {
        	 String json = coinToCoinService.transRecord(request, hashMap);
             return Toolkits.handleResp(json);
		} catch (Exception e) {
			ResponseResult result = new ResponseResult();
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setData("");
			log.error("{} 查询我的交易记录 发生异常.", e.toString());
			return result;
		}

    } 


    /**
     * 
    * @Title: entrustRecord  
    * @Description: 我的委托记录 
    * @param request
    * @param pairId
    * @param type 	1买，2卖，3全部
    * @param page
    * @param pageSize
    * @return
    * @return Object
     */
    @RequestMapping(value = "/entrustRecord", method = RequestMethod.POST)
    @ResponseBody
    public Object entrustRecord (HttpServletRequest request,@RequestParam String pairId,@RequestParam String type
                                ,@RequestParam(defaultValue = "1") String page,@RequestParam(defaultValue="10") String pageSize){
        HashMap<String, String> hashMap = new HashMap<String, String>();
        
        hashMap.put("pairId", pairId);
        hashMap.put("type", type);
        hashMap.put("page", page);
        hashMap.put("pageSize", pageSize);
        
        try {
        	String json = coinToCoinService.entrustRecord(request, hashMap);
            return Toolkits.handleResp(json);
		} catch (Exception e) {
			ResponseResult result = new ResponseResult();
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setData("");
			log.error("{} 我的委托记录 发生异常.", e.toString());
			return result;
		}
    }


    
    /**
     * 
    * @Title: getBuySellOrders  
    * @Description: 买卖委托单 
    * @param request
    * @param coinTradeId
    * @param type
    * @param pageSize
    * @return
    * @return Object
     */
    @RequestMapping(value = "/buySellOrders",method = RequestMethod.GET)
    public Object getBuySellOrders (HttpServletRequest request,@RequestParam String pairId,@RequestParam(defaultValue="20") String pageSize){
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("pairId", pairId);
        hashMap.put("pageSize", pageSize);
       
        try {
        	 String json = coinToCoinService.getBuySellOrders(request,hashMap);
             return Toolkits.handleResp(json);
		} catch (Exception e) {
			ResponseResult result = new ResponseResult();
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setData("");
			log.error("{} 买卖委托单  发生异常.", e.toString());
			return result;
		}
    }
    
    
    
    
    
    
    /**
     * 
    * @Title: queryDetial  
    * @Description: 查询详情 
    * @param request
    * @param orderId
    * @return
    * @return Object
     */
    @RequestMapping(value = "/queryDetial",method = RequestMethod.POST)
    public Object queryDetial (HttpServletRequest request,@RequestParam String orderId){
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("orderId", orderId);
       
        try {
        	 String json = coinToCoinService.queryDetial(request,hashMap);
             return Toolkits.handleResp(json);
		} catch (Exception e) {
			ResponseResult result = new ResponseResult();
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setData("");
			log.error("{} 查询详情   发生异常.", e.toString());
			return result;
		}
    }
    
    
}
