package com.Infinite.inventoryproject;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="wallet")
public class Wallet {
  
	@Id
	@Column(name="walletId")
	private String walletId;
	
	@Column(name="customerid")
	private String customerid;
	
	@Column(name="walletType")
	@Enumerated(EnumType.STRING)
	private Type walletType;
	
	@Column(name="amt")
	private double amt;

	public String getWalletId() {
		return walletId;
	}

	public void setWalletId(String walletId) {
		this.walletId = walletId;
	}

	public String getCustomerid() {
		return customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public Type getWalletType() {
		return walletType;
	}

	public void setWalletType(Type walletType) {
		this.walletType = walletType;
	}

	public double getAmt() {
		return amt;
	}

	public void setAmt(double amt) {
		this.amt = amt;
	}
	
}