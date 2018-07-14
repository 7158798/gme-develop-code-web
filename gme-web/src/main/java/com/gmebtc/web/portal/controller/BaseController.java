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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.gmebtc.web.portal.constant.SessionAttributes;
import com.gmebtc.web.portal.service.RechargeCoinService;
import com.gmebtc.web.portal.service.WithdrawCoinService;
import com.gmebtc.web.portal.utils.Toolkits;
import com.gmebtc.web.portal.vo.BillVO;
import com.gmebtc.web.portal.vo.C2CTransRecordVO;
import com.gmebtc.web.portal.vo.MyDeityVO;
import com.gmebtc.web.portal.vo.PageBean;
import com.gmebtc.web.portal.vo.PageVO;
import com.gmebtc.web.portal.vo.RechargeRecordVO;
import com.gmebtc.web.portal.vo.TransRecordVO;
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
	 * @Title: index
	 * @Description:主页
	 * @return
	 * @return String
	 */
	@RequestMapping(value = "/index")
	public String index() {
		return "index";
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
	public String rechargeRecord(HttpServletRequest request, Model model, RechargeRecordVO rechargeRecordVO) {
		HttpSession session = request.getSession();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (null != rechargeRecordVO.getStartTime() && !StringUtils.isBlank(rechargeRecordVO.getStartTime())) {
				Long startTime = simple.parse(rechargeRecordVO.getStartTime()).getTime();
				hashMap.put("startTime", startTime);
			}
			if (null != rechargeRecordVO.getEndTime() && !StringUtils.isBlank(rechargeRecordVO.getEndTime())) {
				Long endTime = simple.parse(rechargeRecordVO.getEndTime()).getTime();
				hashMap.put("endTime", endTime);
			}
		} catch (Exception e) {
			log.error("{} 查询充值记录 页面时间转换失败");
		}

		if (null != rechargeRecordVO.getCurrencyId() && !StringUtils.isBlank(rechargeRecordVO.getCurrencyId())) {
			hashMap.put("currencyId", rechargeRecordVO.getCurrencyId());
		}
		if (null != rechargeRecordVO.getStatus()) {
			hashMap.put("status", rechargeRecordVO.getStatus());
		}

		hashMap.put("pageNum", rechargeRecordVO.getPageNum());
		hashMap.put("numPerPage", rechargeRecordVO.getNumPerPage());
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");

		model.addAttribute("review", rechargeRecordVO);

		try {
			// 查询出的存储分页数据的对象json字符串
			String json = rechargeCoinService.getWalletRechargeRecord(request, hashMap);
			if (null != json) {
				PageVO<PageBean> pageVo = (PageVO<PageBean>) Toolkits.fromJsonToPojo(json, PageVO.class);
				if (!pageVo.getCode().equals("200")) {
					throw new Exception();
				}
				String data = Toolkits.fromPojotoJson(pageVo.getData());
				PageBean pageBean = (PageBean) Toolkits.fromJsonToPojo(data, PageBean.class);
				model.addAttribute("pageBean", pageBean);
//				model.addAttribute("list", pageBean.getRecordList());
			}
			return "record/rechargeRecord";
		} catch (Exception e) {
			log.error("{} 分页查询充值记录解析后台数据发生异常", e.toString());
			model.addAttribute("pageBean", null);
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
	public String withdrawRecord(HttpServletRequest request, Model model, WithdrawRecordVO withdrawRecordVO) {
		HttpSession session = request.getSession();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (null != withdrawRecordVO.getStartTime() && !StringUtils.isBlank(withdrawRecordVO.getStartTime())) {
				Long startTime = simple.parse(withdrawRecordVO.getStartTime()).getTime();
				hashMap.put("startTime", startTime);
			}
			if (null != withdrawRecordVO.getEndTime() && !StringUtils.isBlank(withdrawRecordVO.getEndTime())) {
				Long endTime = simple.parse(withdrawRecordVO.getEndTime()).getTime();
				hashMap.put("endTime", endTime);
			}
		} catch (Exception e) {
			log.error("{} 查询提现记录 页面时间转换失败");
		}

		if (null != withdrawRecordVO.getCurrencyId() && !StringUtils.isBlank(withdrawRecordVO.getCurrencyId())) {
			hashMap.put("currencyId", withdrawRecordVO.getCurrencyId());
		}
		if (null != withdrawRecordVO.getStatus()) {
			hashMap.put("status", withdrawRecordVO.getStatus());
		}

		hashMap.put("pageNum", withdrawRecordVO.getPageNum());
		hashMap.put("numPerPage", withdrawRecordVO.getNumPerPage());
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");

		model.addAttribute("review", withdrawRecordVO);

		try {

			// 先判断用户是否绑定过手机，如果没有绑定手机，就不需要向后台请求数据
			/*
			 * Boolean flag = (Boolean)
			 * session.getAttribute(SessionAttributes.USER_ISBINDPHONE); if (!flag) {
			 * model.addAttribute("list", null); return "record/withdrawRecord"; }
			 */

			// 查询出的存储分页数据的对象json字符串
			String json = withdrawCoinService.getWithdrawRecordPage(request, hashMap);
			if (null != json) {
				PageVO<PageBean> pageVo = (PageVO<PageBean>) Toolkits.fromJsonToPojo(json, PageVO.class);
				if (!pageVo.getCode().equals("200")) {
					throw new Exception();
				}
				String data = Toolkits.fromPojotoJson(pageVo.getData());
				PageBean pageBean = (PageBean) Toolkits.fromJsonToPojo(data, PageBean.class);
//				model.addAttribute("pageBean", pageBean);
				request.setAttribute("pageBean", pageBean);
				/*
				 * if (withdrawRecordVO.getStartTime()!=null &&
				 * !StringUtils.isBlank(withdrawRecordVO.getStartTime())) {
				 * request.setAttribute("pageBean", null); }
				 */
//				model.addAttribute("pageBean",pageBean);
				log.info(pageBean.toString());
			}
			return "record/withdrawRecord";
		} catch (Exception e) {
			log.error("{} 分页查询提现记录解析后台数据发生异常", e.toString());
			model.addAttribute("pageBean", null);
			return "record/withdrawRecord";
		}
	}

	@RequestMapping(value = "/withdrawRecordPage")
	public String page() {
		System.out.println("page");
		return "withdrawRecord";
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
		/*
		 * UserVO userVO = (UserVO)
		 * request.getSession().getAttribute(SessionAttributes.LOGIN_SECONDLOGIN); //
		 * 说明用户存在 if (null != userVO) { // 登出
		 * request.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, null); }
		 */
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
	 * @Description: c2c交易记录页面   见c2cTransRecordController
	 * @param request
	 * @return
	 * @return String
	 */
	@RequestMapping(value = "/c2cTransRecord")
	public String c2cTransRecord(HttpServletRequest request, Model model, C2CTransRecordVO c2cTransRecordVO) {
		HttpSession session = request.getSession();
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
			log.error("{} c2c交易记录 页面时间转换失败");
		}

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
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");

		model.addAttribute("review", c2cTransRecordVO);
		try {

			// 先判断用户是否绑定过手机，如果没有绑定手机，就不需要向后台请求数据
			/*
			 * Boolean flag = (Boolean)
			 * session.getAttribute(SessionAttributes.USER_ISBINDPHONE); if (!flag) {
			 * model.addAttribute("list", null); return "record/withdrawRecord"; }
			 */

			// 查询出的存储分页数据的对象json字符串
			String json = withdrawCoinService.getWithdrawRecordPage(request,hashMap);
			/*String json = "{\r\n" + "	\"code\": \"200\",\r\n" + "	\"message\": \"Successful\",\r\n"
					+ "	\"data\": {\r\n" + "		\"currentPage\": 1,\r\n" + "		\"numPerPage\": 2,\r\n"
					+ "		\"totalCount\": 5,\r\n" + "		\"recordList\": [{\r\n"
					+ "			\"time\": 1528807990000,\r\n" + "			\"operationType\": \"c2c交易\",\r\n"
					+ "			\"assetId\": \"20180630\",\r\n" + "			\"operationAsset\": \"80.0000 USDT\",\r\n"
					+ "			\"balance\": \"80.0000 USDT\",\r\n" + "			\"totalAsset\": \"80.0000 USDT\"\r\n"
					+ "		}, {\r\n" + "			\"time\": 1533337990000,\r\n"
					+ "			\"operationType\": \"币币交易\",\r\n" + "			\"assetId\": \"20180631\",\r\n"
					+ "			\"operationAsset\": \"20.0000 USDT\",\r\n"
					+ "			\"balance\": \"100.0000 USDT\",\r\n"
					+ "			\"totalAsset\": \"120.0000 USDT\"\r\n" + "		}, {\r\n"
					+ "			\"time\": 1528807992333,\r\n" + "			\"operationType\": \"推广返利\",\r\n"
					+ "			\"assetId\": \"20180622\",\r\n" + "			\"operationAsset\": \"333.0000 USDT\",\r\n"
					+ "			\"balance\": \"11111.0000 USDT\",\r\n"
					+ "			\"totalAsset\": \"123233.0000 USDT\"\r\n" + "		}, {\r\n"
					+ "			\"time\": 23228807992333,\r\n" + "			\"operationType\": \"c2c交易\",\r\n"
					+ "			\"assetId\": \"20180222\",\r\n" + "			\"operationAsset\": \"11.0000 USDT\",\r\n"
					+ "			\"balance\": \"34.0000 USDT\",\r\n" + "			\"totalAsset\": \"34.0000 USDT\"\r\n"
					+ "		}, {\r\n" + "			\"time\": 152880799213,\r\n"
					+ "			\"operationType\": \"推广返利\",\r\n" + "			\"assetId\": \"20180621\",\r\n"
					+ "			\"operationAsset\": \"3233.0000 USDT\",\r\n"
					+ "			\"balance\": \"32.0000 USDT\",\r\n"
					+ "			\"totalAsset\": \"1236633.0000 USDT\"\r\n" + "		}],\r\n"
					+ "		\"pageCount\": 3,\r\n" + "		\"beginPageIndex\": 1,\r\n"
					+ "		\"endPageIndex\": 3,\r\n" + "		\"countResultMap\": null\r\n" + "	},\r\n"
					+ "	\"ext\": null\r\n" + "}";*/
			if (null != json) {
				PageVO<PageBean> pageVo = (PageVO<PageBean>) Toolkits.fromJsonToPojo(json, PageVO.class);
				if (!pageVo.getCode().equals("200")) {
					throw new Exception();
				}
				String data = Toolkits.fromPojotoJson(pageVo.getData());
				PageBean pageBean = (PageBean) Toolkits.fromJsonToPojo(data, PageBean.class);
				model.addAttribute("pageBean", pageBean);
			}
			return "record/c2cTransRecord";
		} catch (Exception e) {
			log.error("{} c2c成交记录解析后台数据发生异常", e.toString());
			model.addAttribute("pageBean", null);
			return "record/c2cTransRecord";
		}
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
	public String bill(HttpServletRequest request, Model model, BillVO billVO) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (null != billVO.getStartTime() && !StringUtils.isBlank(billVO.getStartTime())) {
				Long startTime = simple.parse(billVO.getStartTime()).getTime();
				hashMap.put("startTime", startTime);
			}
			if (null != billVO.getEndTime() && !StringUtils.isBlank(billVO.getEndTime())) {
				Long endTime = simple.parse(billVO.getEndTime()).getTime();
				hashMap.put("endTime", endTime);
			}
		} catch (Exception e) {
			log.error("{} 账单明细 页面时间转换失败");
		}

		if (null != billVO.getCurrencyId()) {
			hashMap.put("currencyId", billVO.getCurrencyId());
		}
		if (null != billVO.getOperationType()) {
			hashMap.put("operationType", billVO.getOperationType());
		}

		hashMap.put("pageNum", billVO.getPageNum());
		hashMap.put("numPerPage", billVO.getNumPerPage());
		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");

		model.addAttribute("review", billVO);
		try {

			// 先判断用户是否绑定过手机，如果没有绑定手机，就不需要向后台请求数据
			/*
			 * Boolean flag = (Boolean)
			 * session.getAttribute(SessionAttributes.USER_ISBINDPHONE); if (!flag) {
			 * model.addAttribute("list", null); return "record/withdrawRecord"; }
			 */

			// 查询出的存储分页数据的对象json字符串
//			String json = withdrawCoinService.getWithdrawRecordPage(request,hashMap);
			String json = "{\r\n" + "	\"code\": \"200\",\r\n" + "	\"message\": \"Successful\",\r\n"
					+ "	\"data\": {\r\n" + "		\"currentPage\": 1,\r\n" + "		\"numPerPage\": 2,\r\n"
					+ "		\"totalCount\": 5,\r\n" + "		\"recordList\": [{\r\n"
					+ "			\"time\": 1528807990000,\r\n" + "			\"operationType\": \"c2c交易\",\r\n"
					+ "			\"assetId\": \"20180630\",\r\n" + "			\"operationAsset\": \"80.0000 USDT\",\r\n"
					+ "			\"balance\": \"80.0000 USDT\",\r\n" + "			\"totalAsset\": \"80.0000 USDT\"\r\n"
					+ "		}, {\r\n" + "			\"time\": 1533337990000,\r\n"
					+ "			\"operationType\": \"币币交易\",\r\n" + "			\"assetId\": \"20180631\",\r\n"
					+ "			\"operationAsset\": \"20.0000 USDT\",\r\n"
					+ "			\"balance\": \"100.0000 USDT\",\r\n"
					+ "			\"totalAsset\": \"120.0000 USDT\"\r\n" + "		}, {\r\n"
					+ "			\"time\": 1528807992333,\r\n" + "			\"operationType\": \"推广返利\",\r\n"
					+ "			\"assetId\": \"20180622\",\r\n" + "			\"operationAsset\": \"333.0000 USDT\",\r\n"
					+ "			\"balance\": \"11111.0000 USDT\",\r\n"
					+ "			\"totalAsset\": \"123233.0000 USDT\"\r\n" + "		}, {\r\n"
					+ "			\"time\": 23228807992333,\r\n" + "			\"operationType\": \"c2c交易\",\r\n"
					+ "			\"assetId\": \"20180222\",\r\n" + "			\"operationAsset\": \"11.0000 USDT\",\r\n"
					+ "			\"balance\": \"34.0000 USDT\",\r\n" + "			\"totalAsset\": \"34.0000 USDT\"\r\n"
					+ "		}, {\r\n" + "			\"time\": 152880799213,\r\n"
					+ "			\"operationType\": \"推广返利\",\r\n" + "			\"assetId\": \"20180621\",\r\n"
					+ "			\"operationAsset\": \"3233.0000 USDT\",\r\n"
					+ "			\"balance\": \"32.0000 USDT\",\r\n"
					+ "			\"totalAsset\": \"1236633.0000 USDT\"\r\n" + "		}],\r\n"
					+ "		\"pageCount\": 3,\r\n" + "		\"beginPageIndex\": 1,\r\n"
					+ "		\"endPageIndex\": 3,\r\n" + "		\"countResultMap\": null\r\n" + "	},\r\n"
					+ "	\"ext\": null\r\n" + "}";
			if (null != json) {
				PageVO<PageBean> pageVo = (PageVO<PageBean>) Toolkits.fromJsonToPojo(json, PageVO.class);
				if (!pageVo.getCode().equals("200")) {
					throw new Exception();
				}
				String data = Toolkits.fromPojotoJson(pageVo.getData());
				PageBean pageBean = (PageBean) Toolkits.fromJsonToPojo(data, PageBean.class);
				model.addAttribute("pageBean", pageBean);
			}
			return "userInfo/bill";
		} catch (Exception e) {
			log.error("{} 分页查询账单明细解析后台数据发生异常", e.toString());
			model.addAttribute("pageBean", null);
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
	public String myDeity(HttpServletRequest request, Model model, MyDeityVO myDeityVO) {
		HttpSession session = request.getSession();
		HashMap<String, String> hashMap = new HashMap<String, String>();

		// 测试数据，
		UserVO userVO = new UserVO();
		userVO.setUid("1");
		session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, userVO);

		hashMap.put("pageNum", myDeityVO.getPageNum());
		hashMap.put("numPerPage", "2");
		hashMap.put("uid", userVO.getUid());
		try {

			// 先判断用户是否绑定过手机，如果没有绑定手机，就不需要向后台请求数据
			/*
			 * Boolean flag = (Boolean)
			 * session.getAttribute(SessionAttributes.USER_ISBINDPHONE); if (!flag) {
			 * model.addAttribute("list", null); return "record/withdrawRecord"; }
			 */

			// 查询出的存储分页数据的对象json字符串
//			String json = withdrawCoinService.getWithdrawRecordPage(request,hashMap);
			String json = "{\r\n" + "	\"code\": \"200\",\r\n" + "	\"message\": \"Successful\",\r\n"
					+ "	\"data\": {\r\n" + "		\"currentPage\": 1,\r\n" + "		\"numPerPage\": 2,\r\n"
					+ "		\"totalCount\": 5,\r\n" + "		\"recordList\": [{\r\n"
					+ "			\"time\": 1528807990000,\r\n" + "			\"type\": \"买入\",\r\n"
					+ "			\"symbol\": \"USDT/BTC\",\r\n" + "			\"transPrice\": \"80.0000\",\r\n"
					+ "			\"num\": \"1024USDT\",\r\n" + "			\"amount\": \"100000\"\r\n" + "		}, {\r\n"
					+ "			\"time\": 1533337990000,\r\n" + "			\"type\": \"卖出\",\r\n"
					+ "			\"symbol\": \"BTC/USDT\",\r\n" + "			\"transPrice\": \"20\",\r\n"
					+ "			\"num\": \"100USDT\",\r\n" + "			\"amount\": \"12000\"\r\n" + "		}, {\r\n"
					+ "			\"time\": 1533337990000,\r\n" + "			\"type\": \"卖出\",\r\n"
					+ "			\"symbol\": \"BTC/USDT\",\r\n" + "			\"transPrice\": \"20\",\r\n"
					+ "			\"num\": \"100USDT\",\r\n" + "			\"amount\": \"12000\"\r\n" + "		}, {\r\n"
					+ "			\"time\": 1533337990000,\r\n" + "			\"type\": \"卖出\",\r\n"
					+ "			\"symbol\": \"BTC/USDT\",\r\n" + "			\"transPrice\": \"20\",\r\n"
					+ "			\"num\": \"100USDT\",\r\n" + "			\"amount\": \"12000\"\r\n" + "		}],\r\n"
					+ "		\"pageCount\": 3,\r\n" + "		\"beginPageIndex\": 1,\r\n"
					+ "		\"endPageIndex\": 3,\r\n" + "		\"countResultMap\": null\r\n" + "	},\r\n"
					+ "	\"ext\": null\r\n" + "}";
			if (null != json) {
				PageVO<PageBean> pageVo = (PageVO<PageBean>) Toolkits.fromJsonToPojo(json, PageVO.class);
				if (!pageVo.getCode().equals("200")) {
					throw new Exception();
				}
				String data = Toolkits.fromPojotoJson(pageVo.getData());
				PageBean pageBean = (PageBean) Toolkits.fromJsonToPojo(data, PageBean.class);
				model.addAttribute("pageBean", pageBean);
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
	 * @Description: 我的成交记录
	 * @param request
	 * @return
	 * @return String
	 */
	@RequestMapping(value = "/transRecord", method = { RequestMethod.POST, RequestMethod.GET })
	public String transRecord(HttpServletRequest request, Model model, TransRecordVO transRecordVO) {
		HttpSession session = request.getSession();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (null != transRecordVO.getStartTime() && !StringUtils.isBlank(transRecordVO.getStartTime())) {
				Long startTime = simple.parse(transRecordVO.getStartTime()).getTime();
				hashMap.put("startTime", startTime);
			}
			if (null != transRecordVO.getEndTime() && !StringUtils.isBlank(transRecordVO.getEndTime())) {
				Long endTime = simple.parse(transRecordVO.getEndTime()).getTime();
				hashMap.put("endTime", endTime);
			}
		} catch (Exception e) {
			log.error("{} 我的成交记录 页面时间转换失败");
		}

		// 测试数据，
		UserVO userVO = new UserVO();
		userVO.setUid("1");
		session.setAttribute(SessionAttributes.LOGIN_SECONDLOGIN, userVO);

		if (null != transRecordVO.getCurrencyId() && !StringUtils.isBlank(transRecordVO.getCurrencyId())) {
			hashMap.put("currencyId", transRecordVO.getCurrencyId());
		}
		if (null != transRecordVO.getCurrencySymbol() && !StringUtils.isBlank(transRecordVO.getCurrencySymbol())) {
			hashMap.put("currencySymbol", transRecordVO.getCurrencySymbol());
		}

		hashMap.put("pageNum", transRecordVO.getPageNum());
		hashMap.put("numPerPage", "2");
		hashMap.put("uid", userVO.getUid());

		model.addAttribute("review", transRecordVO);

		try {

			// 先判断用户是否绑定过手机，如果没有绑定手机，就不需要向后台请求数据
			/*
			 * Boolean flag = (Boolean)
			 * session.getAttribute(SessionAttributes.USER_ISBINDPHONE); if (!flag) {
			 * model.addAttribute("list", null); return "record/withdrawRecord"; }
			 */

			// 查询出的存储分页数据的对象json字符串
//			String json = withdrawCoinService.getWithdrawRecordPage(request,hashMap);
			String json = "{\r\n" + "	\"code\": \"200\",\r\n" + "	\"message\": \"Successful\",\r\n"
					+ "	\"data\": {\r\n" + "		\"currentPage\": 1,\r\n" + "		\"numPerPage\": 2,\r\n"
					+ "		\"totalCount\": 5,\r\n" + "		\"recordList\": [{\r\n"
					+ "			\"time\": 1528807990000,\r\n" + "			\"type\": \"买入\",\r\n"
					+ "			\"symbol\": \"USDT/BTC\",\r\n" + "			\"transPrice\": \"80.0000\",\r\n"
					+ "			\"num\": \"1024USDT\",\r\n" + "			\"amount\": \"100000\"\r\n" + "		}, {\r\n"
					+ "			\"time\": 1533337990000,\r\n" + "			\"type\": \"卖出\",\r\n"
					+ "			\"symbol\": \"BTC/USDT\",\r\n" + "			\"transPrice\": \"20\",\r\n"
					+ "			\"num\": \"100USDT\",\r\n" + "			\"amount\": \"12000\"\r\n" + "		}, {\r\n"
					+ "			\"time\": 1533337990000,\r\n" + "			\"type\": \"卖出\",\r\n"
					+ "			\"symbol\": \"BTC/USDT\",\r\n" + "			\"transPrice\": \"20\",\r\n"
					+ "			\"num\": \"100USDT\",\r\n" + "			\"amount\": \"12000\"\r\n" + "		}, {\r\n"
					+ "			\"time\": 1533337990000,\r\n" + "			\"type\": \"卖出\",\r\n"
					+ "			\"symbol\": \"BTC/USDT\",\r\n" + "			\"transPrice\": \"20\",\r\n"
					+ "			\"num\": \"100USDT\",\r\n" + "			\"amount\": \"12000\"\r\n" + "		}],\r\n"
					+ "		\"pageCount\": 3,\r\n" + "		\"beginPageIndex\": 1,\r\n"
					+ "		\"endPageIndex\": 3,\r\n" + "		\"countResultMap\": null\r\n" + "	},\r\n"
					+ "	\"ext\": null\r\n" + "}";
			if (null != json) {
				PageVO<PageBean> pageVo = (PageVO<PageBean>) Toolkits.fromJsonToPojo(json, PageVO.class);
				if (!pageVo.getCode().equals("200")) {
					throw new Exception();
				}
				String data = Toolkits.fromPojotoJson(pageVo.getData());
				PageBean pageBean = (PageBean) Toolkits.fromJsonToPojo(data, PageBean.class);
				model.addAttribute("pageBean", pageBean);
			}
			return "record/transRecord";
		} catch (Exception e) {
			log.error("{} 分页查询我的交易记录解析后台数据发生异常", e.toString());
			model.addAttribute("pageBean", null);
			return "record/transRecord";
		}
	}

	/**
	 * 
	 * @Title: c2cTransRecord
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
	 * @Title: walletAddress
	 * @Description: 查询提币地址
	 * @param request
	 * @param model
	 * @param currencyIdList
	 * @return
	 * @return String
	 */
	@RequestMapping(value = "/walletAddress")
	public String walletAddress(HttpServletRequest request, Model model, String currencyAddressId) {
		return "wallet/walletAddress";
		/*HttpSession session = request.getSession();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		if (null != currencyAddressId && !StringUtils.isBlank(currencyAddressId)) {
			hashMap.put("currencyId", currencyAddressId);
		}

		hashMap.put("uid", "91f9cfcf-7a95-11e8-ad83-4ccc6ad6addc");

		String currencyId = (String) session.getAttribute(SessionAttributes.SAVE_CURRENCYID_REVIEW);
		model.addAttribute("review",currencyId);
		
		try {
			String json = withdrawCoinService.getWithdrawAddress(request, hashMap);
			if (null != json) {
				PageVO<PageBean> result = (PageVO<PageBean>) Toolkits.fromJsonToPojo(json, PageVO.class);
				if (!result.getCode().equals("200")) {
					throw new Exception();
				}
				model.addAttribute("result", result.getData());
			}
			return "wallet/walletAddress";
		} catch (Exception e) {
			log.error("{} 查询提币地址 解析后台数据发生异常", e.toString());
			model.addAttribute("result", null);
			return "wallet/walletAddress";
		}*/
	}
	
	
	
	/**
	 * 
	* @Title: USDTWithdraw  
	* @Description: usdt提现页面 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/USDTWithdraw",method = RequestMethod.GET)
	public String USDTWithdraw () {
		return "wallet/USDTWithdraw";
	}
	
	
	
	/**
	 * 
	* @Title: bbTrans  
	* @Description: 币币交易页面 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/bbTrans",method = RequestMethod.GET)
	public String bbTrans () {
		return "transaction/bbTrans";
	}
	
	
	
	
	/** ===================================安全相关================================================*/
	
	/**
	 * 
	* @Title: securityLog  
	* @Description: 安全日志页面 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/securityLog",method = RequestMethod.GET)
	public String securityLog () {
		return "security/securityLog";
	}
	
	
	
	/**
	 * 
	* @Title: paySetting  
	* @Description: 支付设置 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/paySetting",method = RequestMethod.GET)
	public String paySetting (HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		// 检查用户是否实名认证
		// TODO
		
		
		
		// 检查用户信息，是否绑定银行卡，以及是否绑定支付宝，微信
		
		// 仿数据
		/*session.setAttribute("isBindBankCard", "true");
		session.setAttribute("isBindAlipay", "true");
		session.setAttribute("isBindWeChat", "true");
		session.setAttribute("", "张三");
		
		String bankCard = (String) session.getAttribute("isBindBankCard");
		String alipay = (String) session.getAttribute("isBindAlipay");
		String wechat = (String) session.getAttribute("isBindWeChat");
		String name = (String) session.getAttribute("name");*/
		
		model.addAttribute("bankCard","true");
		model.addAttribute("alipay", "true");
		model.addAttribute("wechat", "true");
		model.addAttribute("name", "张三");
		
		model.addAttribute("bank", "建设银行");
		model.addAttribute("branch", "深圳");
		model.addAttribute("bankCardNum", "1111111111111133334");
		
		
		model.addAttribute("aliPayImgUrl", "http://img05.tooopen.com/images/20150820/tooopen_sy_139205349641.jpg");
		model.addAttribute("aliPayNum", "13660728071");
		model.addAttribute("aliPayremark", "支付宝支付宝");
		
		
		model.addAttribute("wechatImgUrl", "http://pic.pptbz.com/201506/2015070581208537.JPG");
		model.addAttribute("wechatNum", "aaaaaaa");
		model.addAttribute("wechatremark", "微信微信");
		
		
		return "security/paySetting";
	}
	
	
	/**
	 * 
	* @Title: withdrawDoubleValida  
	* @Description: 提币双重认证 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/withdrawDoubleValida",method = RequestMethod.GET)
	public String withdrawDoubleValida (HttpServletRequest request,Model model) {
		
		// 查询用户是否绑定了手机
		model.addAttribute("isBindPhone", "true");
		model.addAttribute("phoneCode","13660728071");
		
		// 查询用户是否绑定了邮箱
		model.addAttribute("isBindEmail","true");
		model.addAttribute("email","2035@qq.com");
		
		
		return "security/withdrawDoubleValida";
	}
	
	
	/**
	 * 
	* @Title: bindEmail  
	* @Description: 邮箱绑定 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/bindEmail",method = RequestMethod.GET)
	public String bindEmail (HttpServletRequest request,Model model) {
		// 检查用户信息,是否绑定手机号
		HttpSession session = request.getSession();
		
		// 仿数据
		session.setAttribute("bindEmail", "123***@qq.com");
		String bindEmail = (String) session.getAttribute("bindEmail");
		if (null != bindEmail) {
			// 存手机尾号
			model.addAttribute("email",bindEmail);
			model.addAttribute("bindEmail", "true");
		} else {
			model.addAttribute("bindEmail", "false");
		}
		
		
		return "security/bindEmail";
	}
	
	
	/**
	 * 
	* @Title: api  
	* @Description: api页面 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/api",method = RequestMethod.GET)
	public String api () {
		return "security/api";
	}
	
	
	/**
	 * 
	* @Title: secondLoginProtect  
	* @Description: 二步登录保护页面 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/secondLoginProtect",method = RequestMethod.GET)
	public String secondLoginProtect (HttpServletRequest request,Model model) {
		
		
		// 检查用户是否绑定了手机
		// TODO
		
		
		
		
		// 检查用户信息,是否已经绑定二步登录
		HttpSession session = request.getSession();
		
		// 仿数据
		session.setAttribute("isBindSecondLogin", "true");
		String isBindSecondLogin = (String) session.getAttribute("isBindSecondLogin");
		if (null != isBindSecondLogin) {
			// 存状态
			model.addAttribute("secondLogin","false");
		} else {
			model.addAttribute("secondLogin", "true");
		}
		
		
		
		return "security/secondLoginProtect";
	}
	
	
	/**
	 * 
	* @Title: bindPhone  
	* @Description: 手机绑定 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/bindPhone",method = RequestMethod.GET)
	public String bindPhone (HttpServletRequest request,Model model) {
		// 检查用户信息,是否绑定手机号
		HttpSession session = request.getSession();
		
		// 仿数据
		session.setAttribute("bindPhone", "13697103161");
		String bindPhone = (String) session.getAttribute("bindPhone");
		if (null != bindPhone) {
			// 存手机尾号
			model.addAttribute("phone",bindPhone.substring(bindPhone.length()-2,bindPhone.length()));
			model.addAttribute("bindPhone", "true");
		} else {
			model.addAttribute("bindPhone", "false");
		}
		
		return "security/bindPhone";
	}
	
	
	/**
	 * 
	* @Title: realNameAuth  
	* @Description: 实名认证 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/realNameAuth",method = RequestMethod.GET)
	public String realNameAuth (HttpServletRequest request,Model model) {
		// 判断用户是否已经提交实名认证
		// TODO
		
		
		// 判断用户实名认证处在的状态，返回不同的页面
		// TODO
		
		
		return "security/realNameAuth";
	}
	
	
	
	
	
	
	/** ===================================公告相关================================================*/
	
	
	
	/**
	 * 
	* @Title: notice  
	* @Description: 公告页面 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/notice",method = RequestMethod.GET)
	public String notice () {
		return "other/notice";
	}
	
	/**
	 * 
	* @Title: noticeDetail  
	* @Description: 公告详情页面 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/noticeDetail",method = RequestMethod.GET)
	public String noticeDetail () {
		return "other/noticeDetail";
	}
	

	
	/**
	 * 
	* @Title: currencyDetail  
	* @Description: 币种详情页面 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/currencyDetail",method = RequestMethod.GET)
	public String currencyDetail () {
		return "other/currencyDetail";
	}
	
	@RequestMapping(value = "/zhifushezhi",method = RequestMethod.GET)
	public String zhifushezhi () {
		return "security/zhifushezhi";
	}
	
	
	
	/**=============================================工单页面==========================*/
	/**
	 * 
	* @Title: myWorkList  
	* @Description: 提交工单页面 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/myWorkList",method = RequestMethod.GET)
	public String myWorkList () {
		return "userInfo/myWorkList";
	}
	
	
	/**
	 * 
	* @Title: workListDetail  
	* @Description: 工单详情页面 
	* @return
	* @return String
	 */
	@RequestMapping(value = "/workListDetail",method = RequestMethod.GET)
	public String workListDetail (Model model,@RequestParam String subjectId) {
		model.addAttribute("subjectId", subjectId);
		
		return "userInfo/workListDetail";
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
