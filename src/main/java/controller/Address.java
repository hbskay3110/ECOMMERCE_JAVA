package controller;

import apiLogistic.LoadDataApi;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import model.BillProduct;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/product/address")
public class Address extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // set Tiếng Việt cho serverlet
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        int totalquality = 0;
        try {
        String idDistrict  = request.getParameter("idDistrict");
        String idProvince  = request.getParameter("idProvince");
        String idWard = request.getParameter("idWard");
            System.out.println(idDistrict);
            System.out.println(idProvince);
            System.out.println(idWard);
        String data = "";
        LoadDataApi load = new LoadDataApi();
        if(idDistrict!=null && idWard != null){
            int district = Integer.parseInt(idDistrict);
            int ward = Integer.parseInt(idWard);
            Object obj = session.getAttribute("cart");
            Map<String, BillProduct> mapCart = (Map<String, BillProduct>)obj;
            for (BillProduct b: mapCart.values()) {
                totalquality += b.getQuantity();
            }
            data = load.getRegisterTransport(3695,90737,district,ward,totalquality*10,totalquality,10,totalquality);
            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(data, JsonObject.class);
            String id = jsonObject.get("id").getAsString();
            String created_at = jsonObject.get("created_at").getAsString();
            String leadTime = jsonObject.get("leadTime").getAsString();
            String fee = jsonObject.get("fee").getAsString();
            session.setAttribute("fee",fee);

            request.setAttribute("created_at",created_at);
            request.setAttribute("id",id);
            request.setAttribute("leadTime",leadTime);
        } else if(idDistrict!=null){
            int id = Integer.parseInt(idDistrict);
            data  = load.getWard(id);

        }else {
            int id = Integer.parseInt(idProvince);
            data  = load.getHuyen(id);

        }

        // Trả về dữ liệu dưới dạng JSON
            response.getWriter().write(data);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// set Tiếng Việt cho serverlet
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    }
}
