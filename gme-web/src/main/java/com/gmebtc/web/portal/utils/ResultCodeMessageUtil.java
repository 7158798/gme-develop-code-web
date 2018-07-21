package com.gmebtc.web.portal.utils;

public class ResultCodeMessageUtil {

	public final static String MsgServerError100_CN = "服务器异常,请稍后重试";
	public final static String MsgServerError100_EN = "Server exception,please try again later";

	public final static String MsgServerError101_CN = "你还没有登录,请登录后重试";
	public final static String MsgServerError101_EN = "You haven't logged in yet,please login and try again";


	public final static String MsgServerErrorUNKNOW_CN = "未知错误";
	public final static String MsgServerErrorUNKNOW_EN = "UNKNOW";
	
	public static String getCodeMessage(Integer code, String locale) {

		if ("zh_CN".equals(locale.toString())) {
			switch (code) {
			case 100: {
				return MsgServerError100_CN;
			}
			case 101: {
				return MsgServerError101_CN;
			}
			default: {
				return MsgServerErrorUNKNOW_CN;
			}
			}

		} else if ("en_US".equals(locale.toString())) {
			switch (code) {
			case 100: {
				return MsgServerError100_EN;
			}
			case 101: {
				return MsgServerError101_EN;
			}
			default: {
				return MsgServerErrorUNKNOW_EN;
			}
			}

		}

		return null;
	}
}
