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
	private Integer currencyId;
	/**
	 * operationType: 操作类型
	 */
	private Integer operationType;
	public Integer getCurrencyId() {
		return currencyId;
	}
	public void setCurrencyId(Integer currencyId) {
		this.currencyId = currencyId;
	}
	public Integer getOperationType() {
		return operationType;
	}
	public void setOperationType(Integer operationType) {
		this.operationType = operationType;
	}

}
