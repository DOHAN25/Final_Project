package com.phoenix.carrot.order.dto;

import java.util.Date;

public class OrderDto {
	
	private int orderSeq;
	private int productPrice;
	private String receiverName;
	private String receiverOaddress;
	private String receiverAddress;
	private String receiverDetailaddress;
	private int quantity;
	private String productName;
	private Date orderDate;
	private String userId;
	private int orderAmount;
	private String receiverPhone;
	public OrderDto() {
		
	}
	public OrderDto(int orderSeq, int productPrice, String receiverName, String receiverOaddress,
			String receiverAddress, String receiverDetailaddress, int quantity, String productName, Date orderDate,
			String userId, int orderAmount, String receiverPhone) {
		super();
		this.orderSeq = orderSeq;
		this.productPrice = productPrice;
		this.receiverName = receiverName;
		this.receiverOaddress = receiverOaddress;
		this.receiverAddress = receiverAddress;
		this.receiverDetailaddress = receiverDetailaddress;
		this.quantity = quantity;
		this.productName = productName;
		this.orderDate = orderDate;
		this.userId = userId;
		this.orderAmount = orderAmount;
		this.receiverPhone = receiverPhone;
	}
	public int getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverOaddress() {
		return receiverOaddress;
	}
	public void setReceiverOaddress(String receiverOaddress) {
		this.receiverOaddress = receiverOaddress;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public String getReceiverDetailaddress() {
		return receiverDetailaddress;
	}
	public void setReceiverDetailaddress(String receiverDetailaddress) {
		this.receiverDetailaddress = receiverDetailaddress;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	
	

}
