package com.gmebtc.web.portal.utils;

import java.io.File;
import java.lang.reflect.Method;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.gmebtc.web.portal.constant.ResultCode;
import com.gmebtc.web.portal.net.CommonUtil;
import com.gmebtc.web.portal.result.ResponseResult;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonParser;

/**
 * 实用工具类。
 * Mar 6, 2014 3:15:41 PM
 */
public final class Toolkits{
	
	private static final Logger log = LoggerFactory.getLogger(Toolkits.class);
	private static final JsonParser jsonParser = new JsonParser();
	private static Gson gson = null;

	
	static
	{
		//构建gson翻译器。
		GsonBuilder gsonBuilder = new GsonBuilder();
		gson = gsonBuilder.create();
	}
	private static final String[] ARRAY_SPECIAL_SCALE34 = 
	{
		"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
		"A", "B", "C", "D", "E", "F", "G", "H", "J", "K",
		"L", "M", "N", "P", "Q", "R", "S", "T", "U", "V",
		"W", "X", "Y", "Z",
	};


	/**
	 * 将List转换为数组对象。
	 * @param list List实例。
	 * @return 转换后的对象数组。
	 */
	public static final Object[] list2Array(List<?> list)
	{
		Object[] object = list.toArray();
		Object[] array = new String[object.length];
		System.arraycopy(object, 0, array, 0, object.length);
		return array;
	}

	/**
	 * 返回对象的默认字符串形式。如果对象为空，则返回str定义的字符串。
	 * @param object 参数对象。
	 * @return 字符串。
	 */
	public static final String defaultString(Object object)
	{
		return defaultString(object, StringUtils.EMPTY);
	}

	/**
	 * 返回对象的默认字符串形式。如果对象为空，则返回str定义的字符串。
	 * @param object 参数对象。
	 * @param str 默认返回的字符串。
	 * @return 字符串。
	 */
	public static final String defaultString(Object object, String str)
	{
		if(object != null && object.equals("null"))
		{
			object = null;
		}
		return (object == null)? str: object.toString();
	}

	/**
	 * 返回第一个匹配的字符串。
	 * @param str 要匹配的字符串。
	 * @param patternString 正则表达式。
	 * @return 匹配的字符串。
	 */
	public static final String matcherString(String str, String patternString)
	{
		Pattern pattern = Pattern.compile(patternString);
		Matcher matcher = pattern.matcher(str.replaceAll("[\\n\\r]", StringUtils.EMPTY));
		if(matcher.find())
		{
//			customPropertyBundle.getKeys();
			return matcher.group(1).trim();
		}
		else
		{
			return StringUtils.EMPTY;
		}
	}

	/**
	 * 获取类的全部方法名。
	 * @param fullClassName 类名。
	 * @param include 包含的关键字。
	 * @return 列表对象。
	 * @throws Exception Exception 实例。
	 */
	public static final List<?> getMethodByClassName(String fullClassName, String include) throws Exception
	{
		int pos = fullClassName.lastIndexOf(".");
		String packageName = fullClassName.substring(0, pos);
		String className = fullClassName.substring(pos + 1);
		return getMethodByClassName(packageName, className, include);
	}

	/**
	 * 获取类的全部方法名。
	 * @param packageName 包名。
	 * @param className 类名。
	 * @param include 包含的关键字。
	 * @return 列表对象。
	 * @throws Exception Exception 实例。
	 */
	public static final List<?> getMethodByClassName(String packageName, String className, String include) throws Exception
	{
		List<String> list = new ArrayList<String>();
		Class<?> clazz = Class.forName(packageName.concat(".").concat(className));
		Method[] method = clazz.getMethods();
		for(int i = 0; i < method.length; i++)
		{
			if(!include.equals(""))
			{
				if(method[i].getName().indexOf(include) != -1)
				{
					list.add(method[i].getName());
				}
			}
			else
			{
				list.add(method[i].getName());
			}
		}
		return list;
	}

