package model;


public class Constants {
  public static String FACEBOOK_APP_ID = "883615802907863";
  public static String FACEBOOK_APP_SECRET = "20b8e870e8ac010d08d261a5d4bc89e1";
  public static String FACEBOOK_REDIRECT_URL = "https://brothershop.click/WebBanHang/login-facebook";
  public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";


  // login google
  public static String GOOGLE_CLIENT_ID = "284404121484-tdfjoomvdpo6m4o6ap7neidh96k964rn.apps.googleusercontent.com";

  public static String GOOGLE_CLIENT_SECRET = "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";

  public static String GOOGLE_REDIRECT_URI = "http://brothershop.click/WebBanHang/LoginWithGoogle";

  public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

  public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

  public static String GOOGLE_GRANT_TYPE = "authorization_code";

}
