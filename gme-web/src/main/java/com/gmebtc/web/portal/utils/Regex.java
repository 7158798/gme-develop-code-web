package com.gmebtc.web.portal.utils;

/**
 * @Description: 正则表达式 
 * @Author : Jinny.Ding
 * @Date: 2016年9月12日 下午8:05:04
 * @Version: 1.0 .
 * @param <T>
 */
public class Regex {
	/**
     * 手机号码: 
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[0, 1, 6, 7, 8], 18[0-9]
     * 移动号段: 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     * 联通号段: 130,131,132,145,152,155,156,170,171,175,176,185,186
     * 电信号段: 133,134,153,170,177,180,181,189
     */
    static final String MOBILE = "^1(3[0-9]|4[57]|5[0-35-9]|7[0351678]|8[0-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     */
    static final String CM = "^1(3[4-9]|4[7]|5[0-27-9]|7[038]|8[2-478])\\d{8}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,152,155,156,170,171,176,185,186
     */
    static final String CU = "^1(3[0-2]|4[5]|5[256]|7[01536]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,134,153,170,177,180,181,189
     */
    static final String CT = "^1(3[34]|53|7[037]|8[019])\\d{8}$";
    
    /**
     * 字母和数字组合
     **/
    static final String EXTERNAL_ID = "^[A-Za-z0-9-]{10,50}$";
    
    /**
     * 邮箱地址正则
     */
    static final String SINGLE_EMAIL_REGEX = "^([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$";

}
