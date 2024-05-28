package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;

import model.UserGoogleDto;
import model.Account;
import model.Constants;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.AccountDAO;

import java.io.IOException;
import org.apache.http.client.fluent.Form;
/**
 * Servlet implementation class LoginWithGoogle
 */
@WebServlet("/LoginWithGoogle")
public class LoginWithGoogle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginWithGoogle() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	HttpSession session = request.getSession();
		String code = request.getParameter("code");
		String accessToken = getToken(code);
		UserGoogleDto  user = getUserInfo(accessToken);
		System.out.println(user);
		Account accGoogle = new Account(user.getId(), null, user.getName(), null, null, user.getEmail(), null, null, 2, "0");
		Account account = new AccountDAO().mapAccount.get(user.getId());
		if(account ==null) {
			//nếu nó chưa tồn tại thì lưu tài khoản xuống database
			new AccountDAO().add(accGoogle);
			session.setAttribute("userLogin", accGoogle);
		} else {
		// rồi đăng nhập
		session.setAttribute("userLogin", account);
		
		}
		  getServletContext().getRequestDispatcher("/renderSP").forward(request, response);	
	}
    public static String getToken(String code) throws ClientProtocolException, IOException {
		// call api to get token
		String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
						.add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
						.add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
				.execute().returnContent().asString();

		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}

	public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();

		UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);

		return googlePojo;
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
