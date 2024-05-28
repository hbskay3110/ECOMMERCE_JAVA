package model;

public class BillProduct {
	private String idP;
	private String nameP;
	private double price;
	private int quantity;
	private double total;
	private String nameImage;
	public BillProduct(String idP, String nameP, double price, int quantity, double total, String nameImage) {
		super();
		this.idP = idP;
		this.nameP = nameP;
		this.price = price;
		this.quantity = quantity;
		this.total = total;
		this.nameImage = nameImage;
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
	public Double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getNameImage() {
		return nameImage;
	}
	public void setNameImage(String nameImage) {
		this.nameImage = nameImage;
	}
	@Override
	public String toString() {
		return "BillProduct [idP=" + idP + ", nameP=" + nameP + ", price=" + price + ", quantity=" + quantity
				+ ", total=" + total + ", nameImage=" + nameImage + "]";
	}

	

}
