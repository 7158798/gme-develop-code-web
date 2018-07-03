package com.gmebtc.web.portal.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.gmebtc.web.portal.constant.SessionAttributes;
import com.gmebtc.web.portal.vo.UserVO;


/**
 * 
 * @Project：gme-web   
 * @Class：UserLoginFilter   
 * @Description 用户是否登录拦截器    
 * @Author：zhou   
 * @Date：2018年6月27日 下午10:00:33   
 * @version V1.0
 */
public class UserLoginFilter extends HandlerInterceptorAdapter{
	
	
	
	
	/**
	 * 
	 * @Title: preHandle
	 * @Description: TODO 在用户访问被拦截的controller前处理，主要判断用户是否有权限访问
	 * @param @param request
	 * @param @param response
	 * @param @param handler
	 * @param @return
	 * @return boolean
	 * @throws
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		// session是否有用户二步登录后的信息
		UserVO userVO = (UserVO) session.getAttribute(SessionAttributes.LOGIN_SECONDLOGIN);
		if (null == userVO) {
			// 没有登录，并且被拦截，跳转到登录页面
			response.sendRedirect("http://192.168.0.148:8080/gme-web/firstLogin.html");
			return false;
		}
		
		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	

}
