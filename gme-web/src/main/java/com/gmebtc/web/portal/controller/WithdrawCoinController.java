package com.gmebtc.web.portal.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.gmebtc.web.portal.constant.ResultCode;
import com.gmebtc.web.portal.constant.SessionAttributes;
import com.gmebtc.web.portal.result.ResponseResult;
import com.gmebtc.web.portal.service.WithdrawCoinService;
import com.gmebtc.web.portal.utils.Toolkits;
import com.gmebtc.web.portal.vo.UserVO;

/*
 * @Author zhou
 * @Date 2018/5/29 16:13
 * @Desc 提币控制类
 */
@RestController
@RequestMapping(value = "${ROOT_PATH}/wallet")
public class WithdrawCoinController {
	private static final Logger log = LoggerFactory.getLogger(WithdrawCoinController.class);
	
    @Resource(name = "withdrawCoinService")
    private WithdrawCoinService withdrawCoinService;


    /**
     * 
    * @Title: cancelWithdraw  
    * @Description: 取消提币 
    * @param request
    * @param withdrawId
    * @param payPassword
    * @return
    * @return Object
     */
    @RequestMapping(value = "/cancelWithdraw",method = RequestMethod.POST)
    @ResponseBody
    public Object cancelWithdraw (HttpServletRequest request, @RequestParam String withdrawId, String payPassword){
        HttpSession session = request.getSession();
        Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        Map<String,String> map = new HashMap<String,String>();
        ResponseResult result = new ResponseResult();
        if ("zh_CN".equals(locale.toString())) {
            map.put("msg1", "资金密码不能为空");
            map.put("msg2", "服务器异常,请稍后重试");
        }
        if ("en_US".equals(locale.toString())) {
            map.put("msg1", "Capital cipher can not be empty");
            map.put("msg2", "Server exception,please try again later");
        }
        
        if (null == payPassword || StringUtils.isBlank(payPassword)) {
            result.setCode(ResultCode.FORM_INFO_ERROR);
            result.setMessage(Toolkits.defaultString(map.get("msg1")));
            result.setData("");
            return result;
        }

        HashMap<String,String> hashMap = new HashMap<String, String>();
        hashMap.put("withdrawId",withdrawId);
        hashMap.put("payPassword",payPassword);
        
       
        try {
        	 String json = withdrawCoinService.cancelWithdraw(request,hashMap);
             return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			result.setData("");
			log.error("{} 取消提币 发生异常.",e.toString());
			return result;
		}
    }



    /**
     * 
     * @Title: withdrawAddressDel
     * @Description: TODO 删除钱包地址
     * @param @param request
     * @param @param bizType 1提现，2充值
     * @param @param currencyId
     * @param @param address
     * @param @return
     * @return Object
     * @throws
     */
    @RequestMapping(value = "/withdrawAddressDel",method = RequestMethod.POST)
    @ResponseBody
    public Object withdrawAddressDel (HttpServletRequest request,@RequestParam String tradeAuth,@RequestParam String currencyId
    									,@RequestParam String address){
        HttpSession session = request.getSession();
        Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        Map<String,String> map = new HashMap<String,String>();
        ResponseResult result = new ResponseResult();
        if ("zh_CN".equals(locale.toString())) {
            map.put("msg1", "资金密码不能为空");
            map.put("msg2", "你还没有登录,请登录后重试");
        	map.put("msg3", "服务器异常,请稍后重试");
        }
        if ("en_US".equals(locale.toString())) {
            map.put("msg1", "Capital cipher can not be empty");
            map.put("msg2", "You haven't logged in yet,please login and try again");
        	map.put("msg3", "Server exception,please try again later");
        }
        
        
        result.setCode(ResultCode.FORM_INFO_ERROR);
        // 判断当前用户是否已经登录
       /* UserVO userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
        if (null == userVO) {
        	result.setMessage(Toolkits.defaultString(map.get("msg2")));
        	result.setData("");
        	return result;
        }*/
        if (null == tradeAuth || StringUtils.isBlank(tradeAuth)) {
            result.setMessage(Toolkits.defaultString(map.get("msg1")));
            result.setData("");
            return result;
        }

        HashMap<String,String> hashMap = new HashMap<String, String>();
        hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");
        hashMap.put("payPassword",tradeAuth);
        hashMap.put("currencyId",currencyId);
        hashMap.put("address",address);

        try {
        	String json = withdrawCoinService.withdrawAddressDel(request,hashMap);
        	return Toolkits.handleResp(json);
        	/*String json = "{\r\n" + 
        			"	\"code\": \"200\",\r\n" + 
        			"	\"message\": \"Successful\",\r\n" + 
        			"	\"data\": \"{\\\"withdraw\\\":{\\\"data\\\":[{\\\"addressArray\\\":[\\\"0x4f154f06c839f236af4c9a0592a94dff57805cc7\\\",\\\"0x5173f260e35777eef6fd475aabd2ee4a0a771a54\\\",\\\"0x2c438fb6ca1879b5528b8b60efbf9943bda3b459\\\",\\\"0x18022e89a8b4eddbdbbca8ea36027a2cb5edcf37\\\",\\\"0x052ec4e3d68a8d54817bce241175e0777d081550\\\",\\\"1\\\",\\\"123\\\",\\\"1235\\\"],\\\"currency\\\":\\\"btc_usdt\\\",\\\"currencyId\\\":\\\"1\\\",\\\"defaultAddress\\\":\\\"0x4f154f06c839f236af4c9a0592a94dff57805cc7\\\",\\\"remark\\\":\\\"1\\\"}]}}\",\r\n" + 
        			"	\"ext\": null\r\n" + 
        			"}";
        	return json;*/
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg3")));
			result.setData("");
			log.error("{} 删除钱包地址发生异常.",e.toString());
			return result;
		}
    }



