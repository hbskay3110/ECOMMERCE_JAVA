package dao;

import model.ConnectToDatabase;
import model.Image;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class ImageDAO implements ObjectDAO{
    public ImageDAO(){

    }
    public List<Image> getImgByIdProduct(String idProduct){
        List<Image> images = new ArrayList<Image>();
        try{
            String sql = "Select * from Images where idP=?";
            Connection connect = new ConnectToDatabase().getConnection();
            PreparedStatement stmt =  connect.prepareStatement(sql);
            stmt.setString(1, idProduct);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Image img = new Image();
                img.setNameI(rs.getString(2));
                img.setIdP(rs.getString(3));
                img.setStatus(rs.getInt(4));
                images.add(img);
            }
        } catch (Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return images;
    }

    public static void main(String[] args) {
        ImageDAO img = new ImageDAO();
        System.out.println(img.getImgByIdProduct("AT001"));
    }
}
