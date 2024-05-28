package dao;

import model.ConnectToDatabase;
import model.Favourite;
import model.Image;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FavouriteProductDAO implements ObjectDAO {
    public static List<Favourite> listFavourite = loadData();

    public static List<Favourite> loadData() {
        List<Favourite> list = new ArrayList<Favourite>();
        try {
            String query = "SELECT * FROM Favourites;";
            Connection conn = new ConnectToDatabase().getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                String idP = rs.getString("idP");
                String nameAcc = rs.getString("nameAcc");
                Favourite fav = new Favourite(idP, nameAcc);
                list.add(fav);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean add(Object obj) {
        Favourite favourite = (Favourite) obj;
        listFavourite.add(favourite);
        String sql = "INSERT INTO Favourites (idP, nameAcc) VALUES (?,?)";
        try {
            Connection connect = new ConnectToDatabase().getConnection();
            PreparedStatement ppstm = connect.prepareStatement(sql);
            ppstm.setString(1, favourite.getIdP());
            ppstm.setString(2, favourite.getNameAcc());
            ppstm.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(listFavourite);
    }
    public boolean delete(String idP, String nameAcc) {
        for (int i = 0; i < listFavourite.size(); i++) {
            if (listFavourite.get(i).getIdP().equals(idP) && listFavourite.get(i).getNameAcc().equals(nameAcc)) {
                listFavourite.remove(i);
            }
        }
        try {
            String sql = "DELETE FROM Favourites WHERE idP = ? AND nameAcc = ?";
            Connection conn = new ConnectToDatabase().getConnection();
            PreparedStatement ppstm = conn.prepareStatement(sql);
            ppstm.setString(1, idP);
            ppstm.setString(2, nameAcc);
            ppstm.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isFavourite(Favourite favourite) {
        for (Favourite fav : listFavourite) {
            if (fav.getIdP().equals(favourite.getIdP()) && fav.getNameAcc().equals(favourite.getNameAcc())) {
                return true;
            }
        }
        return false;
    }

    public List<Favourite> getFavoriteProducts(String nameAcc){
        List<Favourite> favoriteProducts = new ArrayList<>();
        try{
            String query = "SELECT p.idP, p.nameP, p.priceP, f.nameAcc FROM Products p JOIN Favourites f ON p.idP = f.idP WHERE f.nameAcc = ?";
            Connection connection = new ConnectToDatabase().getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, nameAcc);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                String idP = resultSet.getString("idP");
                String nameAccount = resultSet.getString("nameAcc");
                String nameP = resultSet.getString("nameP");
                double priceP = resultSet.getDouble("priceP");
                Favourite fav = new Favourite(idP, nameAccount, nameP, priceP, null);
                favoriteProducts.add(fav);
            }

            String query1 = "select * from Images";
            ResultSet rs1=	statement.executeQuery(query1);
            while (rs1.next()) {
                List<Image> listImg = new ArrayList<>();
                String nameI = rs1.getString(2);
                String idP = rs1.getString(3);
                int status = rs1.getInt(4);
                Image img = new Image(nameI,idP, status);
                System.out.println("img:" + img);
                listImg.add(img);

                Favourite f = null;
                for (Favourite fav : favoriteProducts) {
                    if (fav.getIdP().equals(idP)) {
                        f = fav;
                        break;
                    }
                }

                if (f != null) {
                    f.setListImg(listImg);
                }

            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return favoriteProducts;
    }
}
