package model;

import java.sql.Date;

public class AccountLock {
    private String nameAcc;
    private int numLoginFalse;
    private Date dateLock;
    private Date dateUnlock;

    public AccountLock(String nameAcc, int numLoginFalse, Date dateLock, Date dateUnlock) {
        this.nameAcc = nameAcc;
        this.numLoginFalse = numLoginFalse;
        this.dateLock = dateLock;
        this.dateUnlock = dateUnlock;
    }

    @Override
    public String toString() {
        return "AccountLock{" +
                "nameAcc='" + nameAcc + '\'' +
                ", numLoginFalse=" + numLoginFalse +
                ", dateLock=" + dateLock +
                ", dateUnlock=" + dateUnlock +
                '}';
    }

    public void setNameAcc(String nameAcc) {
        this.nameAcc = nameAcc;
    }

    public void setNumLoginFalse(int numLoginFalse) {
        this.numLoginFalse = numLoginFalse;
    }

    public void setDateLock(Date dateLock) {
        this.dateLock = dateLock;
    }

    public void setDateUnlock(Date dateUnlock) {
        this.dateUnlock = dateUnlock;
    }

    public String getNameAcc() {
        return nameAcc;
    }

    public int getNumLoginFalse() {
        return numLoginFalse;
    }

    public Date getDateLock() {
        return dateLock;
    }

    public Date getDateUnlock() {
        return dateUnlock;
    }
}
