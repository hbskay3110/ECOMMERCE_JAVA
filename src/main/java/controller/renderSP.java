package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DetailProductDAO;
import dao.ProductDAO;
import model.Product;

/**
 * Servlet implementation class renderSP
 */
@WebServlet("/renderSP")
public class renderSP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public renderSP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {


		String indexString = request.getParameter("index");
		System.out.println(indexString);
		if(indexString==null) {
			indexString ="1";
		} 
		//load và phân trang sản phẩm
		int index= Integer.parseInt(indexString);
		ProductDAO spDAO = new ProductDAO();
		DetailProductDAO ct_spDAO = new DetailProductDAO();
		int count = spDAO.mapProduct.values().size();//số lượng sp trong ds
		int pageSize = 15;                          // số lượng sp trong 1 trang
		int endPage =0;                             // số trang cuối
		endPage = count/pageSize;
		if(count% pageSize !=0 && count> pageSize) {
			endPage ++;
		}
		if(endPage==0) {
			endPage=1;
		}
		List<String> listLoai = ct_spDAO.listLoaiSP();
		List<Product> listSP = spDAO.render(index, pageSize);
		System.out.println(listSP);
		request.setAttribute("listSP", listSP);
		request.setAttribute("listLoai", listLoai);
		request.setAttribute("endPage", endPage);
		request.setAttribute("index", index);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		}catch (Exception e){
			e.printStackTrace();
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
