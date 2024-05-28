package model;

public class District {
    int provinceId;
    int districtId;
    String districtName;

    public District(int provinceId, int districtId, String districtName) {
        this.provinceId = provinceId;
        this.districtId = districtId;
        this.districtName = districtName;
    }

    public int getProvinceId() {
        return provinceId;
    }

    public int getDistrictId() {
        return districtId;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setProvinceId(int provinceId) {
        this.provinceId = provinceId;
    }

    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }

    public void setDistrictName(String districtName) {
        districtName = districtName;
    }

    @Override
    public String toString() {
        return "District{" +
                "provinceId=" + provinceId +
                ", districtId=" + districtId +
                ", DistrictName='" + districtName + '\'' +
                '}';
    }
}
