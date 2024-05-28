package model;

public class DetailOrder {
	private String idOrder;
	private String idP;
	private int amount;
	private double price;
	
	public DetailOrder(String idOrder, String idP, int amount, double price) {
		super();
		this.idOrder = idOrder;
		this.idP = idP;
		this.amount = amount;
		this.price = price;
	}

	public String getIdOrder() {
		return idOrder;
	}

	public void setIdOrder(String idOrder) {
		this.idOrder = idOrder;
	}

	public String getIdP() {
		return idP;
	}

	public void setIdP(String idP) {
		this.idP = idP;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "DetailOrder [idOrder=" + idOrder + ", idP=" + idP + ", amount=" + amount + ", price=" + price + "]";
	}


}

	

	
