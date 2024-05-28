package dao;

import model.ConnectToDatabase;
import model.DiscountCode;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DiscountCodeDAO implements ObjectDAO{
    public static Map<String, DiscountCode> mapDiscount = loadData();

    public DiscountCodeDAO(){

    }

    public static Map<String, DiscountCode> loadData() {
        Map<String, DiscountCode> mapTemp = new HashMap<String, DiscountCode>();
        try {
            String query = "select * from DiscountCodes";
            Connection connect = new ConnectToDatabase().getConnection();
            Statement stmt = connect.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                String id = rs.getString(1);
                String name  = rs.getString(2);
                double valueDiscount  = rs.getDouble(3);
                String startDate = rs.getString(4);
                String endDate = rs.getString(5);
                int amount = rs.getInt(6);
                double conditionDiscount = rs.getDouble(7);
                int status = rs.getInt(8);
                DiscountCode dc = new DiscountCode(id, name, valueDiscount, startDate, endDate, amount, conditionDiscount, status);
                mapTemp.put(dc.getId(), dc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapTemp;
    }

    // thêm một mã giảm giá
    public boolean add(Object obj){
        DiscountCode dc = (DiscountCode) obj;
        mapDiscount.put(dc.getId(), dc);
        String sql = "insert into DiscountCodes values(?,?,?,?,?,?,?,?)";
        try {
            Connection connect = new ConnectToDatabase().getConnection();
            PreparedStatement ppstm = connect.prepareStatement(sql);
            ppstm.setString(1, dc.getId());
            ppstm.setString(2, dc.getName());
            ppstm.setDouble(3, dc.getValueDiscount());
            ppstm.setString(4, dc.getStartDate());
            ppstm.setString(5, dc.getEndDate());
            ppstm.setInt(6, dc.getAmount());
            ppstm.setDouble(7, dc.getConditionDiscount());
            ppstm.setInt(8, dc.getStatus());
            ppstm.executeUpdate();
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }

    // sửa một mã giảm giá
    public boolean edit(String id, Object obj){
        DiscountCode dc = (DiscountCode) obj;
        mapDiscount.put(dc.getId(), dc);
        String sql = "update DiscountCodes set name=?, valueDiscount=?, startDate=?, endDate=?, amount=?, conditionDiscount=?, status=? where id=?";
        try {
            Connection connect = new ConnectToDatabase().getConnection();
            PreparedStatement ppstm = connect.prepareStatement(sql);
            ppstm.setString(1, dc.getName());
            ppstm.setDouble(2, dc.getValueDiscount());
            ppstm.setString(3, dc.getStartDate());
            ppstm.setString(4, dc.getEndDate());
            ppstm.setInt(5, dc.getAmount());
            ppstm.setDouble(6, dc.getConditionDiscount());
            ppstm.setInt(7, dc.getStatus());
            ppstm.setString(8, dc.getId());
            ppstm.executeUpdate();
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }

    // tìm kiếm một mã giảm giá theo tên
    public List<DiscountCode> search(String txtSearch){
        try {
            String query = "select * from DiscountCodes  where name=?";
            Connection connect = new ConnectToDatabase().getConnection();
            PreparedStatement ppstm = connect.prepareStatement(query);
            ppstm.setString(1, "%"+txtSearch+"%");
            ResultSet rs;
            rs = ppstm.executeQuery();
            List<DiscountCode> list = new ArrayList<DiscountCode>();
            while(rs.next()) {
                String ipP = rs.getString(1);
                DiscountCode d = mapDiscount.get(ipP);
                list.add(d);
            }
            return list;

        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }

    public static void main(String[] args) {
        DiscountCodeDAO dcDAO = new DiscountCodeDAO();
        System.out.println(dcDAO.loadData());
    }
}

