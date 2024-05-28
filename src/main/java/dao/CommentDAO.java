package dao;

import model.Comment;
import model.ConnectToDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CommentDAO implements ObjectDAO{
	public static List<Comment> mapComment = loadData();


	private static List<Comment> loadData() {
		List<Comment> mapTemp = new ArrayList<>();
		try {
			String query = "select * from Comments";
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt =  connect.createStatement();
			ResultSet rs= stmt.executeQuery(query);
			while (rs.next()) {
				String idComment = rs.getString(1);
				String idP = rs.getString(2);
				String nameAcc = rs.getString(3);
				String content = rs.getString(4);
				String date = rs.getString(5);
				int status = rs.getInt(6);
				Comment comment = new Comment(idComment, idP, nameAcc, content,null,date, status);
				mapTemp.add(comment);


			}
			addVideoAndImg(mapTemp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mapTemp;

	}
	public static void addVideoAndImg(List<Comment> mapTemp){
		try {
			String query1 = "select * from ImageComments";
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt =  connect.createStatement();
			ResultSet rs1 = stmt.executeQuery(query1);
			while (rs1.next()) {
				String idComment1 = rs1.getString(1);
				System.out.println("i "+idComment1);
				String nameI = rs1.getString(2);
				for (int i = 0 ; i<mapTemp.size();i++) {
					if(mapTemp.get(i).getIdComment().equals(idComment1)){
						System.out.println("ok");
						List<String> imgandVieo = mapTemp.get(i).getImgAndVideo();
						if(imgandVieo==null){
							imgandVieo = new ArrayList<>();
						}
						imgandVieo.add(nameI);
						mapTemp.get(i).setImgAndVideo(imgandVieo);
						System.out.println(mapTemp.get(i));
					}
				}
			}
		}catch (Exception e){
			e.printStackTrace();
		}

	}

	@Override
	public boolean add(Object obj) {
		Comment com = (Comment) obj;
		mapComment.add( com);
		String sql = "insert into Comments(idP, nameAcc, content, status) values(?,?,?,?)";

		try {
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);

			ppstm.setString(1, com.getIdP());
			ppstm.setString(2, com.getNameAcc());
			ppstm.setString(3, com.getContent());
			ppstm.setInt(4, com.getStatus());
			ppstm.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}
	// hàm insert hình ảnh vào cơ sở dữ liệu
	public boolean addImage(String nameI) {
		int idComment = mapComment.size() +1 ;
		String sql = "insert into ImageComments values(?,?)";

		try {
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);

			ppstm.setInt(1, idComment );
			ppstm.setString(2, nameI);

			ppstm.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}
	 // hàm insert Video vào cơ sở dữ liệu
	public boolean addVideo(String video) {
		int idComment = mapComment.size() +1 ;
		String sql = "insert into VideoComments values(?,?)";

		try {
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);

			ppstm.setInt(1, idComment );
			ppstm.setString(2, video);

			ppstm.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}
// hàm xem thêm comment
	public List<Comment> showMoreComment(int offset, int limit, String idP){
		List<Comment> list = new ArrayList<Comment>();
		try{
			String sql = "select c.*, a.userName from Comments c join Accounts a on c.nameAcc=a.nameAcc where idP='" + idP + "'ORDER BY createAt DESC LIMIT "+offset+","+limit;
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt = connect.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String idComment = rs.getString(1);
				String nameAcc = rs.getString(3);
				String content = rs.getString(4);
				String date = rs.getString(5);
				int status = rs.getInt(6);
				String username= rs.getString(7);
				Comment comment = new Comment(idComment, idP,username, content,null, date, status);
				list.add(comment);

			}
			addVideoAndImg(list);
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
	public List<Comment> showData(String idP) {
		List<Comment> list = new ArrayList<Comment>();

		try {
			String sql = "select c.*, a.userName from Comments c join Accounts a on c.nameAcc=a.nameAcc where idP='" + idP + "'";
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt = connect.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String idComment = rs.getString(1);
				String nameAcc = rs.getString(3);
				String content = rs.getString(4);
				String date = rs.getString(5);
				int status = rs.getInt(6);
				String username= rs.getString(7);
				Comment comment = new Comment(idComment, idP,username, content,null ,date, status);
				list.add(comment);

			}
			addVideoAndImg(list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args) {
		CommentDAO cmt = new CommentDAO();
		System.out.println(cmt.showData("VN016"));
	}

}
