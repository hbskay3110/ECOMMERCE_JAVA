package apiLogistic;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import model.District;
import model.Transport;
import model.Ward;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Array;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.*;


public class LoadDataApi {

    public static String Login() throws Exception {
        String provinceName = "";
        try {
            URL url = new URL("http://140.238.54.136/api/auth/login ");
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");

            // Gửi các tham số
            String params = "email=20130298@st.hcmuaf.edu.vn&password=123456";
            con.setDoOutput(true);
            DataOutputStream out = new DataOutputStream(con.getOutputStream());
            out.writeBytes(params);
            out.flush();
            out.close();

            // Đọc phản hồi
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            // Phân tích dữ liệu JSON bằng Gson
            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(response.toString(), JsonObject.class);
             provinceName = jsonObject.get("access_token").getAsString();


        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return provinceName;
    }
//    @POST
//    @Path("/getTinh")
//    @Consumes(MediaType.APPLICATION_JSON)
//    @Produces(MediaType.APPLICATION_JSON)
    public static String getProvince() throws Exception {
        Map<Integer,String> rs = new HashMap<>();
        try {
            // URL của API
            String apiUrl = "http://140.238.54.136/api/province";

            // Tạo đối tượng URL
            URL url = new URL(apiUrl);

            // Tạo đối tượng HttpURLConnection
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Thiết lập phương thức GET và Header Authorization
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "Bearer " + Login());

            // Đọc phản hồi từ API
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // In phản hồi từ API
            // Phân tích dữ liệu JSON bằng Gson
            System.out.println(response.toString());
            Gson gson = new Gson();
            JsonObject object = gson.fromJson(response.toString(), JsonObject.class);
            JsonObject original = object.get("original").getAsJsonObject();
            JsonArray jsonArray = gson.fromJson(original.get("data"), JsonArray.class);
            for (int i = 0; i < jsonArray.size(); i++) {
                JsonObject jsonObject = jsonArray.get(i).getAsJsonObject();
                String provinceName = jsonObject.get("ProvinceName").getAsString();
                int provinceId = jsonObject.get("ProvinceID").getAsInt();
                rs.put(provinceId,provinceName);

            }
            String tinhJson = gson.toJson(rs);

            return tinhJson;
//            int provinceId = jsonObject.get("PprovinceId").getAsInt();


        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public String getHuyen(int provinceID) throws Exception {
        List<District> rs = new ArrayList<>();
        try {
            // URL của API
            // URL của API
            String apiUrl = " http://140.238.54.136/api/district?provinceID="+provinceID;
            // Tạo đối tượng URL
            URL url = new URL(apiUrl);

            // Tạo đối tượng HttpURLConnection
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Thiết lập phương thức GET và Header Authorization
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "Bearer " + Login());

            // Đọc phản hồi từ API
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // In phản hồi từ API
            // Phân tích dữ liệu JSON bằng Gson
            System.out.println(response.toString());
            Gson gson = new Gson();
            JsonObject object = gson.fromJson(response.toString(), JsonObject.class);
            JsonObject original = object.get("original").getAsJsonObject();
            JsonArray jsonArray = gson.fromJson(original.get("data"), JsonArray.class);
            for (int i = 0; i < jsonArray.size(); i++) {
                JsonObject jsonObject = jsonArray.get(i).getAsJsonObject();
                int districtID = jsonObject.get("DistrictID").getAsInt();
                String districtName = jsonObject.get("DistrictName").getAsString();
                int provinceId = jsonObject.get("ProvinceID").getAsInt();
                rs.add(new District(provinceId,districtID,districtName));
            }
            // Sử dụng Gson để chuyển đổi danh sách thành chuỗi JSON

            String huyenJson = gson.toJson(rs);

            return huyenJson;

//            int provinceId = jsonObject.get("PprovinceId").getAsInt();
//            System.out.println("Province: " + jsonArray );

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public static String getWard(int districtID) throws Exception {
        List<Ward> rs = new ArrayList<>();
        try {
            // URL của API
            // URL của API
            String apiUrl = "  http://140.238.54.136/api/ward?districtID="+districtID;
            // Tạo đối tượng URL
            URL url = new URL(apiUrl);

            // Tạo đối tượng HttpURLConnection
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Thiết lập phương thức GET và Header Authorization
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "Bearer " + Login());

            // Đọc phản hồi từ API
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // In phản hồi từ API
            // Phân tích dữ liệu JSON bằng Gson
            System.out.println(response.toString());
            Gson gson = new Gson();
            JsonObject object = gson.fromJson(response.toString(), JsonObject.class);
            JsonObject original = object.get("original").getAsJsonObject();
            JsonArray jsonArray = gson.fromJson(original.get("data"), JsonArray.class);
            for (int i = 0; i < jsonArray.size(); i++) {
                JsonObject jsonObject = jsonArray.get(i).getAsJsonObject();
                String wardCode = jsonObject.get("WardCode").getAsString();
                String wardName = jsonObject.get("WardName").getAsString();

                rs.add(new Ward(wardCode,districtID,wardName));
            }
            String xaJson = gson.toJson(rs);

            return xaJson;
//            int provinceId = jsonObject.get("PprovinceId").getAsInt();
//            System.out.println("Province: " + jsonArray );

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
    public static String getRegisterTransport(int from_district_id,int from_ward_id,int to_district_id,int to_ward_id,int height,int length,int width,int weight) throws Exception {
        List<Ward> rs = new ArrayList<>();
        try {
            // URL của API

            String apiUrl = "http://140.238.54.136/api/registerTransport?from_district_id="+from_district_id+"&from_ward_id="+from_ward_id+"&to_district_id="+to_district_id
                    +"&to_ward_id="+to_ward_id+"&length="+length+"&width="+width+"&weight="+weight+"&height="+height;
            // Tạo đối tượng URL
            URL url = new URL(apiUrl);

            // Tạo đối tượng HttpURLConnection
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Thiết lập phương thức GET và Header Authorization
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Authorization", "Bearer " + Login());

            // Đọc phản hồi từ API
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // In phản hồi từ API
            // Phân tích dữ liệu JSON bằng Gson
            System.out.println(response.toString());

            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(response.toString(), JsonObject.class);
            JsonObject transport1 = jsonObject.get("Transport").getAsJsonObject();
            String id = transport1.get("id").getAsString();
            String created_at = transport1.get("created_at").getAsString();
            String leadTime = transport1.get("leadTime").getAsString();
            String fee = transport1.get("fee").getAsString();
            Transport t = new Transport(id,fee,leadTime,created_at);
            System.out.println(t);
            String transport = gson.toJson(t);
            return transport;
//            int provinceId = jsonObject.get("PprovinceId").getAsInt();
//            System.out.println("Province: " + jsonArray );
//
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
    public static String getAllTransport() throws Exception {

        try {
            // URL của API
            // URL của API
            String apiUrl = "http://140.238.54.136/api/allTransports";
            // Tạo đối tượng URL
            URL url = new URL(apiUrl);

            // Tạo đối tượng HttpURLConnection
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Thiết lập phương thức GET và Header Authorization
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "Bearer " + Login());

            // Đọc phản hồi từ API
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();


            System.out.println(response.toString());

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }


    public static void main(String[] args) throws  Exception {
//        System.out.println(new LoadDataApi().getRegisterTransport(3695,90737,2270,231013,1,3,100,1));
//        long seconds = 1682207999; // số giây cần chuyển đổi
//         Date date = new Date(seconds * 1000); // chuyển giây thành mili giây và tạo một đối tượng Date
//
//
//        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy"); // tạo đối tượng định dạng SimpleDateFormat
//        String formattedDate = formatter.format(date); // định dạng đối tượng Date thành chuỗi
//        System.out.println(formattedDate); // in ra chuỗi ngày tháng năm
        System.out.println(new LoadDataApi().getAllTransport());

    }


}
