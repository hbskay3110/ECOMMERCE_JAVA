package model;
public class OrderProduct {
	private String idOrder;
	private String nameAcc;
	private String dateOrder;
	private String dateDelivery;
	private String totalMoney;
	private String phone;
	private String nameRecipient;
	private String address;
	private String note;
	private String checkout;
	private String status;

	public OrderProduct(String idOrder, String nameAcc, String dateOrder, String dateDelivery, String totalMoney, String phone,
						String nameRecipient, String address, String note, String checkout, String status) {
		super();
		this.idOrder = idOrder;
		this.nameAcc = nameAcc;
		this.dateOrder = dateOrder;
		this.dateDelivery = dateDelivery;
		this.totalMoney = totalMoney;
		this.phone = phone;
		this.nameRecipient = nameRecipient;
		this.address = address;
		this.note = note;
		this.checkout = checkout;
		this.status = status;
	}

	public String getIdOrder() {
		return idOrder;
	}

	public void setIdOrder(String idOrder) {
		this.idOrder = idOrder;
	}

	public String getNameAcc() {
		return nameAcc;
	}

	public void setNameAcc(String nameAcc) {
		this.nameAcc = nameAcc;
	}

	public String getDateOrder() {
		return dateOrder;
	}

	public void setDateOrder(String dateOrder) {
		this.dateOrder = dateOrder;
	}

	public String getDateDelivery() {
		return dateDelivery;
	}

	public void setDateDelivery(String dateDelivery) {
		this.dateDelivery = dateDelivery;
	}

	public String getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(String totalMoney) {
		this.totalMoney = totalMoney;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNameRecipient() {
		return nameRecipient;
	}

	public void setNameRecipient(String nameRecipient) {
		this.nameRecipient = nameRecipient;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "OrderProduct{" +
				"idOrder='" + idOrder + '\'' +
				", nameAcc='" + nameAcc + '\'' +
				", dateOrder='" + dateOrder + '\'' +
				", dateDelivery='" + dateDelivery + '\'' +
				", totalMoney='" + totalMoney + '\'' +
				", phone='" + phone + '\'' +
				", nameRecipient='" + nameRecipient + '\'' +
				", address='" + address + '\'' +
				", note='" + note + '\'' +
				", checkout='" + checkout + '\'' +
				", status='" + status + '\'' +
				'}';
	}
}