    /**
     * 
     * @Title: withdrawAddressAdd
     * @Description: TODO 添加钱包地址
     * @param @param request 
     * @param @param currencyId 币种id
     * @param @param symbol 如btc_usdt
     * @param @param address 地址
     * @param @param remarks 备注
     * @param @param payPassword 资金密码
     * @param @return
     * @return Object
     * @throws
     */
    @RequestMapping(value = "/withdrawAddressAdd",method = RequestMethod.POST)
    @ResponseBody
    public Object withdrawAddressAdd (HttpServletRequest request,@RequestParam String currencyId,@RequestParam String symbol,
                                      @RequestParam String address,@RequestParam String remark,@RequestParam String tradeAuth){
        HttpSession session = request.getSession();
        Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        Map<String,String> map = new HashMap<String,String>();
        ResponseResult result = new ResponseResult();
        if ("zh_CN".equals(locale.toString())) {
            map.put("msg1", "地址不能为空");
            map.put("msg2", "资金密码不能为空");
            map.put("msg3", "你还没有登录,请登录后重试");
            map.put("msg4", "服务器异常,请稍后重试");
        }
        if ("en_US".equals(locale.toString())) {
            map.put("msg1", "The address cannot be empty");
            map.put("msg2", "Capital cipher can not be empty");
            map.put("msg3", "You haven't logged in yet,please login and try again");
            map.put("msg4", "Server exception,please try again later.");
        }
        
        
        result.setCode(ResultCode.FORM_INFO_ERROR);
        
        
        // 判断当前用户是否已经登录
       /* UserVO userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
        if (null == userVO) {
        	result.setMessage(Toolkits.defaultString(map.get("msg3")));
        	result.setData("");
        	return result;
        }*/
        
        if (null == address || StringUtils.isBlank(address)) {
            result.setMessage(Toolkits.defaultString(map.get("msg1")));
            result.setData("");
            return result;
        }
        if (null == tradeAuth || StringUtils.isBlank(tradeAuth)) {
            result.setMessage(Toolkits.defaultString(map.get("msg2")));
            result.setData("");
            return result;
        }

        HashMap<String,String> hashMap = new HashMap<String, String>();
        hashMap.put("currencyId",currencyId);
        hashMap.put("symbol",symbol);
        hashMap.put("uid","1");
        hashMap.put("address",address);
        hashMap.put("remark",remark);
        hashMap.put("payPassword",tradeAuth);

        session.setAttribute(SessionAttributes.SAVE_CURRENCYID_REVIEW, currencyId);
        
        try {
        	String json = withdrawCoinService.withdrawAddressAdd(request,hashMap);
        	return Toolkits.handleResp(json);
        	/*String json = "{\r\n" + 
        			"	\"code\": \"200\",\r\n" + 
        			"	\"message\": \"Successful\",\r\n" + 
        			"	\"data\": \"{\\\"withdraw\\\":{\\\"data\\\":[{\\\"addressArray\\\":[\\\"0x4f154f06c839f236af4c9a0592a94dff57805cc7\\\",\\\"0x5173f260e35777eef6fd475aabd2ee4a0a771a54\\\",\\\"0x2c438fb6ca1879b5528b8b60efbf9943bda3b459\\\",\\\"0x18022e89a8b4eddbdbbca8ea36027a2cb5edcf37\\\",\\\"0x052ec4e3d68a8d54817bce241175e0777d081550\\\",\\\"1\\\",\\\"123\\\",\\\"1235\\\"],\\\"currency\\\":\\\"btc_usdt\\\",\\\"currencyId\\\":\\\"1\\\",\\\"defaultAddress\\\":\\\"0x4f154f06c839f236af4c9a0592a94dff57805cc7\\\",\\\"remark\\\":\\\"1\\\"}]}}\",\r\n" + 
        			"	\"ext\": null\r\n" + 
        			"}";
        	return json;*/
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg4")));
			result.setData("");
			log.error("{} 添加钱包地址发生异常.",e.toString());
			return result;
		}
    }


    
    
    
    
