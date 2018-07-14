package com.gmebtc.web.portal.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.gmebtc.web.portal.constant.ResultCode;
import com.gmebtc.web.portal.entity.BusOTCOrder;
import com.gmebtc.web.portal.result.ResponseResult;
import com.gmebtc.web.portal.service.OtcService;
import com.gmebtc.web.portal.utils.Toolkits;
import com.gmebtc.web.portal.vo.C2CTransRecordVO;
import com.gmebtc.web.portal.vo.PageBean;
import com.gmebtc.web.portal.vo.PageVO;

/**
 * 
 * @Project：gme-web
 * @Class：OtcController
 * @Description 类描述：c2c相关
 * @Author：zzh
 * @Date：2018年7月6日 下午8:52:45
 * @version v1.0
 */
@RestController
@RequestMapping("${ROOT_PATH}/otc")
public class OtcController {

	private static final Logger log = LoggerFactory.getLogger(OtcController.class);

	@Resource(name = "otcService")
	private OtcService otcService;

	/**
	 * 
	 * @Title: checkPayMethod
	 * @Description: 检查是否选择支付方式
	 * @param payMehtod
	 * @return
	 * @return boolean
	 */
	private static boolean checkPayMethod(String payMehtod) {
		StringBuffer methodStr = new StringBuffer(payMehtod);

		if (methodStr.length() != 6) {
			return false;
		} else {
			if ((methodStr.indexOf("1") == -1) && (methodStr.indexOf("2") == -1)) {
				return false;
			}
			if (methodStr.indexOf("1") != -1) {
				int zeroIndex = methodStr.indexOf("1") - 1;
				if (zeroIndex < 0 || methodStr.charAt(zeroIndex) != '0') {
					return false;
				}
			}
			if (methodStr.indexOf("2") != -1) {
				int zeroIndex = methodStr.indexOf("2") - 1;
				if (zeroIndex < 0 || methodStr.charAt(zeroIndex) != '0') {
					return false;
				}
			}
		}
		return true;
	}

	/**
	 * 
	 * @Title: busBuyAndSellOrder
	 * @Description: 商家买卖usdt
	 * @param request
	 * @param busOTCOrder
	 * @return
	 * @return Object
	 */
	@RequestMapping(value = "/busBuyAndSell", method = RequestMethod.POST)
	public Object busBuyAndSellOrder(HttpServletRequest request, BusOTCOrder busOTCOrder) {
		HttpSession session = request.getSession();
		// 获取当前本地语言
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		Map<String, String> map = new HashMap<String, String>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "请输入价格");
			map.put("msg2", "请输入数量");
			map.put("msg3", "请输入最小限额");
			map.put("msg4", "请输入最大限额");
			map.put("msg5", "请输入选择支付方式");
			map.put("msg6", "请先绑定支付宝");
			map.put("msg7", "请先绑定微信");
			map.put("msg8", "请先绑定银行卡");
			map.put("msg9", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Please enter the price");
			map.put("msg2", "Please enter the quantity");
			map.put("msg3", "Please enter a minimum");
			map.put("msg4", "Please enter a maximum");
			map.put("msg5", "Please enter the payment option");
			map.put("msg6", "Please bind alipay first");
			map.put("msg7", "Please bind WeChat first");
			map.put("msg8", "Please bind your bank card first");
			map.put("msg9", "Server exception,please try again later");
		}

		result.setCode(ResultCode.FORM_INFO_ERROR);
		result.setData("");

		if (null == busOTCOrder.getPrice()) {
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			return result;
		}
		if (null == busOTCOrder.getNumber()) {
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			return result;
		}
		if (null == busOTCOrder.getMinMoney()) {
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			return result;
		}
		if (null == busOTCOrder.getMaxMoney()) {
			result.setMessage(Toolkits.defaultString(map.get("msg4")));
			return result;
		}
		if (null == busOTCOrder.getPayMethod() || StringUtils.isBlank(busOTCOrder.getPayMethod())) {
			result.setMessage(Toolkits.defaultString(map.get("msg5")));
			return result;
		}
		if (!OtcController.checkPayMethod(busOTCOrder.getPayMethod())) {
			result.setMessage(Toolkits.defaultString(map.get("msg5")));
			return result;
		}

