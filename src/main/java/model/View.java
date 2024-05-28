package model;

public class View {
    private String idP;
    private int view_count;

    public View() {
    }

    public View(String idP, int view_count) {
        this.idP = idP;
        this.view_count = view_count;
    }

    public String getIdP() {
        return idP;
    }

    public void setIdP(String idP) {
        this.idP = idP;
    }

    public int getView_count() {
        return view_count;
    }

    public void setView_count(int view_count) {
        this.view_count = view_count;
    }

    @Override
    public String toString() {
        return "View{" +
                "idP='" + idP + '\'' +
                ", view_count=" + view_count +
                '}';
    }
}
