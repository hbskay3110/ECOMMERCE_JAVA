package controller;

import dao.DiscountCodeDAO;
import model.DiscountCode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class forwardRepair
 */
@WebServlet("/startbootstrap-sb-admin-2-master/RepairDiscount")
public class RepairDiscount extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepairDiscount() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String maSP= request.getParameter("id");
            DiscountCode dc = new DiscountCodeDAO().mapDiscount.get(maSP);

            System.out.println(dc);

            request.setAttribute("dc", dc);

            getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/repairDiscountCode.jsp").forward(request, response);
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
