package com.gmebtc.web.portal.vo;

import java.io.Serializable;
import java.util.Date;

import com.gmebtc.web.portal.constant.Page;

/**
 * 
 * @Project：gme-web   
 * @Class：BaseVO   
 * @Description 类描述： 分页查询基础vo   
 * @Author：zzh 
 * @Date：2018年7月3日 下午5:17:33   
 * @version v1.0
 */
public class BaseVO implements Serializable{
	private static final long serialVersionUID = 1L;
	/**
	 * pageNum: 当前页数,默认为1
	 */
	private String pageNum = Page.PAGENUM;
	/**
	 * numPerPage: 一页显示多少数据,默认为10
	 */
	private String numPerPage = Page.NUMPERPAGE;
	
	
	/**
	 * startDate: 开始时间
	 */
	private String startTime;
	
	/**
	 * endDate: 结束时间
	 */
	private String endTime;
	
	
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public String getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(String numPerPage) {
		this.numPerPage = numPerPage;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
}