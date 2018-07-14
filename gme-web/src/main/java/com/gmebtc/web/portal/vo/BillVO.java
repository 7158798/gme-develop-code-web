package com.gmebtc.web.portal.vo;

import java.io.Serializable;

/**
 * 
 * @Project：gme-web   
 * @Class：BillVO   
 * @Description 类描述： 账单明细分页   
 * @Author：zzh 
 * @Date：2018年7月3日 下午5:36:52   
 * @version v1.0
 */
public class BillVO extends BaseVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	/**
	 * currencyId: 币种类型
	 */
	private String currencyId;
	/**
	 * operationType: 操作类型
	 */
	private String operationType;
	public String getCurrencyId() {
		return currencyId;
	}
	public void setCurrencyId(String currencyId) {
		this.currencyId = currencyId;
	}
	public String getOperationType() {
		return operationType;
	}
	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}

}
