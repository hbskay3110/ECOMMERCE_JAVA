package model;

import com.google.api.client.util.DateTime;

public class Otp {
    private int id;
    private String nameAcc ;
    private int email ;
    private int idOTP ;
    private DateTime startDate ;
    private int status ;

    public Otp(int id, String nameAcc, int email, int idOTP, DateTime startDate, int status) {
        this.id = id;
        this.nameAcc = nameAcc;
        this.email = email;
        this.idOTP = idOTP;
        this.startDate = startDate;
        this.status = status;
    }
    public Otp(String nameAcc, int email, int idOTP, DateTime startDate, int status) {
        this.nameAcc = nameAcc;
        this.email = email;
        this.idOTP = idOTP;
        this.startDate = startDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameAcc() {
        return nameAcc;
    }

    public void setNameAcc(String nameAcc) {
        this.nameAcc = nameAcc;
    }

    public int getEmail() {
        return email;
    }

    public void setEmail(int email) {
        this.email = email;
    }

    public int getIdOTP() {
        return idOTP;
    }

    public void setIdOTP(int idOTP) {
        this.idOTP = idOTP;
    }

    public DateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(DateTime startDate) {
        this.startDate = startDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Otp{" +
                "id=" + id +
                ", nameAcc='" + nameAcc + '\'' +
                ", email=" + email +
                ", idOTP=" + idOTP +
                ", startDate=" + startDate +
                ", status=" + status +
                '}';
    }
}
