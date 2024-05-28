package model;

import java.util.List;

public class Product {
	private String idP;
	private String nameP;
	private double priceP;
	private double priceSale;
	private List<Image> listImage;
	private int sale;
	private String vendorId;
	private int status;
	public Product(){

	}

	public Product(String idP, String nameP, double priceP, double priceSale, List<Image> listImage, int sale, String vendorId, int status) {
		this.idP = idP;
		this.nameP = nameP;
		this.priceP = priceP;
		this.priceSale = priceSale;
		this.listImage = listImage;
		this.sale = sale;
		this.vendorId = vendorId;
		this.status = status;
	}

	public Product(String idP, String nameP, double priceP, List<Image> listImage, int sale, String vendorId, int status) {
		this.idP = idP;
		this.nameP = nameP;
		this.priceP = priceP;
		this.listImage = listImage;
		this.sale = sale;
		this.vendorId = vendorId;
		this.status = status;
	}

	public double getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(double priceSale) {
		this.priceSale = priceSale;
	}


	public String getIdP() {
		return idP;
	}
	public void setIdP(String idP) {
		this.idP = idP;
	}
	public String getNameP() {
		return nameP;
	}
	public void setNameP(String nameP) {
		this.nameP = nameP;
	}
	public double getPriceP() {
		return priceP;
	}
	public void setPriceP(double priceP) {
		this.priceP = priceP;
	}
	public List<Image> getListImage() {
		return listImage;
	}
	public void setListImage(List<Image> listImage) {
		this.listImage = listImage;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public String getVendorId() {
		return vendorId;
	}
	public void setVendorId(String vendorId) {
		this.vendorId = vendorId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Product{" +
				"idP='" + idP + '\'' +
				", nameP='" + nameP + '\'' +
				", priceP=" + priceP +
				", priceSale=" + priceSale +
				", listImage=" + listImage +
				", sale=" + sale +
				", vendorId='" + vendorId + '\'' +
				", status=" + status +
				'}';
	}
}
