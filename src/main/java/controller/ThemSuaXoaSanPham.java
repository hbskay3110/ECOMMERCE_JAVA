package controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.*;
import model.*;


/**
 * Servlet implementation class ThemSuaXoaSanPham
 */
@MultipartConfig
@WebServlet("/startbootstrap-sb-admin-2-master/ThemSuaXoaSanPham")
public class ThemSuaXoaSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemSuaXoaSanPham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String chucNang = request.getParameter("chucNang");
		
		// set Tiếng Việt cho serverlet
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String src = request.getHeader("Referer");
		HttpSession session = request.getSession();
		Account tk = (Account) session.getAttribute("userLogin");

		if(chucNang.equals("Xoa")) {
			String maSP =  request.getParameter("maSP");
			Product p = new ProductDAO().mapProduct.get(maSP);
			new DetailProductDAO().delete(maSP);
			new ProductDAO().delete(maSP);
			Log log = new Log(Log.DANGER,tk.getNameAcc(),src,"Delete" + p.toString(),1);
			new LogDAO().add(log,request);
			getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/manage?loai=product").forward(request, response);
		}else if(chucNang.equals("Them")) {
			String maSP = request.getParameter("maSP");
			String tenSP = request.getParameter("productName");
			String gia = request.getParameter("maSP");
			String giaBanSP = request.getParameter("priceOld");
			String soLuongNhap = request.getParameter("numberImport");
			String hinhAnh = request.getParameter("imageProduct");
			String sale = request.getParameter("sale");
			String idNCC = request.getParameter("nameSupplier");
			String moTa = request.getParameter("description");
			String loaiSP = request.getParameter("type");
			String gioiTinh = request.getParameter("sex");
			String chatLieu = request.getParameter("material");
			String kieuDang = request.getParameter("design");
			String xuatXu = request.getParameter("origin");
			String phongCach = request.getParameter("style");
			
			// load ảnh
			Part part = request.getPart("imageProduct");
			String realPart = request.getServletContext().getRealPath("assets/img/product");
			String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();
			if(!Files.exists(Path.of(realPart))) {
				Files.createDirectory(Path.of(realPart));
				
			}
			System.out.println(fileName);
			String fullPatr = realPart + "/" + fileName;
			System.out.println(fullPatr);
			part.write(fullPatr);
			Map<String, String> erorr = new HashMap<String, String>();
			boolean ok = true;
			Product maSPDAO = new ProductDAO().mapProduct.get(maSP);
			if(maSPDAO != null) {
				erorr.put("duplicateMa", "Mã sảm phẩm đã tồn tại");
				ok = false;
			}
			if(maSP == null || maSP.equals("")) {
				erorr.put("NoID", "Vui lòng nhập trường này");
				ok = false;
			}
			if(tenSP == null || tenSP.equals("")) {
				erorr.put("NoName", "Vui lòng nhập trường này");
				ok = false;
			}


			if(soLuongNhap == null || soLuongNhap.equals("")) {
				erorr.put("NoNumberOf", "Vui lòng nhập trường này");
				ok = false;
			}
			if(!ok) {
				request.setAttribute("erorr", erorr);
				getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/addProduct.jsp").forward(request, response);	
			}else {
				List<Image> list = new ArrayList<>();				
				Image i1 = new Image(fileName,maSP,1);
				list.add(i1);
				double priceP = Double.parseDouble(giaBanSP);
				int numSale = Integer.parseInt(sale);
				Product sp = new Product(maSP, tenSP, priceP,list,numSale,idNCC, 1);
				String maNCC = "";
				for (Vendor ncc : NhaCungCapDAO.mapNhaCC.values()) {
					if(ncc.getVendorId().equals(idNCC)) {
						maNCC = ncc.getVendorId();
					}else {
						maNCC = "NCC0"+ NhaCungCapDAO.mapNhaCC.size();
					}
				}
				
				DetailProduct ct_sp = new DetailProduct(maSP, maNCC, moTa, loaiSP, gioiTinh, chatLieu, kieuDang, xuatXu, phongCach, "1");
				System.out.println(ct_sp);
				System.out.println(sp);
				new ProductDAO().add(sp);
				new DetailProductDAO().add(ct_sp);
				Log log = new Log(Log.WARNING,tk.getNameAcc(),src,"Add" + sp.toString() + ct_sp.toString(),1);
				new LogDAO().add(log,request);
				getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/manage?loai=product").forward(request, response);
				
			}
			
		}else if(chucNang.equals("Sua")) {
			String maSP = request.getParameter("maSP");
			String tenSP = request.getParameter("productName");
			String giaBanSP = request.getParameter("priceOld");
			String hinhAnh = request.getParameter("imageProduct");
			String sale = request.getParameter("sale");
			String idNCC = request.getParameter("nameSupplier");
			String moTa = request.getParameter("description");
			String loaiSP = request.getParameter("type");
			String gioiTinh = request.getParameter("sex");
			String chatLieu = request.getParameter("material");
			String kieuDang = request.getParameter("design");
			String xuatXu = request.getParameter("origin");
			String phongCach = request.getParameter("style");
			
			List<Image> list = new ArrayList<>();				
			Image i1 = new Image(hinhAnh,maSP,1);
			list.add(i1);
			Product sp = new ProductDAO().mapProduct.get(maSP);
			double priceP = Double.parseDouble(giaBanSP);
			int numSale = Integer.parseInt(sale);
			Product sanpham = new Product(maSP, tenSP, priceP, list,numSale ,idNCC,1);
			
			DetailProduct ct_sp = new DetailProductDAO().mapDetailProduct.get(maSP);
			DetailProduct newCT_SP = new DetailProduct(maSP, ct_sp.getVendorId(), moTa, loaiSP, gioiTinh, chatLieu, kieuDang, xuatXu, phongCach, ct_sp.getWarrantyPeriod());
			Log log = new Log(Log.WARNING,tk.getNameAcc(),src,"Edit" + sanpham.toString() + ct_sp.toString(),1);
			new LogDAO().add(log,request);
			new ProductDAO().edit(maSP, sanpham);
			new DetailProductDAO().edit(maSP, newCT_SP);
			System.out.println(maSP);
			getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/manage?loai=product").forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		doGet(request, response);
	}

}
