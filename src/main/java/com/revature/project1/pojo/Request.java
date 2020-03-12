package com.revature.project1.pojo;

public class Request {
	@Override
	public String toString() {
		return "Request [requestId=" + requestId + ", reimburseType=" + reimburseType + ", eventDate=" + eventDate
				+ ", pending=" + pending + ", employeeId=" + employeeId + ", eventTime=" + eventTime + ", eventAddress="
				+ eventAddress + ", eventDescription=" + eventDescription + ", eventCost=" + eventCost
				+ ", gradeFormat=" + gradeFormat + ", justification=" + justification + "]";
	}
	private Integer requestId;
	private String reimburseType;
	private String eventDate;
	private boolean pending;
    private String employeeId;
	private String eventTime;
    private String eventAddress;
    private String eventDescription;
    private int eventCost;
    private String gradeFormat;
    private String justification;
    
    
    
    public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getEventTime() {
		return eventTime;
	}
	public void setEventTime(String eventTime) {
		this.eventTime = eventTime;
	}
	public String getEventAddress() {
		return eventAddress;
	}
	public void setEventAddress(String eventAddress) {
		this.eventAddress = eventAddress;
	}
	public String getEventDescription() {
		return eventDescription;
	}
	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}
	public int getEventCost() {
		return eventCost;
	}
	public void setEventCost(int eventCost) {
		this.eventCost = eventCost;
	}
	public String getGradeFormat() {
		return gradeFormat;
	}
	public void setGradeFormat(String gradeFormat) {
		this.gradeFormat = gradeFormat;
	}
	public String getJustification() {
		return justification;
	}
	public void setJustification(String justification) {
		this.justification = justification;
	}
	public int getRequestId() {
		return requestId;
	}
	public void setRequestId(int requestId) {
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
	public boolean getPending() {
		return pending;
	}
	public void setPending(boolean pending) {
		this.pending = pending;
	}

}
