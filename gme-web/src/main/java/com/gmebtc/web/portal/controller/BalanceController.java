package com.gmebtc.web.portal.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gmebtc.web.portal.constant.ResultCode;
import com.gmebtc.web.portal.result.ResponseResult;
import com.gmebtc.web.portal.service.BalanceService;
import com.gmebtc.web.portal.utils.Toolkits;

/*
 * @Author zhou
 * @Date 2018/5/29 17:59
 * @Desc 我的资产
 */
@RestController
@RequestMapping("${ROOT_PATH}/finance")
public class BalanceController {
	
	private static final Logger log = LoggerFactory.getLogger(BalanceController.class);
	
	@Resource(name = "balanceService")
	private BalanceService balanceService;

	
	
	/**
	 * 
	* @Title: getBalance  
	* @Description: 查询我的资产 
	* @param request
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/balance", method = RequestMethod.GET)
	public Object getBalance(HttpServletRequest request) {

		try {
			String json = "{\n" + 
					"	\"code\": 200,\n" + 
					"	\"message\": \"成功\",\n" + 
					"	\"data\": {\n" + 
					"		\"balance_btc\": 877.56344807,\n" + 
					"		\"balance_cny\": 879.17589153,\n" + 
					"		\"coins\": [{\n" + 
					"				\"symbol\": \"BTC\",\n" + 
					"				\"number\": 877.56344807,\n" + 
					"				\"frozenNumber\": 877.56344807\n" + 
					"			},\n" + 
					"			{\n" + 
					"				\"symbol\": \"BTC\",\n" + 
					"				\"number\": 877.56344807,\n" + 
					"				\"frozenNumber\": 877.56344807\n" + 
					"			},\n" + 
					"			{\n" + 
					"				\"symbol\": \"BTC\",\n" + 
					"				\"number\": 877.56344807,\n" + 
					"				\"frozenNumber\": 877.56344807\n" + 
					"			}\n" + 
					"		]\n" + 
					"	}\n" + 
					"}";
			return json;
			/*String json = balanceService.getBalance(request);
			return Toolkits.handleResp(json);*/
		} catch (Exception e) {
			ResponseResult result = new ResponseResult();
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setData("");
			log.error("{} 查询我的资产 解析后台数据发生异常", e.toString());
			return result;
		}
	}

}
