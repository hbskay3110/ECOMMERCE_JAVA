package model;

import java.util.List;

public class Favourite {

    private String idP;
    private String nameAcc;

    private String nameP;
    private double priceP;
    private List<Image> listImg;
    public Favourite(){

    }
    public Favourite(String idP, String nameAcc) {
        this.idP = idP;
        this.nameAcc = nameAcc;
    }

    public Favourite(String idP, String nameAcc, String nameP, double priceP, List<Image> listImg) {
        this.idP = idP;
        this.nameAcc = nameAcc;
        this.nameP = nameP;
        this.priceP = priceP;
        this.listImg = listImg;
    }

    public String getIdP() {
        return idP;
    }

    public void setIdP(String idP) {
        this.idP = idP;
    }

    public String getNameAcc() {
        return nameAcc;
    }

    public void setNameAcc(String nameAcc) {
        this.nameAcc = nameAcc;
    }

    public String getNameP() {
        return nameP;
    }

    public void setNameP(String nameP) {
        this.nameP = nameP;
    }

    public double getPriceP() {
        return priceP;
    }

    public void setPriceP(double priceP) {
        this.priceP = priceP;
    }

    public List<Image> getListImg() {
        return listImg;
    }

    public void setListImg(List<Image> listImg) {
        this.listImg = listImg;
    }

    @Override
    public String toString() {
        return "Favourite{" +
                "idP='" + idP + '\'' +
                ", nameAcc='" + nameAcc + '\'' +
                ", nameP='" + nameP + '\'' +
                ", priceP=" + priceP +
                ", listImg=" + listImg +
                '}';
    }
}
