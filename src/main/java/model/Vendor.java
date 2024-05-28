package model;

public class Vendor {
	private String vendorId;
	private String vendorName;
	private String addressV;
	private String phoneV;
	public Vendor(String vendorId, String vendorName, String addressV, String phoneV) {
		super();
		this.vendorId = vendorId;
		this.vendorName = vendorName;
		this.addressV = addressV;
		this.phoneV = phoneV;
	}
	public String getVendorId() {
		return vendorId;
	}
	public void setVendorId(String vendorId) {
		this.vendorId = vendorId;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getAddressV() {
		return addressV;
	}
	public void setAddressV(String addressV) {
		this.addressV = addressV;
	}
	public String getPhoneV() {
		return phoneV;
	}
	public void setPhoneV(String phoneV) {
		this.phoneV = phoneV;
	}
	@Override
	public String toString() {
		return "NhaCungCap [vendorId=" + vendorId + ", vendorName=" + vendorName + ", addressV=" + addressV
				+ ", phoneV=" + phoneV + "]";
	}
	

}
