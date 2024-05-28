  package controller;

  import dao.*;
  import model.*;

  import javax.servlet.ServletException;
  import javax.servlet.annotation.WebServlet;
  import javax.servlet.http.HttpServlet;
  import javax.servlet.http.HttpServletRequest;
  import javax.servlet.http.HttpServletResponse;
  import javax.servlet.http.HttpSession;
  import java.io.IOException;
  import java.util.List;

/**
 * Servlet implementation class productDetail
 */
@WebServlet("/product/productDetail")
public class productDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public productDetail() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			HttpSession session = request.getSession();
			String maSP = request.getParameter("maSP");
			if(session.getAttribute("userLogin")==null) {
				request.setAttribute("maSP", maSP);
				response.sendRedirect("/WebBanHang/Login.jsp");
			}else {
				Account account =(Account) session.getAttribute("userLogin");
				ImageDAO imgDAO = new ImageDAO();
				List<Image> images = imgDAO.getImgByIdProduct(maSP);
				Product sp = ProductDAO.mapProduct.get(maSP);
				DetailProduct ct_sp = DetailProductDAO.mapDetailProduct.get(maSP);
				ViewDAO viewDAO = new ViewDAO();
				viewDAO.getViewCount(maSP);
				int offset = 0;
				int limit = 5;
				List<Comment> commentList = new CommentDAO().showMoreComment(offset,limit, maSP );
				List<Comment> commentListFull = new CommentDAO().showMoreComment(offset,new CommentDAO().mapComment.size(), maSP );
				boolean isFavourite = FavouriteProductDAO.listFavourite.stream()
						.anyMatch(f -> f.getIdP().equals(maSP) && f.getNameAcc().equals(account.getNameAcc()));
				request.setAttribute("sp", sp);
				System.out.println(ct_sp.toString());
				request.setAttribute("CT_SP", ct_sp);
				request.setAttribute("isFavourite", isFavourite);
				request.setAttribute("listComment", commentList);
				request.setAttribute("listCommentFull", commentListFull);
				request.setAttribute("images", images);
				getServletContext().getRequestDispatcher("/product/product-details.jsp").forward(request, response);

			}
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
