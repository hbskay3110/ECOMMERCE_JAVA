package model;

public class Transport {
    String id ;
    String fee;
    String leadTime;
    String created_at;

    @Override
    public String toString() {
        return "Transport{" +
                "id='" + id + '\'' +
                ", fee='" + fee + '\'' +
                ", leadTime='" + leadTime + '\'' +
                ", created_at='" + created_at + '\'' +
                '}';
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setFee(String fee) {
        this.fee = fee;
    }

    public void setLeadTime(String leadTime) {
        this.leadTime = leadTime;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getId() {
        return id;
    }

    public String getFee() {
        return fee;
    }

    public String getLeadTime() {
        return leadTime;
    }

    public String getCreated_at() {
        return created_at;
    }

    public Transport(String id, String fee, String leadTime, String created_at) {
        this.id = id;
        this.fee = fee;
        this.leadTime = leadTime;
        this.created_at = created_at;
    }
}
