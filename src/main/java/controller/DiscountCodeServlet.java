package controller;

import dao.*;
import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@MultipartConfig
@WebServlet("/startbootstrap-sb-admin-2-master/DiscountCode")
public class DiscountCodeServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiscountCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String chucNang = request.getParameter("chucNang");
        System.out.println(chucNang);

        // set Tiếng Việt cho serverlet
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String src = request.getHeader("Referer");
        HttpSession session = request.getSession();
        Account tk = (Account) session.getAttribute("userLogin");

        if (chucNang == null) {
            System.out.println("Không thực hiện");
        }
        if(chucNang.equals("Them")) {
            String maGiamGia = request.getParameter("maGiamGia");
            String tenMa = request.getParameter("tenMa");
            String giaTriGiam = request.getParameter("giaTriGiam");
            String ngayBatDau = request.getParameter("ngayBatDau");
            String ngayKetThuc = request.getParameter("ngayKetThuc");
            String soLuong = request.getParameter("soLuong");
            String dieuKien = request.getParameter("dieuKien");

            Map<String, String> erorr = new HashMap<>();
            boolean ok = true;
            DiscountCode dCode = new DiscountCodeDAO().mapDiscount.get(maGiamGia);
            if(dCode != null) {
                erorr.put("duplicateMa", "Mã giảm giá đã tồn tại");
                ok = false;
            }
            if(maGiamGia == null || maGiamGia.equals("")) {
                erorr.put("NoID", "Vui lòng nhập trường này");
                ok = false;
            }
            if(tenMa == null || tenMa.equals("")) {
                erorr.put("NoName", "Vui lòng nhập trường này");
                ok = false;
            }

            if(giaTriGiam == null || giaTriGiam.equals("")) {
                erorr.put("NoPrice", "Vui lòng nhập trường này");
                ok = false;
            }
            if(soLuong == null || soLuong.equals("")) {
                erorr.put("NoAmount", "Vui lòng nhập trường này");
                ok = false;
            }
            if(dieuKien == null || dieuKien.equals("")) {
                erorr.put("NoCondition", "Vui lòng nhập trường này");
                ok = false;
            }

            if(!ok) {
                request.setAttribute("erorr", erorr);
                getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/addDiscountCode.jsp").forward(request, response);
            }else {
                double saleValue = Double.parseDouble(giaTriGiam);
                int amount = Integer.parseInt(soLuong);
                double condition = Double.parseDouble(dieuKien);
                DiscountCode diCode = new DiscountCode(maGiamGia, tenMa, saleValue, ngayBatDau, ngayKetThuc, amount, condition, 1);

                new DiscountCodeDAO().add(diCode);
                Log log = new Log(Log.WARNING,tk.getNameAcc(),src,"Add" + diCode.toString(),1);
                new LogDAO().add(log);
                getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/manage?loai=discountCode").forward(request, response);
            }

        }else if(chucNang.equals("Sua")) {
            String maGiamGia = request.getParameter("maGiamGia");
            String tenMa = request.getParameter("tenMa");
            String giaTriGiam = request.getParameter("giaTriGiam");
            String ngayBatDau = request.getParameter("ngayBatDau");
            String ngayKetThuc = request.getParameter("ngayKetThuc");
            String soLuong = request.getParameter("soLuong");
            String dieuKien = request.getParameter("dieuKien");

            double saleValue = Double.parseDouble(giaTriGiam);
            int amount = Integer.parseInt(soLuong);
            double condition = Double.parseDouble(dieuKien);
            DiscountCode diCode = new DiscountCode(maGiamGia, tenMa, saleValue, ngayBatDau, ngayKetThuc, amount, condition, 1);

            Log log = new Log(Log.WARNING,tk.getNameAcc(),src,"Edit" + diCode.toString(),1);
            new LogDAO().add(log);
            new DiscountCodeDAO().edit(maGiamGia, diCode);
            System.out.println(maGiamGia);

            getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/manage?loai=discountCode").forward(request, response);

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
