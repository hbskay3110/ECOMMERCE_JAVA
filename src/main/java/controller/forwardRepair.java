package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DetailProductDAO;
import dao.NhaCungCapDAO;
import dao.ProductDAO;
import model.DetailProduct;
import model.Vendor;
import model.Product;

/**
 * Servlet implementation class forwardRepair
 */
@WebServlet("/startbootstrap-sb-admin-2-master/forwardRepair")
public class forwardRepair extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forwardRepair() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String maSP= request.getParameter("id");
			Product sanPham = new ProductDAO().mapProduct.get(maSP);
			DetailProduct chiTiet_SanPham = DetailProductDAO.mapDetailProduct.get(maSP);

			System.out.println(sanPham);
			Vendor ncc = NhaCungCapDAO.mapNhaCC.get(chiTiet_SanPham.getVendorId());
			request.setAttribute("sp", sanPham);
			request.setAttribute("ct_sp", chiTiet_SanPham);
			request.setAttribute("ncc", ncc);
			getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/repairSP.jsp").forward(request, response);
		}catch (Exception e){
			e.getStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
