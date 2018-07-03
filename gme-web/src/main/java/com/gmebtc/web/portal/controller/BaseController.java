package com.gmebtc.web.portal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.gmebtc.web.portal.constant.ResultCode;
import com.gmebtc.web.portal.constant.SessionAttributes;
import com.gmebtc.web.portal.service.RechargeCoinService;
import com.gmebtc.web.portal.service.WithdrawCoinService;
import com.gmebtc.web.portal.utils.Toolkits;
import com.gmebtc.web.portal.vo.BillVO;
import com.gmebtc.web.portal.vo.MyDeityVO;
import com.gmebtc.web.portal.vo.PageBean;
import com.gmebtc.web.portal.vo.PageVO;
import com.gmebtc.web.portal.vo.RechargeRecordVO;
import com.gmebtc.web.portal.vo.UserVO;
import com.gmebtc.web.portal.vo.WithdrawRecordVO;

/*
 * @Author zhou
 * @Date 2018/6/4 19:50
 * @Desc 页面跳转
 */
@Controller
public class BaseController {

	private static final Logger log = LoggerFactory.getLogger(BaseController.class);

	@Resource(name = "rechargeCoinService")
	private RechargeCoinService rechargeCoinService;
	@Resource(name = "withdrawCoinService")
	private WithdrawCoinService withdrawCoinService;

	/**
	 * 
	 * @Title: loginIndex
	 * @Description:跳转到已登录主页
	 * @return
	 * @return String
	 */
	@RequestMapping(value = "/loginIndex")
	public String loginIndex() {
		return "loginIndex";
	}

	/**
	 * 
	 * @Title: unLoginInde
	 * @Description: 跳转到未登录主页
	 * @param model
	 * @return
	 * @return String
	 */
	@RequestMapping(value = "/unLoginIndex")
	public String unLoginInde(Model model) {
		model.addAttribute("flag", "false");
		return "unLoginIndex";
	}

	/**
	 * 
	 * @Title: login
	 * @Description: 跳转到第一步登录页面
	 * @param model
	 * @param redirect
	 * @return
	 * @return String
	 */
	@RequestMapping(value = "/firstLogin")
	public String login(Model model, String redirect) {
		model.addAttribute("redirect", redirect);
		return "firstLogin";
	}

	/**
	 * 
	 * @Title: secondLogin
	 * @Description: 跳转到第二步登录页面
	 * @param model
	 * @param redirect
	 * @return
	 * @return String
	 */
	@RequestMapping(value = "/secondLogin")
	public String secondLogin(Model model, String redirect) {
		model.addAttribute("redirect", redirect);
		return "secondLogin";
	}

	/**
	 * 
	 * @Title: register
	 * @Description: 跳转到注册页面
	 * @param model
	 * @return
	 * @return String
	 */
	@RequestMapping(value = "/register")
	public String register(Model model) {
		model.addAttribute("flag", "false");
		return "register";
	}

	/**
	 * 
	 * @Title: findPassword
	 * @Description: 重置密码页面
	 * @param request
	 * @return
	 * @return String
	 */
	@RequestMapping(value = "/resetPassword")
	public String findPassword(HttpServletRequest request) {
		HttpSession session = request.getSession();
		// 先把用户信息从session中清除,保留uid
		UserVO userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
		if (null != userVO) {
			// 清除用户登录状态
			session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, null);
		}

		return "resetPassword";
	}

	/**
	 * 
	 * @Title: rechargeRecord
	 * @Description: 跳转到查询充值记录页面
	 * @return
	 * @return String
	 */
	@RequestMapping(value = "/rechargeRecord")
	public String rechargeRecord(HttpServletRequest request, Model model,RechargeRecordVO rechargeRecordVO) {
		HttpSession session = request.getSession();
		// 测试数据，
		UserVO userVO = new UserVO();
		userVO.setUid("123");
		session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, userVO);

		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		/*
		 * if (null != currencyId) { hashMap.put("currencyId", "1"); }
		 */