    /**
     * @Author zhou
     * @Date 2018/5/30 10:52
     * @Param [request, coinType:币种类型]
     * @Desc 查询提币地址
     */
    @RequestMapping(value = "/withdrawAddress",method = RequestMethod.POST)
    public Object getWithdrawAddress (HttpServletRequest request,Model model,String currencyId){
    	HttpSession session = request.getSession();
        Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        Map<String,String> map = new HashMap<String,String>();
        ResponseResult result = new ResponseResult();
        if ("zh_CN".equals(locale.toString())) {
       	 map.put("msg1", "你还没有登录,请登录后重试");
       	 map.put("msg2", "服务器异常,请稍后重试");
        }
        if ("en_US".equals(locale.toString())) {
       	 map.put("msg1", "You haven't logged in yet,please login and try again");
       	 map.put("msg2", "Server exception,please try again later.");
        }
        
        
        result.setCode(ResultCode.FORM_INFO_ERROR);
        
        // 测试数据，
        /*UserVO userVOTest = new UserVO();
        userVOTest.setUid("34323432");
        session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, userVOTest);
        */
        
        // 判断当前用户是否已经登录
        /*UserVO userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
        if (null == userVO) {
        	result.setMessage(Toolkits.defaultString(map.get("msg1")));
        	result.setData("");
        	return result;
        }*/
        
       HashMap<String,Object> hashMap = new HashMap<String, Object>();
       if (null != currencyId && !StringUtils.isBlank(currencyId)) {
    	   hashMap.put("currencyId", currencyId);
       }
       
       hashMap.put("uid","91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");
       
       
       //添加币种回显
       String review = (String) session.getAttribute(SessionAttributes.SAVE_CURRENCYID_REVIEW);
       model.addAttribute("review",review);
       
       try {
    	   String json = withdrawCoinService.getWithdrawAddress(request,hashMap);
           return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			result.setData("");
			log.error("{} 查询提币地址发生异常",e.toString());
			return result;
		}
       
    }


