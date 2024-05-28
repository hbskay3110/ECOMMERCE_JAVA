package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FavouriteProductDAO;
import model.Account;
import model.Favourite;

@WebServlet("/FavouritesServlet")
public class FavouritesServlet extends HttpServlet {

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String referer = request.getHeader("referer");
        System.out.println(referer);
        String idP = request.getParameter("idP");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("userLogin");

        FavouriteProductDAO favouriteProductDAO = new FavouriteProductDAO();
        Favourite favourite = new Favourite(idP, account.getNameAcc());
        System.out.println(idP + account.getNameAcc());
        // Kiểm tra nếu sản phẩm đã có trong danh sách yêu thích
        if (favouriteProductDAO.isFavourite(favourite)) {
            // Xóa khỏi danh sách yêu thích
            favouriteProductDAO.delete(idP, account.getNameAcc());
        } else {
            // Thêm vào danh sách yêu thích
            favouriteProductDAO.add(favourite);
        }
        if(referer.endsWith("DetailUser")){
            response.sendRedirect("product/DetailUser");
        }
        else {
            response.sendRedirect("product/productDetail?maSP=" + idP);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

