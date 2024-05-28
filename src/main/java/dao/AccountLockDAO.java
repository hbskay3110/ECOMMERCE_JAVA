package dao;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.mail.*;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import model.AccountLock;
import model.ConnectToDatabase;
import model.OrderProduct;
import util.EncryptionPass;
import model.Account;

public class AccountLockDAO implements ObjectDAO {
    public static Map<String, AccountLock> mapAccountLock = loadData();


    public AccountLockDAO() {
        // TODO Auto-generated constructor stub
    }

    private static Map<String, AccountLock> loadData() {
        Map<String, AccountLock> mapTemp = new HashMap<String, AccountLock>();
        try {
            String query = "select * from AccountsLock";
            Connection connect = new ConnectToDatabase().getConnection();
            Statement stmt =  connect.createStatement();
            ResultSet rs=	stmt.executeQuery(query);
            while (rs.next()) {
                String nameAcc = rs.getString(1);
                int numLoginFalse = rs.getInt(2);
                Date dateLock = rs.getDate(3);
                Date dateUnLock = rs.getDate(4);

                AccountLock user = new AccountLock(nameAcc,numLoginFalse,dateLock,dateUnLock);
                mapTemp.put(user.getNameAcc(), user);

            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return mapTemp;

    }


    public static void main(String[] args) {
    }


    @Override
    public boolean add(Object obj) {
        AccountLock tkLock = (AccountLock) obj;
        mapAccountLock.put(tkLock.getNameAcc(), tkLock);

        String sql = "insert into AccountsLock values(?,?,?,?)";
        try {
            Connection connect = new ConnectToDatabase().getConnection();
            PreparedStatement ppstm = connect.prepareStatement(sql);
            ppstm.setString(1, tkLock.getNameAcc());
            ppstm.setInt(2, tkLock.getNumLoginFalse());
            ppstm.setDate(3, tkLock.getDateLock());
            ppstm.setDate(4, tkLock.getDateUnlock());
            ppstm.executeUpdate();
            return true;

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return false;
    }

    @Override
    public boolean edit(String id, Object obj) {
        AccountLock tkLock = (AccountLock) obj;
        mapAccountLock.replace(id, tkLock);
        try {
            String sql = "update AccountsLock set numLoginFalse=?,dateLock=?,dateUnLock=? where nameAcc=?";
            Connection connect = new ConnectToDatabase().getConnection();
            PreparedStatement ppstm = connect.prepareStatement(sql);
            ppstm.setInt(1, tkLock.getNumLoginFalse());
            ppstm.setDate(2, tkLock.getDateLock());
            ppstm.setDate(3, tkLock.getDateUnlock());
            ppstm.setString(4, tkLock.getNameAcc());
            ppstm.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return false;

    }


    @Override
    public boolean delete(String nameAcc) {
        return false;
    }

}
