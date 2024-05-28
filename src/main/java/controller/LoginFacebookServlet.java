package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restfb.types.User;
import controller.RestFB;
import dao.AccountDAO;
import model.Account;
import com.restfb.Version;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
@WebServlet("/login-facebook")
public class LoginFacebookServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private static final String REDIRECT_URI = "https://brothershop.click/WebBanHang/login-facebook";
  private static final String APP_ID = "883615802907863";
  private static final String APP_SECRET = "20b8e870e8ac010d08d261a5d4bc89e1";
  public LoginFacebookServlet() {
    super();
  }
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();

    String code = request.getParameter("code");

    if (code == null || code.isEmpty()) {
      String facebookLoginUrl = "https://www.facebook.com/v" + Version.LATEST + "/dialog/oauth?client_id="
              + APP_ID + "&redirect_uri=" + REDIRECT_URI + "&scope=email";
      response.sendRedirect(facebookLoginUrl);
    } else {
      // Đã đăng nhập Facebook, trao đổi mã truy cập và hiển thị thông tin người dùng
      FacebookClient.AccessToken accessToken = new DefaultFacebookClient(Version.LATEST)
              .obtainUserAccessToken(APP_ID, APP_SECRET, REDIRECT_URI, code);
      FacebookClient facebookClient = new DefaultFacebookClient(accessToken.getAccessToken(), Version.LATEST);
      User user = facebookClient.fetchObject("me", User.class);
      request.setAttribute("user", user);
      if(new AccountDAO().mapAccount.get(user.getId())!=null){
        session.setAttribute("userLogin",new AccountDAO().mapAccount.get(user.getId()) );
      }else {
        Account a = new Account(user.getId(),null,user.getName(),null,null,user.getEmail(),user.getBirthday(),null,1,"0");
        new AccountDAO().add(a);
        session.setAttribute("userLogin",a);
      }

      request.getRequestDispatcher("/renderSP").forward(request, response);
    }

  }
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
