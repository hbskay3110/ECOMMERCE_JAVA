package controller;

import com.microsoft.sqlserver.jdbc.SQLServerConnection;
import com.microsoft.sqlserver.jdbc.SQLServerDataTable;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import model.ConnectToDatabase;
import model.Log;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.swing.table.DefaultTableModel;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/startbootstrap-sb-admin-2-master/exel")
public class ExportExel extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameEx = request.getParameter("name");
        // Lấy tên file Excel muốn xuất
        String fileName = "myExcelFile.xls";


        // Tạo Workbook và Sheet mới
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("Log");
        XSSFRow row = null;
        Cell cell = null;
        row= sheet.createRow(0);
        cell = row.createCell(0,CellType.STRING);
        cell.setCellValue("ID");
        cell = row.createCell(1,CellType.STRING);
        cell.setCellValue("Level");
        cell = row.createCell(2,CellType.STRING);
        cell.setCellValue("User ID");
        cell = row.createCell(3,CellType.STRING);
        cell.setCellValue("Src");
        cell = row.createCell(4,CellType.STRING);
        cell.setCellValue("Địa chỉ Ip");
        cell = row.createCell(5,CellType.STRING);
        cell.setCellValue("Trình duyệt");
        cell = row.createCell(6,CellType.STRING);
        cell.setCellValue("Nội dung");
        cell = row.createCell(7,CellType.STRING);
        cell.setCellValue("Ngày tạo");
        cell = row.createCell(8,CellType.STRING);
        cell.setCellValue("Trạng thái");

        try {
            Connection connection = new ConnectToDatabase().getConnection();
            if(nameEx.equals("Log")){
                String query = "SELECT * FROM Logs";
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(query);
                List<Log> logs = new ArrayList<>();
                while (resultSet.next()) {
                    Log log = new Log(resultSet.getInt(1), resultSet.getInt(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6), resultSet.getString(7), resultSet.getDate(8), resultSet.getInt(9));
                    logs.add(log);
                }
                for (int i = 0; i < logs.size(); i++) {
                    Log log = logs.get(i);
                    row= sheet.createRow(i + 1);
                    cell = row.createCell(0,CellType.NUMERIC);
                    cell.setCellValue(log.getId());
                    cell = row.createCell(1,CellType.STRING);
                    cell.setCellValue(log.getLevel());
                    cell = row.createCell(2,CellType.STRING);
                    cell.setCellValue(log.getUserId());
                    cell = row.createCell(3,CellType.STRING);
                    cell.setCellValue(log.getSrc());
                    cell = row.createCell(4,CellType.STRING);
                    cell.setCellValue(log.getIpAddress());
                    cell = row.createCell(5,CellType.STRING);
                    cell.setCellValue(log.getUserAgent());
                    cell = row.createCell(6,CellType.STRING);
                    cell.setCellValue(log.getContent());
                    cell = row.createCell(7,CellType.STRING);
                    System.out.println(log.getCreatAt());
                    cell.setCellValue(log.getCreatAt().toString());
                    cell = row.createCell(8,CellType.STRING);
                    cell.setCellValue(log.getStatus());

                }
                // close the result set, statement, and connection

                // Create workbook and sheet
                // Thiết lập kiểu nội dung cho phản hồi của Servlet
                response.setContentType("application/vnd.ms-excel");

                // Thiết lập tiêu đề cho phản hồi của Servlet
                response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                // Lấy đối tượng OutputStream để ghi dữ liệu Excel vào phản hồi của Servlet
                OutputStream outputStream = response.getOutputStream();
                workbook.write(outputStream);
                resultSet.close();
                statement.close();
                connection.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
