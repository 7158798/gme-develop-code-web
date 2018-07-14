package com.gmebtc.web.portal.controller;

import com.gmebtc.web.portal.constant.ResultCode;
import com.gmebtc.web.portal.result.ResponseResult;
import com.gmebtc.web.portal.service.QuotationService;
import com.gmebtc.web.portal.utils.Toolkits;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/*
 * @Author zhou
 * @Date 2018/5/29 11:18
 * @Desc 行情及k线
 */
@RestController
@RequestMapping(value = "${ROOT_PATH}/kline")
public class QuotationController {
	private static final Logger log = LoggerFactory.getLogger(QuotationController.class);

    @Resource(name = "quotationService")
    private QuotationService quotationService;


    /**
     * @Author zhou
     * @Date 2018/5/29 11:53
     * @Param [request, symbol:交易对比如：（btc_usdt), type:时间]
     * @Desc k线接口
     */
    @RequestMapping(value = "/kline",method = RequestMethod.GET)
    public Object kline (HttpServletRequest request,@RequestParam String symbol,@RequestParam String type){
    	HttpSession session = request.getSession();
        // 获取当前本地语言
        Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        Map<String,String> map = new HashMap<String,String>();
        ResponseResult result = new ResponseResult();
        if ("zh_CN".equals(locale.toString())) {
            map.put("msg1", "服务器异常,请稍后重试");
        }
        if ("en_US".equals(locale.toString())) {
            map.put("msg1", "Server exception,please try again later.");
        }
    	
        HashMap<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("symbol", symbol);
        hashMap.put("type", type);
        try {
        	String json = quotationService.kline(request,hashMap);
        	return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} 获取k线数据发生异常.",e.toString());
			return result;
		}
    }


    /**
     * @Author zhou
     * @Date 2018/5/29 11:58
     * @Param [request, symbol:交易对比如：（btc_usdt)]
     * @Desc 币行情
     */
    @RequestMapping(value = "/ticker",method = RequestMethod.GET)
    public Object ticker (HttpServletRequest request,@RequestParam(required=false) String symbol){
    	HttpSession session = request.getSession();
        HashMap<String, String> hashMap = new HashMap<String, String>();
        ResponseResult result = new ResponseResult();
        
        try {
        	/*String json = "{\r\n" + 
        			"	\"code\": \"200\",\r\n" + 
        			"	\"message\": \"成功\",\r\n" + 
        			"	\"data\": {\r\n" + 
        			"		\"realTime\": \"8.88 \",\r\n" + 
        			"		\"highsAndLows\": \"6.66 \",\r\n" + 
        			"		\"highest\": \"9.99 \",\r\n" + 
        			"		\"lowest\": \"6.88 \"\r\n" + 
        			"	}\r\n" + 
        			"}";
        	String json2 = "{\r\n" + 
        			"	\"code\": \"200\",\r\n" + 
        			"	\"message\": \"成功\",\r\n" + 
        			"	\"data\": {\r\n" + 
        			"		\"realTime\": \"23.3 \",\r\n" + 
        			"		\"highsAndLows\": \"54 \",\r\n" + 
        			"		\"highest\": \"23 \",\r\n" + 
        			"		\"lowest\": \"65 \"\r\n" + 
        			"	}\r\n" + 
        			"}";
        	return json;*/
        	
        	if (null != symbol) {
            	hashMap.put("symbol", symbol);
            	String json = quotationService.ticker(request,hashMap);
            	log.info("请求的方法：QuotationController - ticker" );
            	return Toolkits.handleResp(json);
            }else {
            	String json = quotationService.ticker(request);
            	log.info("请求的方法：QuotationController - ticker" );
            	return Toolkits.handleResp(json);
            }
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setData("");
			log.error("{} 获取行情发生异常.",e.toString());
			return result;
		}
        
    }
    
}
