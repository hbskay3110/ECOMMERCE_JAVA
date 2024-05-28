package model;

public class DiscountCode {
    private String id;
    private String name;
    private double valueDiscount;
    private String startDate;
    private String endDate;
    private int amount;
    private double conditionDiscount;
    private int status;

    public DiscountCode() {
    }

    public DiscountCode(String id, String name, double valueDiscount, String startDate, String endDate, int amount, double conditionDiscount, int status) {
        this.id = id;
        this.name = name;
        this.valueDiscount = valueDiscount;
        this.startDate = startDate;
        this.endDate = endDate;
        this.amount = amount;
        this.conditionDiscount = conditionDiscount;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getValueDiscount() {
        return valueDiscount;
    }

    public void setValueDiscount(double valueDiscount) {
        this.valueDiscount = valueDiscount;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getConditionDiscount() {
        return conditionDiscount;
    }

    public void setConditionDiscount(double conditionDiscount) {
        this.conditionDiscount = conditionDiscount;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "DiscountCode{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", valueDiscount=" + valueDiscount +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", amount=" + amount +
                ", conditionDiscount=" + conditionDiscount +
                ", status=" + status +
                '}';
    }
}
