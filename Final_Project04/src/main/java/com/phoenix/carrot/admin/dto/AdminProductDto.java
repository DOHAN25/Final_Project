package com.phoenix.carrot.admin.dto;

import java.util.Date;

public class AdminProductDto {
	
	private int productSeq;
	private String productName;
	private int productPrice;
	private String sellerAddress;
	private Date productRregDate;
	private String productInfo;
	private String productImg;
	private String productThumb;
	private String saleStatus;
	private String userRole;
	private int userSeq;
	private String userId;
	private String userLatitude;
	private String userLongitude; 
	
	public AdminProductDto() {
		
	}

	public AdminProductDto(int productSeq, String productName, int productPrice, String sellerAddress, Date productRregDate, String productInfo, String productImg, String productThumb, String saleStatus, String userRole, int userSeq, String userId, String userLatitude, String userLongitude) {
		
		this.productSeq = productSeq;
		this.productName = productName;
		this.productPrice = productPrice;
		this.sellerAddress = sellerAddress;
		this.productRregDate = productRregDate;
		this.productInfo = productInfo;
		this.productImg = productImg;
		this.saleStatus = saleStatus;
		this.userRole = userRole;
		this.userSeq = userSeq;
		this.userId = userId;
		this.userLatitude = userLatitude;
		this.userLongitude = userLongitude;
		
	}
	
	public int getProductSeq() {
		return productSeq;
	}

	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getSellerAddress() {
		return sellerAddress;
	}

	public void setSellerAddress(String sellerAddress) {
		this.sellerAddress = sellerAddress;
	}

	public Date getProductRregDate() {
		return productRregDate;
	}

	public void setProductRregDate(Date productRregDate) {
		this.productRregDate = productRregDate;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public String getProductThumb() {
		return productThumb;
	}

	public void setProductThumb(String productThumb) {
		this.productThumb = productThumb;
	}

	public String getSaleStatus() {
		return saleStatus;
	}

	public void setSaleStatus(String saleStatus) {
		this.saleStatus = saleStatus;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserLatitude() {
		return userLatitude;
	}

	public void setUserLatitude(String userLatitude) {
		this.userLatitude = userLatitude;
	}

	public String getUserLongitude() {
		return userLongitude;
	}

	public void setUserLongitude(String userLongitude) {
		this.userLongitude = userLongitude;
	}
	
	}
