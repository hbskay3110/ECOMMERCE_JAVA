package dao;

import model.ConnectToDatabase;
import model.View;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ViewDAO implements ObjectDAO{

    public ViewDAO(){

    }

    public List<View> loadView(){
        List<View> views = new ArrayList<>();
        try{
            String query = "select * from Views ORDER BY view_count DESC LIMIT 10";
            Connection connect = new ConnectToDatabase().getConnection();
            Statement stmt =  connect.createStatement();
            ResultSet rs= stmt.executeQuery(query);
            while(rs.next()){
                String idP = rs.getString(1);
                int view_count = rs.getInt(2);
                View view = new View(idP, view_count);
                views.add(view);
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return views;
    }

    public int getViewCount(String productId) throws Exception {
        String query = "SELECT view_count FROM Views WHERE idP = ?";
        Connection connect = new ConnectToDatabase().getConnection();
        PreparedStatement stmt = connect.prepareStatement(query);
        stmt.setString(1, productId);
        ResultSet rs = stmt.executeQuery();
        if (!rs.next()) {
            String sql = "insert into Views(idP, view_count) values (?, 1)";
            stmt = connect.prepareStatement(sql);
            stmt.setString(1, productId);
            stmt.executeUpdate();
            return 0;
        } else {
            int viewCount = rs.getInt("view_count") + 1;
            String sql1 = "update Views set view_count = ? where idP = ?";
            stmt = connect.prepareStatement(sql1);
            stmt.setInt(1, viewCount);
            stmt.setString(2, productId);
            stmt.executeUpdate();
            return viewCount;
        }
    }
}
