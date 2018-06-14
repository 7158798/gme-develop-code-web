package com.gmebtc.web.portal.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;


/*
 * @Author zhou
 * @Date 2018/6/4 19:50
 * @Desc 页面跳转
 */
@Controller
public class BaseController {

    private static Logger logger = Logger.getLogger(BaseController.class);


    /**
     * @Title: loginIndex
     * @Description: 跳转到已登录主页
     * @param @return
     * @return String
     * @throws
     */
    @RequestMapping(value = "/loginIndex")
    public String loginIndex(Model model) {
    	model.addAttribute("flag","a");
        return "view/loginIndex";
    }


    /**
     * @Title: unLoginInde
     * @Description: 跳转到未登录主页
     * @param @param mav
     * @param @return
     * @return String
     * @throws
     */
    @RequestMapping(value = "/unLoginIndex")
    public String unLoginInde(Model model){
    	model.addAttribute("flag","a");
        return "view/unLoginIndex";
    }



    /**
     * @Title: login
     * @Description: 跳转到登录页面
     * @param @param model
     * @param @return
     * @return String
     * @throws
     */
    @RequestMapping(value = "/login")
    public String login(Model model){
    	model.addAttribute("flag","a");
        return "view/login";
    }
    
    


    /**
     * 
     * @Title: register
     * @Description: 跳转到注册页面
     * @param @return
     * @return String
     * @throws
     */
    @RequestMapping(value = "/register")
    public String register (){
        return "view/register";
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
