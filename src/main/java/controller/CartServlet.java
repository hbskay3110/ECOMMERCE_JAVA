package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import dao.DetailProductDAO;
import dao.ProductDAO;
import model.DetailProduct;
import model.Product;
import model.BillProduct;
import org.json.JSONObject;
import model.DiscountCode;
import dao.DiscountCodeDAO;
/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/product/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String maSP = request.getParameter("maSP");
		request.setAttribute("listDiscount", new DiscountCodeDAO().mapDiscount.values());
		String soLuong = request.getParameter("quantity");

		Product sp = ProductDAO.mapProduct.get(maSP);
		DetailProduct ct_sp = DetailProductDAO.mapDetailProduct.get(maSP);
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("cart");
		double price = 0;
		int totalP = 0;
		double totalMoney = 0;
		int sizeCart = 0;
		double total = 0;
		String action = request.getParameter("action"); // gọi tới dữ liệu có tên là action
		System.out.println(action);
		if (action.equals("Them")) {
			// nếu chưa có session cart
			if (obj == null) {
				try {

					totalP = Integer.parseInt(soLuong);
				} catch (Exception e) {
					// TODO: handle exception
					e.getMessage();
				}
				totalMoney = sp.getPriceSale() * totalP;
				BillProduct billProduct = new BillProduct(maSP, sp.getNameP(), sp.getPriceSale(), totalP, totalMoney, sp.getListImage().get(0).getNameI());

				Map<String, BillProduct> mapCart = new HashMap<String, BillProduct>();
				mapCart.put(maSP, billProduct);
				sizeCart = mapCart.size();
				session.setAttribute("cart", mapCart);
				session.setAttribute("total", billProduct.getTotal());
			} else {
				Map<String, BillProduct> mapCart = (Map<String, BillProduct>) obj;
				BillProduct billProduct = mapCart.get(maSP);


					// chưa có sản phẩm đó trong giỏ hàng
					if(billProduct==null) {
						try {

							totalP = Integer.parseInt(soLuong);
						} catch (Exception e) {
							// TODO: handle exception
							e.getMessage();
						}
						totalMoney = sp.getPriceSale() * totalP;
						System.out.println(totalMoney);
						billProduct = new  BillProduct(maSP, sp.getNameP(),sp.getPriceSale(),totalP, totalMoney, sp.getListImage().get(0).getNameI());
						System.out.println(billProduct.toString());
						mapCart.put(maSP, billProduct);
					}else { // đã có sản phẩm đó trong giỏ hàng
						try {

							totalP = Integer.parseInt(soLuong) + billProduct.getQuantity();
						} catch (Exception e) {
							// TODO: handle exception
							e.getMessage();
						}
						totalMoney = sp.getPriceSale() * totalP;

						billProduct.setQuantity(totalP);
						billProduct.setTotal(totalMoney);
					}
					for (BillProduct b : mapCart.values()) {
						total+= b.getTotal();
					}
					sizeCart = mapCart.size();
					for(BillProduct i : mapCart.values()){
						System.out.println("m"+ i.toString());
					}

					session.setAttribute("cart", mapCart);
					session.setAttribute("total", total);
				}
			session.setAttribute("sizeCart", sizeCart);
			getServletContext().getRequestDispatcher("/product/cart.jsp").forward(request, response);
			}else
		if(action.equals("Xoa")) {
				Map<String, BillProduct> mapCart = (Map<String, BillProduct>)obj;
				mapCart.remove(maSP);
				session.setAttribute("cart", mapCart);
				sizeCart = mapCart.size();
				session.setAttribute("sizeCart", sizeCart);
				getServletContext().getRequestDispatcher("/product/cart.jsp").forward(request, response);
			}else
		if(action.equalsIgnoreCase("Update")) {
				String newQuantity = request.getParameter("quantity");
				Map<String, BillProduct> mapCart = (Map<String, BillProduct>)obj;
				BillProduct billProduct = mapCart.get(maSP);
				try {

					totalP = Integer.parseInt(newQuantity);
				} catch (Exception e) {
					// TODO: handle exception
					e.getMessage();
				}
				totalMoney = billProduct.getPrice() * totalP;

				billProduct.setQuantity(totalP);
				billProduct.setTotal(totalMoney);
				for (BillProduct b : mapCart.values()) {
					total+= b.getTotal();
				}
				sizeCart = mapCart.size();
				session.setAttribute("cart", mapCart);
				session.setAttribute("total", total);
				session.setAttribute("sizeCart", sizeCart);
				getServletContext().getRequestDispatcher("/product/cart.jsp").forward(request, response);;
			}
		else
			if (action.equals("ApDung")) {
				try {
					String discountCode = request.getParameter("discountCode");
					DiscountCode dc = DiscountCodeDAO.mapDiscount.get(discountCode);
					total = (double) session.getAttribute("total");
					System.out.println(total);
					boolean success = false;
					System.out.println(dc);

					if (dc != null) {
						double discountAmount = dc.getValueDiscount();
						System.out.println("d" + discountAmount);
						int remainingCodes = dc.getAmount();
						LocalDate startDate = LocalDate.parse(dc.getStartDate());
						LocalDate endDate = LocalDate.parse(dc.getEndDate());
						LocalDate currentDate = LocalDate.now();

						// Kiểm tra tổng tiền, số lượng mã còn và ngày áp dụng
						if (discountAmount > 0 && total >= dc.getConditionDiscount() && remainingCodes > 0 &&
								currentDate.isAfter(startDate) && currentDate.isBefore(endDate)) {
							success = true;
							total = total - discountAmount;
							System.out.println(total);
							dc.setAmount(remainingCodes - 1);
						}
					}
					System.out.println(total);

					session.setAttribute("total", total);
					response.setContentType("text/html;charset=UTF-8");
					Map<String, String> rs = new HashMap<>();
					rs.put("success", String.valueOf(success));
					rs.put("total", String.valueOf(total));
					Gson gson = new Gson();
					String json = gson.toJson(rs);
					response.getWriter().write(json);

				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
			}
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
