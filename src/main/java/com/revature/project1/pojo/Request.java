package com.revature.project1.pojo;

public class Request {
	private Integer requestId;
	private String reimburseType;
	private String eventDate;
	private Boolean pending;
	public Integer getRequestId() {
		return requestId;
	}
	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}
	public String getReimburseType() {
		return reimburseType;
	}
	public void setReimburseType(String reimburseType) {
		this.reimburseType = reimburseType;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public Boolean getPending() {
		return pending;
	}
	public void setPending(Boolean pending) {
		this.pending = pending;
	}

}