//		hashMap.put("currencyId", "1");
//		hashMap.put("uid", userVO.getUid());
		hashMap.put("pageNum", rechargeRecordVO.getPageNum());
		hashMap.put("numPerPage", "2");

		try {
			// 查询出的存储分页数据的对象json字符串
			String json = rechargeCoinService.getRechargeAddress(request, hashMap);
			if (null != json) {
				PageVO<PageBean> pageVo = (PageVO<PageBean>) Toolkits.fromJsonToPojo(json, PageVO.class);
				String data = Toolkits.fromPojotoJson(pageVo.getData());
				PageBean pageBean = (PageBean) Toolkits.fromJsonToPojo(data, PageBean.class);
				model.addAttribute("pageBean",pageBean);
//				model.addAttribute("list", pageBean.getRecordList());
			}
			return "record/rechargeRecord";
		} catch (Exception e) {
			log.error("{} 分页查询充值记录解析后台数据发生异常", e.toString());
			model.addAttribute("list", null);
			return "record/rechargeRecord";
		}

	}

	
	/**
	 * 
	* @Title: withdrawRecord  
	* @Description: 查询提现记录 
	* @param request
	* @param model
	* @param currencyId
	* @param pageNum
	* @param numPerPage
	* @return
	* @return String
	 */
	@RequestMapping(value = "/withdrawRecord")
	public String withdrawRecord(HttpServletRequest request, Model model,WithdrawRecordVO withdrawRecordVO) {
		HttpSession session = request.getSession();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		// 测试数据，
		UserVO userVO = new UserVO();
		userVO.setUid("1");
		session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, userVO);

		if (null != withdrawRecordVO.getCurrencyId()) {
			hashMap.put("currencyId", withdrawRecordVO.getCurrencyId());
		}
		hashMap.put("pageNum", "1");
		hashMap.put("numPerPage", "10");
		hashMap.put("uid", userVO.getUid());
		try {
			
			// 先判断用户是否绑定过手机，如果没有绑定手机，就不需要向后台请求数据
			Boolean flag = (Boolean) session.getAttribute(SessionAttributes.USER_ISBINDPHONE);
			if (!flag) {
				model.addAttribute("list", null);
				return "record/withdrawRecord"; 
			}
			
			
			
			// 查询出的存储分页数据的对象json字符串
			String json = withdrawCoinService.getWithdrawRecordPage(request,hashMap);
			if (null != json) {
				PageVO<PageBean> pageVo = (PageVO<PageBean>) Toolkits.fromJsonToPojo(json, PageVO.class);
				String data = Toolkits.fromPojotoJson(pageVo.getData());
				PageBean pageBean = (PageBean) Toolkits.fromJsonToPojo(data, PageBean.class);
				model.addAttribute("list", pageBean.getRecordList());
			}
			return "record/withdrawRecord";
		} catch (Exception e) {
			log.error("{} 分页查询提现记录解析后台数据发生异常", e.toString());
			model.addAttribute("list", null);
			return "record/withdrawRecord";
		}
	}

	
	
	/**
	 * 
	* @Title: walletAddress  
	* @Description: 重置资金密码（自动登出）
	* @param request
	* @param model
	* @return
	* @return String
	 */
	@RequestMapping(value = "/resetPayPassword")
	public String resetPayPassword(HttpServletRequest request) {
		/*UserVO userVO = (UserVO) request.getSession().getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
		// 说明用户存在
		if (null != userVO) {
			// 登出
			request.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, null);
		}*/
		return "userInfo/resetPayPassword";
	}
	
	
	
	
	/**
	 * 
	* @Title: accounts  
	* @Description: 跳转到我的账户页面 
	* @param request
	* @return
	* @return String
	 */
	@RequestMapping(value = "/accounts")
	public String accounts(HttpServletRequest request) {
		
		return "userInfo/accounts";
	}
	
	
	
	/**
	 * 
	* @Title: c2cTrans  
	* @Description: c2c交易页面
	* @param request
	* @return
	* @return String
	 */
	@RequestMapping(value = "/c2cTrans")
	public String c2cTrans(HttpServletRequest request) {
		
		return "transaction/c2cTrans";
	}
	
	
	
	
	/**
	 * 
	* @Title: commission  
	* @Description: 推广页面 
	* @param request
	* @return
	* @return String
	 */
	@RequestMapping(value = "/commission")
	public String commission(HttpServletRequest request) {
		
		return "userInfo/commission";
	}
	
	
	
	/**
	 * 
	* @Title: bill  
	* @Description: 账单明细页面 
	* @param request
	* @return
	* @return String
	 */
	@RequestMapping(value = "/bill")
	public String bill(HttpServletRequest request, Model model,BillVO billVO) {
		HttpSession session = request.getSession();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		// 测试数据，
		UserVO userVO = new UserVO();
		userVO.setUid("1");
		session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, userVO);

		if (null != billVO.getCurrencyId()) {
			hashMap.put("currencyId", billVO.getCurrencyId());
		}
		hashMap.put("pageNum", "1");
		hashMap.put("numPerPage", "10");
		hashMap.put("uid", userVO.getUid());
		try {
			
			// 先判断用户是否绑定过手机，如果没有绑定手机，就不需要向后台请求数据
			Boolean flag = (Boolean) session.getAttribute(SessionAttributes.USER_ISBINDPHONE);
			if (!flag) {
				model.addAttribute("list", null);
				return "record/withdrawRecord"; 
			}
			
			
			
			// 查询出的存储分页数据的对象json字符串
//			String json = withdrawCoinService.getWithdrawRecordPage(request,hashMap);
			String json = "";
			if (null != json) {
				PageVO<PageBean> pageVo = (PageVO<PageBean>) Toolkits.fromJsonToPojo(json, PageVO.class);
				String data = Toolkits.fromPojotoJson(pageVo.getData());
				PageBean pageBean = (PageBean) Toolkits.fromJsonToPojo(data, PageBean.class);
				model.addAttribute("list", pageBean.getRecordList());
			}
			return "userInfo/bill";
		} catch (Exception e) {
			log.error("{} 分页查询账单明细解析后台数据发生异常", e.toString());
			model.addAttribute("list", null);
			return "userInfo/bill";
		}
	}
	
	
	/**
	 * 
	* @Title: myDeity  
	* @Description: 我的挂单 
	* @param request
	* @return
	* @return String
	 */
	@RequestMapping(value = "/myDeity")
	public String myDeity(HttpServletRequest request, Model model,MyDeityVO myDeityVO) {
		HttpSession session = request.getSession();
		HashMap<String, String> hashMap = new HashMap<String, String>();

		// 测试数据，
		UserVO userVO = new UserVO();
		userVO.setUid("1");
		session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, userVO);

		hashMap.put("pageNum", "1");
		hashMap.put("numPerPage", "10");
		hashMap.put("uid", userVO.getUid());
		try {
			
			// 先判断用户是否绑定过手机，如果没有绑定手机，就不需要向后台请求数据
			Boolean flag = (Boolean) session.getAttribute(SessionAttributes.USER_ISBINDPHONE);
			if (!flag) {
				model.addAttribute("list", null);
				return "record/withdrawRecord"; 
			}
			
			
			
			// 查询出的存储分页数据的对象json字符串
//			String json = withdrawCoinService.getWithdrawRecordPage(request,hashMap);
			String json = "";
			if (null != json) {
				PageVO<PageBean> pageVo = (PageVO<PageBean>) Toolkits.fromJsonToPojo(json, PageVO.class);
				String data = Toolkits.fromPojotoJson(pageVo.getData());
				PageBean pageBean = (PageBean) Toolkits.fromJsonToPojo(data, PageBean.class);
				model.addAttribute("list", pageBean.getRecordList());
			}
			return "userInfo/myDeity";
		} catch (Exception e) {
			log.error("{} 分页查询账单明细解析后台数据发生异常", e.toString());
			model.addAttribute("list", null);
			return "userInfo/myDeity";
		}
	}
	
	
	
	/**
	 * 
	* @Title: transRecord  
	* @Description: 我的交易记录 
	* @param request
	* @return
	* @return String
	 */
	@RequestMapping(value = "/transRecord")
	public String transRecord(HttpServletRequest request) {
		
		return "record/transRecord";
	}
	
	
	
	/**
	 * 
	* @Title: c2cTransRecord  
	* @Description: c2c交易记录页面 
	* @param request
	* @return
	* @return String
	 */
	@RequestMapping(value = "/c2cTransRecord")
	public String c2cTransRecord(HttpServletRequest request) {
		
		return "record/c2cTransRecord";
	}
	
	
	
	
	
	
	
	/**
	 * 国际化转换
	 *
	 * @param session
	 * @param request
	 * @param lang
	 */
	@RequestMapping(value = "/changeLang")
	@ResponseBody
	public Object changeLang(HttpSession session, HttpServletRequest request, @RequestParam String lang) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		Locale locale = null;
		if (lang.equals("zh_CN")) {
			locale = new Locale("zh", "CN");
		} else if (lang.equals("en_US")) {
			locale = new Locale("en", "US");
		}

		request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale);
		session.setAttribute("locale", locale.toString());
		map.put("locale", locale.toString());

		return map;
	}
}
