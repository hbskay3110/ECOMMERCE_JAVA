package model;

public class Ward {
     String wardCode;
      int districtID;
     String wardName;


    public void setWardCode(String wardCode) {
        this.wardCode = wardCode;
    }

    public void setDistrictID(int districtID) {
        this.districtID = districtID;
    }

    public void setWardName(String wardName) {
        wardName = wardName;
    }

    public String getWardCode() {
        return wardCode;
    }

    public int getDistrictID() {
        return districtID;
    }

    public String getWardName() {
        return wardName;
    }

    public Ward(String wardCode, int districtID, String wardName) {
        this.wardCode = wardCode;
        this.districtID = districtID;
        this.wardName = wardName;
    }
    @Override
    public String toString() {
        return "Ward{" +
                "wardCode='" + wardCode + '\'' +
                ", districtID=" + districtID +
                ", WardName='" + wardName + '\'' +
                '}';
    }

}