	/**
	 * 获取包下的所有类的方法名。
	 * @param packageName 包名。
	 * @return Map 实例。
	 * @throws Exception Exception 实例。
	 */
	public static final Map<?, ?> getAllMethodByPackageName(String packageName) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		String packageDirName = packageName.replace('.', '/');
		Enumeration<URL> dirs = Thread.currentThread().getContextClassLoader().getResources(packageDirName);
		while(dirs.hasMoreElements())
		{
			URL url = dirs.nextElement();
			File[] files = new File(url.getPath()).listFiles();
			for(int i = 0; i < files.length; i++)
			{
				if(!files[i].isDirectory())
				{
					String className = StringUtils.substringBefore(files[i].getName(), ".class");
					List<?> list = getMethodByClassName(packageName, className, "");
					map.put(packageName.concat(".").concat(className), list);
				}
			}
		}
		return map;
	}

	/**
	 * 获取包下的所有类名。
	 * @param packageName 包名。
	 * @return List 实例。
	 * @throws Exception Exception 实例。
	 */
	public static final List<?> getAllClassByPackageName(String packageName) throws Exception
	{
		return getAllClassByPackageName(packageName, "");
	}

	/**
	 * 获取包下的所有类名。
	 * @param packageName 包名。
	 * @param include 包含的关键字。
	 * @return List 实例。
	 * @throws Exception Exception 实例。
	 */
	public static final List<?> getAllClassByPackageName(String packageName, String include) throws Exception
	{
		List<String> list = new ArrayList<String>();
		String packageDirName = packageName.replace('.', '/');
		Enumeration<URL> dirs = Thread.currentThread().getContextClassLoader().getResources(packageDirName);
		while(dirs.hasMoreElements())
		{
			URL url = dirs.nextElement();
			File[] files = new File(url.getPath()).listFiles();
			for(int i = 0; i < files.length; i++)
			{
				if(!files[i].isDirectory())
				{
					String className = StringUtils.substringBefore(files[i].getName(), ".class");
					if(!include.equals(""))
					{
						if(className.indexOf(include) != -1)
						{
							list.add(packageName.concat(".").concat(className));
						}
					}
					else
					{
						list.add(packageName.concat(".").concat(className));
					}
				}
			}
		}
		return list;
	}

	/**
	 * 从指定的资源包加载指定的键值。
	 * @param resourceBundle 资源包。
	 * @param key 指定的键。
	 * @return 指定的键值。
	 * Mar 24, 2016 4:08:40 PM
	 
	 * @since jdk 1.6.X+
	 */
	public static final String getResourceBundleValue(ResourceBundle resourceBundle, String key)
	{
		String value = "";
		try
		{
			value = StringUtils.defaultString(resourceBundle.getString(key));
		}
		catch(Exception ex)
		{}
		return value;
	}



	/**
	 * 获取客户端的IP地址。
	 * @param request HttpServletRequest 实例。
	 * @return 客户端的IP地址。
	 */
	public static final String getIpAddress(HttpServletRequest request)
	{
		String ip = request.getHeader("X-Forwarded-For");
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	/**
	 * 将对象转换为JSON字符串。
	 * @param objecr 要转换的对象。
	 * @return 转换后的字符串。
	 */
	public static final String fromPojotoJson(Object objecr)
	{
		String returnJson = "";
		if(objecr != null)
		{
			returnJson = gson.toJson(objecr);
		}
		return returnJson;
	}

	/**
	 * 将一个json字符串按配置进行美化输出。
	 * @param json json字符串。
	 * @return 美化后的字符串。
	 */
	public static final String toJson(String json)
	{
		String returnJson = "";
		if(!defaultString(json).equals(""))
		{
			returnJson = gson.toJson(jsonParser.parse(json));
		}
		return returnJson;
	}

	/**
	 * 将JSON字符串转换为对象。
	 * @param json json字符串。
	 * @param clazz 目标对象类类型。
	 * @return 转换后的对象。
	 */
	public static final Object fromJsonToPojo(String json, Class<?> clazz)
	{
		Object returnObject = null;
		if(!defaultString(json).equals("") && clazz != null)
		{
			returnObject = gson.fromJson(json, clazz);
		}
		return returnObject;
	}


	/**
	 * @Author zhou
	 * @Date 2018/5/30 15:30
	 * @Param [json:要被转换的json字符串]
	 * @Desc 验证从后台传过来的状态码,进行国际化的转换
	 */
	public static final  ResponseResult messageTransformation (HttpServletRequest request,String json){
		Locale locale = (Locale) request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
		Map<String, String> map = new HashMap<String, String>();
		if ("zh_CN".equals(locale.toString())) {
			// TODO
//			map.put("msg1", "手机号不能为空");
//			map.put("msg2", "验证码类型不能为空");
//			map.put("msg3", "验证码不能为空");
		}
		if ("en_US".equals(locale.toString())) {
			// TODO
//			map.put("msg1", "Cell phone number can not be empty");
//			map.put("msg2", "The type of verifying code can not be empty");
//			map.put("msg3", "The verifying code cannot be empty");
		}
		ResponseResult result = null;
		if (null == json || "".equals(json)) {
			result = new ResponseResult();
			result.setCode("-1");
			result.setMessage("服务器发生异常");
			result.setData("");
			return result;
		} else {
			try {
				result = (ResponseResult) fromJsonToPojo(json, ResponseResult.class);
			} catch (Exception e) {
				result.setCode("-1");
				result.setMessage("后台数据格式错误");
				result.setData("");
				return result;
			}
		}
		return result;
	}
	
	
	
	/**
	 * 
	 * @Title: HandleResp
	 * @Description: TODO 处理从后台返回的json数据
	 * @param @param request
	 * @param @param json
	 * @param @return
	 * @return ResponseResult
	 * @throws
	 */
	public static ResponseResult handleResp (String json){
		ResponseResult result = new ResponseResult();
		try {
			result = (ResponseResult) fromJsonToPojo(json, ResponseResult.class);
			if (result.getCode().startsWith("1")) {
				result.setMessage("服务器正在处理,请稍等");
				log.info("后台返回状态码code:{}",result.getCode());
				return result;
			}else if (result.getCode().startsWith("4")) {
				if (result.getCode().equals(ResultCode.NO_PASS_VALIDATE)) {
					result.setMessage("你没有通过验证,请重新验证后重试");
					log.error("{} 后台返回状态码code:{}",result.getCode());
					return result;
				}
				if (result.getCode().equals(ResultCode.USER_ALREADY_REGISTER)) {
					result.setMessage("此账号已被注册，请直接登录");
					log.error("{} 后台返回状态码code:{}",result.getCode());
					return result;
				}
				if (result.getCode().equals(ResultCode.LOGINID_PASSWORD_ERROR)) {
					result.setMessage("用户名或密码验证错误");
					log.error("{} 后台返回状态码code:{}",result.getCode());
					return result;
				}
				// 参数传递错误，内部错误，不提示消息
				result.setCode(ResultCode.WEB_ERROR);
				result.setMessage("");
				log.error("{} 后台返回状态码code:{}",result.getCode());
				return result;
			}
			return result;
		} catch (Exception e) {
			result.setCode(ResultCode.SYSTEM_ERROR);
			result.setMessage("服务器异常,请稍后重试");
			result.setData("");
			log.error("{} 处理后台返回的结果出现错误",e.toString());
			return result;
		}
	}
	
	


	/**
	 * 判断是否为IE浏览器。
	 * @param request HttpServletRequest 实例。
	 * @return 是否为IE浏览器。
	 * Mar 9, 2016 3:02:01 PM
	 * @since jdk 1.6.X+
	 */
	public static final boolean isMSIE(HttpServletRequest request)
	{
		return (request.getHeader("USER-AGENT").toLowerCase().indexOf("msie") > 0 || request.getHeader("USER-AGENT").toLowerCase().indexOf("rv:11.0") > 0)? true: false;
	}
	
	/**
	 * 是否为邮箱
	 * @param email
	 * @return
	 */
	public static boolean isEmail(String email) {
		String str = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
		Pattern p = Pattern.compile(str);
		Matcher m = p.matcher(email);
		return m.matches();
	}

	public static boolean isPhone (String phone){
//		String regExp = "^[1]([3][0-9]{1}|59|58|88|89)[0-9]{8}$";
		String regExp = "1[358][0-9]{9}";
		Pattern p = Pattern.compile(regExp);
		Matcher m = p.matcher(phone);
		return m.matches();
	}
}