    /**
     * @Author zhou
     * @Date 2018/5/30 11:10
     * @Param [request, coinType:币种类型, address:接受币地址, amount:数量, payPassword:资金密码, phoneCode:手机验证码]
     * @Desc 提币请求
     */
    @RequestMapping(value = "/widthrawCoin",method = RequestMethod.POST)
    @ResponseBody
    public Object widthrawCoin (HttpServletRequest request,@RequestParam String coinType,@RequestParam String address
                                ,@RequestParam String amount,@RequestParam String payPassword,@RequestParam String phoneCode){
        HttpSession session = request.getSession();
        Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        Map<String,String> map = new HashMap<String,String>();
        ResponseResult result = new ResponseResult();
        if ("zh_CN".equals(locale.toString())) {
            map.put("msg1", "提币地址不能为空");
            map.put("msg2", "提币数量不能为空");
            map.put("msg3", "资金密码不能为空");
            map.put("msg4", "手机验证码不能为空");
            map.put("msg5", "服务器异常,请稍后重试");
        }
        if ("en_US".equals(locale.toString())) {
            map.put("msg1", "The address of the coin can not be empty");
            map.put("msg2", "The amount of money can not be empty");
            map.put("msg3", "Capital cipher can not be empty");
            map.put("msg4", "The phone verification code cannot be empty");
            map.put("msg5", "Server exception,please try again later.");
        }
        if (null == address || StringUtils.isBlank(address)) {
            result.setCode("-1");
            result.setMessage(Toolkits.defaultString(map.get("msg2")));
            result.setData("");
            return result;
        }
        if (null == amount || StringUtils.isBlank(amount)) {
            result.setCode("-1");
            result.setMessage(Toolkits.defaultString(map.get("msg1")));
            result.setData("");
            return result;
        }
        if (null == payPassword || StringUtils.isBlank(payPassword)) {
            result.setCode("-1");
            result.setMessage(Toolkits.defaultString(map.get("msg3")));
            result.setData("");
            return result;
        }
        if (null == phoneCode || StringUtils.isBlank(phoneCode)) {
            result.setCode("-1");
            result.setMessage(Toolkits.defaultString(map.get("msg4")));
            result.setData("");
            return result;
        }

        HashMap<String,String> hashMap = new HashMap<String, String>();
        hashMap.put("coinType", coinType);
        hashMap.put("address", address);
        hashMap.put("amount", amount);
        hashMap.put("payPassword", payPassword);
        hashMap.put("phoneCode", phoneCode);

        
        try {
        	String json = withdrawCoinService.widthrawCoin(request,hashMap);
        	return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg5")));
			result.setData("");
			log.error("{} ", e.toString());
			return result;
		}
    }



    /**
     * 
    * @Title: getWithdrawRecordPage  
    * @Description: 查询提币历史记录 
    * @param request
    * @param currencyId
    * @param pageNum
    * @param numPerPage
    * @return
    * @return Object
     */
    @RequestMapping(value = "/getWithdrawRecordPage",method=RequestMethod.GET)
    public Object getWithdrawRecordPage (HttpServletRequest request,@RequestParam(required=false) String currencyId
    								,String pageNum, String numPerPage){
    	 HttpSession session = request.getSession();
         // 获取当前本地语言
         Locale locale = (Locale) session.getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
         Map<String,String> map = new HashMap<String,String>();
         ResponseResult result = new ResponseResult();
         if ("zh_CN".equals(locale.toString())) {
        	 map.put("msg1", "你还没有登录,请登录后重试");
             map.put("msg2", "服务器异常,请稍后重试");
         }
         if ("en_US".equals(locale.toString())) {
        	 map.put("msg1", "You haven't logged in yet,please login and try again");
             map.put("msg2", "Server exception,please try again later");
         }

      // 测试数据，
         UserVO userVOTest = new UserVO();
         userVOTest.setUid("91f9cfcf-7a95-11e8-ad83-5ccc6ad6addc");
         session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, userVOTest);
         
         
         // 判断当前用户是否已经登录
         UserVO userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
         if (null == userVO) {
         	result.setCode(ResultCode.FORM_INFO_ERROR);
         	result.setMessage(Toolkits.defaultString(map.get("msg1")));
         	result.setData("");
         	return result;
         }
         
        HashMap<String,Object> hashMap = new HashMap<String, Object>();
        if (null != currencyId) {
        	hashMap.put("currencyId", currencyId);
        }
        hashMap.put("pageNum", pageNum);
        hashMap.put("numPerPage", numPerPage);
        hashMap.put("uid", userVO.getUid());
        try {
        	String json = withdrawCoinService.getWithdrawRecordPage(request,hashMap);
        	return Toolkits.handleResp(json);
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage(Toolkits.defaultString(map.get("msg2")));
			result.setData("");
			log.error("{} 查询提币历史记录发生异常.",e.toString());
			return result;
		}
    }


}