		// 检查用户信息,是否绑定支付方式
		// Todo

		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");
		hashMap.put("currencyId", "gme-otc-rpc-service");
		hashMap.put("number", busOTCOrder.getNumber());
		hashMap.put("minMoney", busOTCOrder.getMinMoney());
		hashMap.put("maxMoney", busOTCOrder.getMaxMoney());
		hashMap.put("price", busOTCOrder.getPrice());
		hashMap.put("payMethod", busOTCOrder.getPayMethod());
		hashMap.put("type", busOTCOrder.getType());

		try {
			String json = otcService.busBuyAndSell(request, hashMap);
			return Toolkits.handleResp(json);
			/*
			 * String json = "{\r\n" + "	\"code\": \"200\",\r\n" +
			 * "	\"message\": \"成功\",\r\n" + "	\"data\": {\r\n" +
			 * "		\"realTime \": \"8.88 \",\r\n" +
			 * "		\"highsAndLows \": \"6.66 \",\r\n" +
			 * "		\"highest \": \"9.99 \",\r\n" + "		\"lowest \": \"6.88 \"\r\n"
			 * + "	}\r\n" + "}"; return json;
			 */
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg9")));
			result.setData("");
			log.error("{} 商家买卖usdt发生异常.", e.toString());
			return result;
		}

	}

	/**
	 * 
	 * @Title: getDeityList
	 * @Description: 查询所有商家挂单
	 * @param request
	 * @param type    1 购买 2 出售
	 * @return
	 * @return Object
	 */
	@RequestMapping(value = "/deityList", method = RequestMethod.GET)
	public Object getDeityList(HttpServletRequest request, String type, String symbol) {
		HttpSession session = request.getSession();
		// 获取当前本地语言
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		Map<String, String> map = new HashMap<String, String>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Server exception,please try again later");
		}

		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("symbol", symbol);
		hashMap.put("pageCount", "20");
		hashMap.put("type", type);

		try {
			String json = otcService.getDeityList(request, hashMap);
			return Toolkits.handleResp(json);
			/*
			 * String json = "{\r\n" + "	\"code\": \"200\",\r\n" +
			 * "	\"message\": \"成功\",\r\n" + "	\"data\": {\r\n" +
			 * "		\"realTime \": \"8.88 \",\r\n" +
			 * "		\"highsAndLows \": \"6.66 \",\r\n" +
			 * "		\"highest \": \"9.99 \",\r\n" + "		\"lowest \": \"6.88 \"\r\n"
			 * + "	}\r\n" + "}"; return json;
			 */
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} 查询所有商家挂单 发生异常.", e.toString());
			return result;
		}
	}

	
	/**
	 * 
	* @Title: getDeityList  
	* @Description: 查询我的商家订单 
	* @param request
	* @param symbol
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/busOrderList", method = RequestMethod.GET)
	public Object getBusOrderList(HttpServletRequest request, String symbol) {
		HttpSession session = request.getSession();
		// 获取当前本地语言
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		Map<String, String> map = new HashMap<String, String>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Server exception,please try again later");
		}

		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("symbol", symbol);
		hashMap.put("pageCount", "20");
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");

		try {
			String json = otcService.getDeityList(request, hashMap);
			return Toolkits.handleResp(json);
			/*
			 * String json = "{\r\n" + "	\"code\": \"200\",\r\n" +
			 * "	\"message\": \"成功\",\r\n" + "	\"data\": {\r\n" +
			 * "		\"realTime \": \"8.88 \",\r\n" +
			 * "		\"highsAndLows \": \"6.66 \",\r\n" +
			 * "		\"highest \": \"9.99 \",\r\n" + "		\"lowest \": \"6.88 \"\r\n"
			 * + "	}\r\n" + "}"; return json;
			 */
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} 查询我的商家挂单 发生异常.", e.toString());
			return result;
		}
	}

	
	
	
	/**
	 * 
	* @Title: c2cUserOrderHistory  
	* @Description:  c2c用户订单分页查询  
	* @param request
	* @param c2cTransRecordVO
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/userOrderHistory", method = RequestMethod.GET)
	public Object c2cUserOrderHistory(HttpServletRequest request, C2CTransRecordVO c2cTransRecordVO) {
		HttpSession session = request.getSession();
		// 获取当前本地语言
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		Map<String, String> map = new HashMap<String, String>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Server exception,please try again later");
		}

		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (null != c2cTransRecordVO.getStartTime() && !StringUtils.isBlank(c2cTransRecordVO.getStartTime())) {
				Long startTime = simple.parse(c2cTransRecordVO.getStartTime()).getTime();
				hashMap.put("startTime", startTime);
			}
			if (null != c2cTransRecordVO.getEndTime() && !StringUtils.isBlank(c2cTransRecordVO.getEndTime())) {
				Long endTime = simple.parse(c2cTransRecordVO.getEndTime()).getTime();
				hashMap.put("endTime", endTime);
			}
		} catch (Exception e) {
			log.error("{} c2c用户订单分页查询  页面时间转换失败");
		}

		
		hashMap.put("symbol", "usdt");
		if (null != c2cTransRecordVO.getSymbol()) {
			hashMap.put("symbol", c2cTransRecordVO.getSymbol());
		}
		if (null != c2cTransRecordVO.getType()) {
			hashMap.put("type", c2cTransRecordVO.getType());
		}
		if (null != c2cTransRecordVO.getStatus()) {
			hashMap.put("status", c2cTransRecordVO.getStatus());
		}

		hashMap.put("pageNum", c2cTransRecordVO.getPageNum());
		hashMap.put("numPerPage", c2cTransRecordVO.getNumPerPage());
		hashMap.put("uid", "1111");

		try {

			// 先判断用户是否绑定过手机，如果没有绑定手机，就不需要向后台请求数据
			/*
			 * Boolean flag = (Boolean)
			 * session.getAttribute(SessionAttributes.USER_ISBINDPHONE); if (!flag) {
			 * model.addAttribute("list", null); return "record/withdrawRecord"; }
			 */

			/*String json = otcService.c2cUserOrderHistory(request, hashMap);
			return Toolkits.handleResp(json);*/
			String json = "{\r\n" + 
					"	\"code\": \"200\",\r\n" + 
					"	\"message\": \"Successful\",\r\n" + 
					"	\"data\": {\r\n" + 
					"		\"currentPage\": 1,\r\n" + 
					"		\"numPerPage\": 10,\r\n" + 
					"		\"totalCount\": 28,\r\n" + 
					"		\"recordList\": [{\r\n" + 
					"			\"entryOrderId\": \"\",\r\n" + 
					"			\"currencyId\": \"\",\r\n" + 
					"			\"uid\": \"1111\",\r\n" + 
					"			\"price\": 10.00000000,\r\n" + 
					"			\"number\": 1.00000000,\r\n" + 
					"			\"amount\": 1.00000000,\r\n" + 
					"			\"status\": 1,\r\n" + 
					"			\"type\": 2,\r\n" + 
					"			\"payMethod\": \"010101\",\r\n" + 
					"			\"createTime\": \"2018-07-10 10:48\",\r\n" + 
					"			\"targetUid\": \"11\",\r\n" + 
					"			\"targetName\": \"ld\",\r\n" + 
					"			\"bankName\": \"中商银行\",\r\n" + 
					"			\"bankBranch\": \"酹太想爱你支行\",\r\n" + 
					"			\"bankCardNumber\": \"42108234234324324321\",\r\n" + 
					"			\"alipayAccount\": \"242\",\r\n" + 
					"			\"alipayImg\": \"2342\",\r\n" + 
					"			\"wxAccount\": \"242\",\r\n" + 
					"			\"wxImg\": \"2342\"\r\n" + 
					"		}, {\r\n" + 
					"			\"entryOrderId\": \"1\",\r\n" + 
					"			\"currencyId\": \"\",\r\n" + 
					"			\"uid\": \"1111\",\r\n" + 
					"			\"price\": 10.00000000,\r\n" + 
					"			\"number\": 1.00000000,\r\n" + 
					"			\"amount\": 1.00000000,\r\n" + 
					"			\"status\": 1,\r\n" + 
					"			\"type\": 1,\r\n" + 
					"			\"payMethod\": \"010101\",\r\n" + 
					"			\"createTime\": \"2018-07-10 09:38\",\r\n" + 
					"			\"targetUid\": \"11\",\r\n" + 
					"			\"targetName\": \"ld\",\r\n" + 
					"			\"bankName\": \"1\",\r\n" + 
					"			\"bankBranch\": \"1\",\r\n" + 
					"			\"bankCardNumber\": \"1\",\r\n" + 
					"			\"alipayAccount\": \"1\",\r\n" + 
					"			\"alipayImg\": \"1\",\r\n" + 
					"			\"wxAccount\": \"1\",\r\n" + 
					"			\"wxImg\": \"1\"\r\n" + 
					"		}, {\r\n" + 
					"			\"entryOrderId\": \"2\",\r\n" + 
					"			\"currencyId\": \"\",\r\n" + 
					"			\"uid\": \"1111\",\r\n" + 
					"			\"price\": 10.00000000,\r\n" + 
					"			\"number\": 1.00000000,\r\n" + 
					"			\"amount\": 1.00000000,\r\n" + 
					"			\"status\": 1,\r\n" + 
					"			\"type\": 1,\r\n" + 
					"			\"payMethod\": \"010101\",\r\n" + 
					"			\"createTime\": \"2018-07-07 18:30\",\r\n" + 
					"			\"targetUid\": \"11\",\r\n" + 
					"			\"targetName\": \"ld\",\r\n" + 
					"			\"bankName\": \"1\",\r\n" + 
					"			\"bankBranch\": \"1\",\r\n" + 
					"			\"bankCardNumber\": \"1\",\r\n" + 
					"			\"alipayAccount\": \"1\",\r\n" + 
					"			\"alipayImg\": \"1\",\r\n" + 
					"			\"wxAccount\": \"1\",\r\n" + 
					"			\"wxImg\": \"1\"\r\n" + 
					"		}, {\r\n" + 
					"			\"entryOrderId\": \"3\",\r\n" + 
					"			\"currencyId\": \"\",\r\n" + 
					"			\"uid\": \"1111\",\r\n" + 
					"			\"price\": 10.00000000,\r\n" + 
					"			\"number\": 1.00000000,\r\n" + 
					"			\"amount\": 1.00000000,\r\n" + 
					"			\"status\": 3,\r\n" + 
					"			\"type\": 2,\r\n" + 
					"			\"payMethod\": \"010101\",\r\n" + 
					"			\"createTime\": \"2018-07-07 18:30\",\r\n" + 
					"			\"targetUid\": \"11\",\r\n" + 
					"			\"targetName\": \"ld\",\r\n" + 
					"			\"bankName\": \"中商银行\",\r\n" + 
					"			\"bankBranch\": \"酹太想爱你支行\",\r\n" + 
					"			\"bankCardNumber\": \"42108234234324324321\",\r\n" + 
					"			\"alipayAccount\": \"242\",\r\n" + 
					"			\"alipayImg\": \"2342\",\r\n" + 
					"			\"wxAccount\": \"242\",\r\n" + 
					"			\"wxImg\": \"2342\"\r\n" + 
					"		}, {\r\n" + 
					"			\"entryOrderId\": \"4\",\r\n" + 
					"			\"currencyId\": \"\",\r\n" + 
					"			\"uid\": \"1111\",\r\n" + 
					"			\"price\": 10.00000000,\r\n" + 
					"			\"number\": 1.00000000,\r\n" + 
					"			\"amount\": 1.00000000,\r\n" + 
					"			\"status\": 7,\r\n" + 
					"			\"type\": 2,\r\n" + 
					"			\"payMethod\": \"010101\",\r\n" + 
					"			\"createTime\": \"2018-07-07 18:30\",\r\n" + 
					"			\"targetUid\": \"11\",\r\n" + 
					"			\"targetName\": \"ld\",\r\n" + 
					"			\"bankName\": \"中商银行\",\r\n" + 
					"			\"bankBranch\": \"酹太想爱你支行\",\r\n" + 
					"			\"bankCardNumber\": \"42108234234324324321\",\r\n" + 
					"			\"alipayAccount\": \"242\",\r\n" + 
					"			\"alipayImg\": \"2342\",\r\n" + 
					"			\"wxAccount\": \"242\",\r\n" + 
					"			\"wxImg\": \"2342\"\r\n" + 
					"		}, {\r\n" + 
					"			\"entryOrderId\": \"5\",\r\n" + 
					"			\"currencyId\": \"\",\r\n" + 
					"			\"uid\": \"1111\",\r\n" + 
					"			\"price\": 10.00000000,\r\n" + 
					"			\"number\": 1.00000000,\r\n" + 
					"			\"amount\": 1.00000000,\r\n" + 
					"			\"status\": 3,\r\n" + 
					"			\"type\": 2,\r\n" + 
					"			\"payMethod\": \"010101\",\r\n" + 
					"			\"createTime\": \"2018-07-07 18:30\",\r\n" + 
					"			\"targetUid\": \"11\",\r\n" + 
					"			\"targetName\": \"ld\",\r\n" + 
					"			\"bankName\": \"中商银行\",\r\n" + 
					"			\"bankBranch\": \"酹太想爱你支行\",\r\n" + 
					"			\"bankCardNumber\": \"42108234234324324321\",\r\n" + 
					"			\"alipayAccount\": \"242\",\r\n" + 
					"			\"alipayImg\": \"2342\",\r\n" + 
					"			\"wxAccount\": \"242\",\r\n" + 
					"			\"wxImg\": \"2342\"\r\n" + 
					"		}, {\r\n" + 
					"			\"entryOrderId\": \"6\",\r\n" + 
					"			\"currencyId\": \"\",\r\n" + 
					"			\"uid\": \"1111\",\r\n" + 
					"			\"price\": 10.00000000,\r\n" + 
					"			\"number\": 1.00000000,\r\n" + 
					"			\"amount\": 1.00000000,\r\n" + 
					"			\"status\": 7,\r\n" + 
					"			\"type\": 2,\r\n" + 
					"			\"payMethod\": \"010101\",\r\n" + 
					"			\"createTime\": \"2018-07-07 18:30\",\r\n" + 
					"			\"targetUid\": \"11\",\r\n" + 
					"			\"targetName\": \"ld\",\r\n" + 
					"			\"bankName\": \"中商银行\",\r\n" + 
					"			\"bankBranch\": \"酹太想爱你支行\",\r\n" + 
					"			\"bankCardNumber\": \"42108234234324324321\",\r\n" + 
					"			\"alipayAccount\": \"242\",\r\n" + 
					"			\"alipayImg\": \"2342\",\r\n" + 
					"			\"wxAccount\": \"242\",\r\n" + 
					"			\"wxImg\": \"2342\"\r\n" + 
					"		}, {\r\n" + 
					"			\"entryOrderId\": \"7\",\r\n" + 
					"			\"currencyId\": \"\",\r\n" + 
					"			\"uid\": \"1111\",\r\n" + 
					"			\"price\": 10.00000000,\r\n" + 
					"			\"number\": 1.00000000,\r\n" + 
					"			\"amount\": 1.00000000,\r\n" + 
					"			\"status\": 3,\r\n" + 
					"			\"type\": 2,\r\n" + 
					"			\"payMethod\": \"010101\",\r\n" + 
					"			\"createTime\": \"2018-07-07 18:30\",\r\n" + 
					"			\"targetUid\": \"11\",\r\n" + 
					"			\"targetName\": \"ld\",\r\n" + 
					"			\"bankName\": \"中商银行\",\r\n" + 
					"			\"bankBranch\": \"酹太想爱你支行\",\r\n" + 
					"			\"bankCardNumber\": \"42108234234324324321\",\r\n" + 
					"			\"alipayAccount\": \"242\",\r\n" + 
					"			\"alipayImg\": \"2342\",\r\n" + 
					"			\"wxAccount\": \"242\",\r\n" + 
					"			\"wxImg\": \"2342\"\r\n" + 
					"		}, {\r\n" + 
					"			\"entryOrderId\": \"8\",\r\n" + 
					"			\"currencyId\": \"\",\r\n" + 
					"			\"uid\": \"1111\",\r\n" + 
					"			\"price\": 10.00000000,\r\n" + 
					"			\"number\": 1.00000000,\r\n" + 
					"			\"amount\": 1.00000000,\r\n" + 
					"			\"status\": 7,\r\n" + 
					"			\"type\": 2,\r\n" + 
					"			\"payMethod\": \"010101\",\r\n" + 
					"			\"createTime\": \"2018-07-07 18:30\",\r\n" + 
					"			\"targetUid\": \"11\",\r\n" + 
					"			\"targetName\": \"ld\",\r\n" + 
					"			\"bankName\": \"中商银行\",\r\n" + 
					"			\"bankBranch\": \"酹太想爱你支行\",\r\n" + 
					"			\"bankCardNumber\": \"42108234234324324321\",\r\n" + 
					"			\"alipayAccount\": \"242\",\r\n" + 
					"			\"alipayImg\": \"2342\",\r\n" + 
					"			\"wxAccount\": \"242\",\r\n" + 
					"			\"wxImg\": \"2342\"\r\n" + 
					"		}, {\r\n" + 
					"			\"entryOrderId\": \"9\",\r\n" + 
					"			\"currencyId\": \"\",\r\n" + 
					"			\"uid\": \"1111\",\r\n" + 
					"			\"price\": 10.00000000,\r\n" + 
					"			\"number\": 1.00000000,\r\n" + 
					"			\"amount\": 1.00000000,\r\n" + 
					"			\"status\": 3,\r\n" + 
					"			\"type\": 2,\r\n" + 
					"			\"payMethod\": \"010101\",\r\n" + 
					"			\"createTime\": \"2018-07-07 18:30\",\r\n" + 
					"			\"targetUid\": \"11\",\r\n" + 
					"			\"targetName\": \"ld\",\r\n" + 
					"			\"bankName\": \"中商银行\",\r\n" + 
					"			\"bankBranch\": \"酹太想爱你支行\",\r\n" + 
					"			\"bankCardNumber\": \"42108234234324324321\",\r\n" + 
					"			\"alipayAccount\": \"242\",\r\n" + 
					"			\"alipayImg\": \"2342\",\r\n" + 
					"			\"wxAccount\": \"242\",\r\n" + 
					"			\"wxImg\": \"2342\"\r\n" + 
					"		}],\r\n" + 
					"		\"pageCount\": 3,\r\n" + 
					"		\"beginPageIndex\": 1,\r\n" + 
					"		\"endPageIndex\": 3,\r\n" + 
					"		\"countResultMap\": null\r\n" + 
					"	},\r\n" + 
					"	\"ext\": null\r\n" + 
					"}";
			return json;
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} c2c用户订单分页查询  解析后台数据发生异常", e.toString());
			return result;
		}
	}
	
	
	
	/**
	 * 
	* @Title: busCancleOrder  
	* @Description: c2c商家取消订单 
	* @param request
	* @param payMethod
	* @param orderId
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/busCancleOrder", method = RequestMethod.POST)
	public Object busCancleOrder(HttpServletRequest request, @RequestParam String payMethod,@RequestParam String orderId) {
		HttpSession session = request.getSession();
		// 获取当前本地语言
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		Map<String, String> map = new HashMap<String, String>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Server exception,please try again later");
		}

		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		

		hashMap.put("payMethod", payMethod);
		hashMap.put("orderId", orderId);
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");

		try {

			// 先判断用户是否绑定过手机，如果没有绑定手机，就不需要向后台请求数据
			/*
			 * Boolean flag = (Boolean)
			 * session.getAttribute(SessionAttributes.USER_ISBINDPHONE); if (!flag) {
			 * model.addAttribute("list", null); return "record/withdrawRecord"; }
			 */

			String json = otcService.busCancleOrder(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} c2c商家取消订单 解析后台数据发生异常", e.toString());
			return result;
		}
	}
	
	
	/**
	 * 
	* @Title: userCancleOrder  
	* @Description: 用户撤销订单 
	* @param request
	* @param orderId
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/userCancleOrder", method = RequestMethod.POST)
	public Object userCancleOrder(HttpServletRequest request, @RequestParam String orderId) {
		HttpSession session = request.getSession();
		// 获取当前本地语言
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		Map<String, String> map = new HashMap<String, String>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Server exception,please try again later");
		}
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		
		
		hashMap.put("orderId", orderId);
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");
		
		try {
			
			// 先判断用户是否绑定过手机，如果没有绑定手机，就不需要向后台请求数据
			/*
			 * Boolean flag = (Boolean)
			 * session.getAttribute(SessionAttributes.USER_ISBINDPHONE); if (!flag) {
			 * model.addAttribute("list", null); return "record/withdrawRecord"; }
			 */
			
			String json = otcService.userCancleOrder(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} 用户撤销订单  解析后台数据发生异常", e.toString());
			return result;
		}
	}
	
	
	
	/**
	 * 
	* @Title: c2cBusOrderHistory  
	* @Description: 查询我的商家接单 
	* @param request
	* @param c2cTransRecordVO
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/busOrderHistory", method = RequestMethod.GET)
	public Object c2cBusOrderHistory(HttpServletRequest request, C2CTransRecordVO c2cTransRecordVO) {
		HttpSession session = request.getSession();
		// 获取当前本地语言
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		Map<String, String> map = new HashMap<String, String>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Server exception,please try again later");
		}

		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (null != c2cTransRecordVO.getStartTime() && !StringUtils.isBlank(c2cTransRecordVO.getStartTime())) {
				Long startTime = simple.parse(c2cTransRecordVO.getStartTime()).getTime();
				hashMap.put("startTime", startTime);
			}
			if (null != c2cTransRecordVO.getEndTime() && !StringUtils.isBlank(c2cTransRecordVO.getEndTime())) {
				Long endTime = simple.parse(c2cTransRecordVO.getEndTime()).getTime();
				hashMap.put("endTime", endTime);
			}
		} catch (Exception e) {
			log.error("{} 我的商家接单  页面时间转换失败");
		}

		
		hashMap.put("symbol", "usdt");
		if (null != c2cTransRecordVO.getSymbol()) {
			hashMap.put("symbol", c2cTransRecordVO.getSymbol());
		}
		if (null != c2cTransRecordVO.getType()) {
			hashMap.put("type", c2cTransRecordVO.getType());
		}
		if (null != c2cTransRecordVO.getStatus()) {
			hashMap.put("status", c2cTransRecordVO.getStatus());
		}

		hashMap.put("pageNum", c2cTransRecordVO.getPageNum());
		hashMap.put("numPerPage", c2cTransRecordVO.getNumPerPage());
		hashMap.put("objectUid", "11");

		try {
			String json = otcService.c2cBusOrderHistory(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} 查询我的商家接单 解析后台数据发生异常", e.toString());
			return result;
		}
	}
	
	
	
	
	/**
	 * 
	* @Title: userpayFinish  
	* @Description: 用户已付款 
	* @param request
	* @param payPassword
	* @param orderId
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/userPayFinish", method = RequestMethod.POST)
	public Object userPayFinish(HttpServletRequest request, @RequestParam String payPassword,@RequestParam String orderId) {
		HttpSession session = request.getSession();
		// 获取当前本地语言
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		Map<String, String> map = new HashMap<String, String>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Server exception,please try again later");
		}

		HashMap<String, Object> hashMap = new HashMap<String, Object>();


		hashMap.put("payPassword", payPassword);
		hashMap.put("orderId", orderId);
		hashMap.put("uid", "1111");

		try {
			String json = otcService.userPayFinish(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} 用户已付款 解析后台数据发生异常", e.toString());
			return result;
		}
	}
	
	
	
	
	/**
	 * 
	* @Title: busCheckFinish  
	* @Description: 商家放行 
	* @param request
	* @param payPassword
	* @param orderId
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/busCheckFinish", method = RequestMethod.POST)
	public Object busCheckFinish(HttpServletRequest request, @RequestParam String payPassword,@RequestParam String orderId) {
		HttpSession session = request.getSession();
		// 获取当前本地语言
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		Map<String, String> map = new HashMap<String, String>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Server exception,please try again later");
		}
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		
		hashMap.put("payPassword", payPassword);
		hashMap.put("orderId", orderId);
		hashMap.put("uid", "1111");
		
		try {
			String json = otcService.busCheckFinish(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			result.setData("");
			log.error("{} 商家放行  解析后台数据发生异常", e.toString());
			return result;
		}
	}
	
	
	
	
	/**
	 * 
	* @Title: userBuySell  
	* @Description: c2c用户下单 
	* @param request
	* @param orderId
	* @param orderNum
	* @param type
	* @param payPassword
	* @param amount
	* @return
	* @return Object
	 */
	@RequestMapping(value = "/userBuySell", method = RequestMethod.POST)
	public Object userBuySell(HttpServletRequest request, @RequestParam String orderId, String orderNum
								,@RequestParam String type, String payPassword, @RequestParam String amount) {
		HttpSession session = request.getSession();
		// 获取当前本地语言
		Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		Map<String, String> map = new HashMap<String, String>();
		ResponseResult result = new ResponseResult();
		if ("zh_CN".equals(locale.toString())) {
			map.put("msg1", "资金密码不能为空");
			map.put("msg2", "订单数量不能为空");
			map.put("msg3", "服务器异常,请稍后重试");
		}
		if ("en_US".equals(locale.toString())) {
			map.put("msg1", "Capital cipher can not be empty");
			map.put("msg2", "The order quantity cannot be empty");
			map.put("msg3", "Server exception,please try again later");
		}
		
		result.setCode(ResultCode.FORM_INFO_ERROR);
		result.setData("");
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		if (null == orderNum || StringUtils.isBlank(orderNum)) {
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			return result;
		}
		if (null == payPassword || StringUtils.isBlank(payPassword)) {
			result.setMessage(Toolkits.defaultString(map.get("msg1")));
			return result;
		}
		
		
		
		hashMap.put("payPassword", payPassword);
		hashMap.put("orderId", orderId);
		hashMap.put("amount", amount);
		hashMap.put("orderNum", orderNum);
		hashMap.put("type", type);
		hashMap.put("uid", "1111");
		
		try {
			String json = otcService.userBuySell(request, hashMap);
			return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			result.setData("");
			log.error("{} c2c用户 下单 解析后台数据发生异常", e.toString());
			return result;
		}
	}
	
	
	
	
	
	
	

}
