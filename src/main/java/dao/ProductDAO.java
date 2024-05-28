package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.ConnectToDatabase;
import model.DetailOrder;
import model.Image;
import model.Product;

public class ProductDAO implements ObjectDAO {
	public static Map<String,Product> mapProduct = loadData();

	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	private static Map<String, Product> loadData(){
		Map<String, Product> mapTemp = new HashMap<String, Product>();
		try {
			String query = "select p.*,percent from Products p join Sale s on p.idP = s.idP";
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt =  connect.createStatement();
			ResultSet rs=	stmt.executeQuery(query);
			while (rs.next()) {
				String idP = rs.getString(1);
				String nameP  = rs.getString(2);
				double priceP  = rs.getDouble(3);
				String vendorId  = rs.getString(4);
				int statusP = rs.getInt(5);
				int sale = rs.getInt(6);
				double priceSale = Math.round(priceP - (priceP*sale)/100);
				Product product = new Product(idP, nameP, priceP,priceSale, null, sale, vendorId, statusP);
				mapTemp.put(product.getIdP(), product);

			}
			String query1 = "select * from Images";
			ResultSet rs1=	stmt.executeQuery(query1);
			while (rs1.next()) {
				List<Image> listImg = new ArrayList<>();
				String nameI = rs1.getString(2);
				String idP = rs1.getString(3);
				int status = rs1.getInt(4);
				Image img = new Image(nameI,idP, status);
				System.out.println("img:" + img);
				listImg.add(img);

				Product p = mapTemp.get(idP);

				p.setListImage(listImg);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mapTemp;

	}
	public int countSP(String txtSearch) {
		try {
			String query = "select count(*) from Products where nameP like ?";
			//mở kết nối tới db
			Connection connect = new ConnectToDatabase().getConnection();
			// truyền câu lệnh query vào sql
			PreparedStatement ppstm = connect.prepareStatement(query);
			ppstm.setString(1, "%"+txtSearch+"%");
			//execute và nhận kết quả trả về
			ResultSet rs = null;
			rs =ppstm.executeQuery();
			while(rs.next()) {
				//trả về dữ liệu của chỉ mục cột được chỉ định
				return rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	public List<Product> search(String txtSearch,int index, int size){
		try {
			String query = "with x as (select *, ROW_NUMBER() over (order by nameP desc ) as r from Products where nameP like ?)\r\n"
					+ "select * from x where r between ?*?-(?-1) and ?*?";
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(query);
			ppstm.setString(1, "%"+txtSearch+"%");
			ppstm.setInt(2, index);
			ppstm.setInt(3, size);
			ppstm.setInt(4, size);
			ppstm.setInt(5, index);
			ppstm.setInt(6, size);
			ResultSet rs = null;
			rs =ppstm.executeQuery();
			List<Product> list = new ArrayList<Product>();
			while(rs.next()) {
				String ipP = rs.getString(1);
				Product p = mapProduct.get(ipP);
				list.add(p);
			}
			return list;



		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public List<Product> searchByAttribute(int index, int size, String proviso,String attribute,String txtSearch,String loaiSP){
		try {
			String query;
			Connection connect = new ConnectToDatabase().getConnection();
			ResultSet rs = null;
			PreparedStatement ppstm;
			if((txtSearch==null|| txtSearch.equals("")) && (loaiSP==null || loaiSP.equals(""))) {
				query = "with x as (select *, ROW_NUMBER() over (order by "+attribute+" "+proviso+ ") as r from Products)\r\n"
						+ "select * from x where r between ?*?-(?-1) and ?*?";
				ppstm = connect.prepareStatement(query);
				ppstm.setInt(1, index);
				ppstm.setInt(2, size);
				ppstm.setInt(3, size);
				ppstm.setInt(4, index);
				ppstm.setInt(5, size);
				rs =ppstm.executeQuery();
			}else if((loaiSP==null || loaiSP.equals("")) && (txtSearch!=null)) {
				query = "with x as (select *, ROW_NUMBER() over (order by "+attribute+" "+proviso+ ") as r from Products where nameP like ?)\r\n"
						+ "select * from x where r between ?*?-(?-1) and ?*?";
				ppstm = connect.prepareStatement(query);
				ppstm.setString(1, "%"+txtSearch+"%");
				ppstm.setInt(2, index);
				ppstm.setInt(3, size);
				ppstm.setInt(4, size);
				ppstm.setInt(5, index);
				ppstm.setInt(6, size);
				rs =ppstm.executeQuery();
			}else if(loaiSP!=null && (txtSearch==null|| txtSearch.equals(""))){
				if(attribute.equals("priceP")){
					query = "with x as (select sp.*, ROW_NUMBER() over (order by priceP "+proviso+ ") as r from Products sp join DetailProducts ct on sp.idP = ct.idP where typeP in(?))\r\n"
							+ "select * from x where r between ?*?-(?-1) and ?*?";
				}else {
					query = "with x as (select sp.*, ROW_NUMBER() over (order by typeP "+proviso+ ") as r from Products sp join DetailProducts ct on sp.idP = ct.idP where typeP in(?))\r\n"
							+ "select * from x where r between ?*?-(?-1) and ?*?";
				}
				ppstm = connect.prepareStatement(query);
				ppstm.setString(1, loaiSP);
				ppstm.setInt(2, index);
				ppstm.setInt(3, size);
				ppstm.setInt(4, size);
				ppstm.setInt(5, index);
				ppstm.setInt(6, size);
				rs =ppstm.executeQuery();
			}else {
				query = "with x as (select sp.*, ROW_NUMBER() over (order by "+attribute+" "+proviso+ ") as r from Products sp join DetailProducts ct on sp.idP = ct.idP where typeP in(?) and nameP like ?)\r\n"
						+ "select * from x where r between ?*?-(?-1) and ?*?";
				ppstm = connect.prepareStatement(query);
				ppstm.setString(1, loaiSP);
				ppstm.setString(2, txtSearch);
				ppstm.setInt(3, index);
				ppstm.setInt(4, size);
				ppstm.setInt(5, size);
				ppstm.setInt(6, index);
				ppstm.setInt(7, size);
				rs =ppstm.executeQuery();
			}
			List<Product> list = new ArrayList<Product>();
			while(rs.next()) {
				Product p = mapProduct.get(rs.getString(1));
				list.add(p);
			}
			return list;



		} catch (Exception e) {
			e.getMessage();
		}
		return null;
	}
	public List<Product> render(int index, int size){
		try {
			String query = "with x as (select *, ROW_NUMBER() over (order by nameP desc ) as r from Products)\r\n"
					+ "select * from x where r between ?*?-(?-1) and ?*?";
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(query);
			ppstm.setInt(1, index);
			ppstm.setInt(2, size);
			ppstm.setInt(3, size);
			ppstm.setInt(4, index);
			ppstm.setInt(5, size);
			ResultSet rs = null;
			rs =ppstm.executeQuery();
			List<Product> list = new ArrayList<Product>();
			while(rs.next()) {
				Product p = mapProduct.get(rs.getString(1));
				list.add(p);
			}
			return list;



		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	@Override
	public boolean add(Object obj) {
		Product sp = (Product) obj;
		mapProduct.put(sp.getIdP(), sp);
		String sql = "insert into Products values(?,?,?,?,?)";

		try {
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1,sp.getIdP());
			ppstm.setString(2,sp.getNameP());
			ppstm.setDouble(3,sp.getPriceP());
			ppstm.setString(4,sp.getVendorId());
			ppstm.setInt(5,sp.getSale());
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
		Product sp = (Product) obj;
		mapProduct.replace(id, sp);
		try {
			String sql = "update Products set nameP=?,priceP=?,vendorId=?,status=?  where idP=?";
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1,sp.getNameP());
			ppstm.setDouble(2,sp.getPriceP());
			ppstm.setString(3,sp.getVendorId());
			ppstm.setInt(4,sp.getStatus());
			ppstm.setString(5,id);
			ppstm.executeUpdate();
			return true;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;

	}
	@Override
	public boolean delete(String id) {
		mapProduct.remove(id);
		try {
			String sql = "delete from Products where idP='"+id+"'";
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt =  connect.createStatement();
			stmt.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	public List<Product> getSanPhamByDH(List<DetailOrder> list){
		List<Product> rs = new ArrayList<Product>();
		for (DetailOrder sanPham : list) {
			Product sp = mapProduct.get(sanPham.getIdP());
			rs.add(sp);
		}
		return rs;
	}
	public static void main(String[] args) {
		ProductDAO sp = new ProductDAO();

//		int count = sp.countSP("Á");
//		System.out.println(count);
//		searchByAttribute(int index, int size, String proviso,String attribute,String txtSearch,String loaiSP){
//		List<Product> list = sp.searchByAttribute(1, 3, "ASC", "nameP", null,"Áo thun");
//		System.out.println(list);
//		System.out.println(sp.search("áo", 2, 15));
		loadData();
		for (Product p: loadData().values()) {
			System.out.println(p);
		}
//		System.out.println(sp.render(1, 15));
	}

}
