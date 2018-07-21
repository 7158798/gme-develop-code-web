package com.gmebtc.web.portal.filter;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.gmebtc.web.portal.constant.ResultCode;
import com.gmebtc.web.portal.constant.SessionAttributes;
import com.gmebtc.web.portal.entity.UserInfo;
import com.gmebtc.web.portal.result.ResponseResult;
import com.gmebtc.web.portal.service.SecurityConterService;
import com.gmebtc.web.portal.utils.Toolkits;
import com.gmebtc.web.portal.vo.UserVO;


/**
 * 
 * @Project：gme-web   
 * @Class：CheckUserInfoFilter   
 * @Description 类描述： 用户是否绑定手机拦截器   
 * @Author：zzh 
 * @Date：2018年7月2日 下午9:01:28   
 * @version v1.0
 */
public class CheckUserInfoFilter extends HandlerInterceptorAdapter{

	@Resource(name = "securityConterService")
	private SecurityConterService securityConterService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		
		HashMap<String, String> hashMap = new HashMap<String, String>();
		UserVO userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
		if (null != userVO) {
			String uid = userVO.getUid();
			hashMap.put("uid", uid);
			try {
				String json = securityConterService.checkUserIdentify(request, hashMap);
				ResponseResult result = Toolkits.handleResp(json);
				if (null != result && result.getCode() == 200) {
					UserInfo userInfo = (UserInfo) Toolkits.fromJsonToPojo(Toolkits.fromPojotoJson(result.getData()), UserInfo.class);
					if (null != userInfo) {
						// 将检查用户的信息存入session中
						session.setAttribute(SessionAttributes.USER_INFO, userInfo);
						if (userInfo.getIsBindPhone() == 1) {
							session.setAttribute(SessionAttributes.USER_ISBINDPHONE, "true");
						}else if (userInfo.getIsBindEmail() == 1) { 
							session.setAttribute(SessionAttributes.USER_ISBINDEMAIL, "true");
						}else if (userInfo.getIsIdentityAuthApply() == 1) {
							session.setAttribute(SessionAttributes.USER_ISAUTH, "true");
						}else if (userInfo.getIsAlipay() == 1) {
							session.setAttribute(SessionAttributes.USER_ISBINDALIPAY, "true");
						}else if (userInfo.getIsWechat() == 1) {
							session.setAttribute(SessionAttributes.USER_ISBINDWECHAT, "true");
						}else if (userInfo.getIsBankCard() == 1) {
							session.setAttribute(SessionAttributes.USER_ISBINDBANKCARD, "true");
						}else if (userInfo.getIsTwoStep() == 1) {
							session.setAttribute(SessionAttributes.USER_ISTWOSTEP, "true");
						}else if (userInfo.getIsWithdrawCoinCheckPhone() == 1) {
							session.setAttribute(SessionAttributes.USER_ISWITHDRAWPHONE, "true");
						}else if (userInfo.getIsTwoStep() == 1) {
							session.setAttribute(SessionAttributes.USER_ISWITHDRAWEMAIL, "true");
						}
					}
					return true;
				}else {
					return true;
				}
			} catch (Exception e) {
				return true;
			}
		}else {
			response.sendRedirect("http://192.168.0.148:8081/gme-web/firstLogin.html");
			return false;
		}
		
		
	}

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
	

}
