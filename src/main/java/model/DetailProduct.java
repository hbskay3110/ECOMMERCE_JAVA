package model;

public class DetailProduct {
	private String idP;
	private String vendorId;
	private String desciption;
	private String typeP;
	private String sex;
	private String material;
	private String designs;
	private String origin;
	private String style;
	private String warrantyPeriod;
	public DetailProduct(String idP, String vendorId, String desciption, String typeP, String sex, String material,
			String designs, String origin, String style, String warrantyPeriod) {
		super();
		this.idP = idP;
		this.vendorId = vendorId;
		this.desciption = desciption;
		this.typeP = typeP;
		this.sex = sex;
		this.material = material;
		this.designs = designs;
		this.origin = origin;
		this.style = style;
		this.warrantyPeriod = warrantyPeriod;
	}
	public String getIdP() {
		return idP;
	}
	public void setIdP(String idP) {
		this.idP = idP;
	}
	public String getVendorId() {
		return vendorId;
	}
	public void setVendorId(String vendorId) {
		this.vendorId = vendorId;
	}
	public String getDesciption() {
		return desciption;
	}
	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}
	public String getTypeP() {
		return typeP;
	}
	public void setTypeP(String typeP) {
		this.typeP = typeP;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getDesigns() {
		return designs;
	}
	public void setDesigns(String designs) {
		this.designs = designs;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public String getWarrantyPeriod() {
		return warrantyPeriod;
	}
	public void setWarrantyPeriod(String warrantyPeriod) {
		this.warrantyPeriod = warrantyPeriod;
	}
	@Override
	public String toString() {
		return "ChiTiet_SanPham [idP=" + idP + ", vendorId=" + vendorId + ", desciption=" + desciption + ", typeP="
				+ typeP + ", sex=" + sex + ", material=" + material + ", designs=" + designs + ", origin=" + origin
				+ ", style=" + style + ", warrantyPeriod=" + warrantyPeriod + "]";
	}

	

	
	
	
	

}
