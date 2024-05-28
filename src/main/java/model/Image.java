package model;

public class Image {
	private String nameI;
	private String idP;
	private int status;
	public Image( String nameI, String idP, int status) {
		super();
		this.nameI = nameI;
		this.idP = idP;
		this.status = status;
	}

public Image(){

}
	@Override
	public String toString() {
		return "Image [nameI=" + nameI + ", idP=" + idP + ", status=" + status + "]";
	}
	public String getNameI() {
		return nameI;
	}
	public void setNameI(String nameI) {
		this.nameI = nameI;
	}
	public String getIdP() {
		return idP;
	}
	public void setIdP(String idP) {
		this.idP = idP;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

}
