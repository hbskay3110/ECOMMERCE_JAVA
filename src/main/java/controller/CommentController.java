package controller;

import dao.CommentDAO;
import model.Account;
import model.Comment;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/product/CommentController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CommentController extends HttpServlet {
    public CommentController(){
        super();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rd = req.getRequestDispatcher("product/product-details.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        // Lấy ra mã sản phẩm được comment
        String idP = req.getParameter("idP");
        // Lấy ra nội dung comment
        String content = req.getParameter("content");
        String rating = req.getParameter("rating");
        // Lấy ra số lượng comment đang được hiển thị
        String limitComment = req.getParameter("limit");
        HttpSession session = req.getSession();
        // Lấy ra tài khoản đang đăng nhập
        Account tk = (Account) session.getAttribute("userLogin");

//        List<Comment> commentList = CommentDAO.mapComment;
        int offset = 0;
        int limit = 5;
        // nếu có số lương comment (số comment đang được hiển thị) (dùng cho chức năng xem thêm)
        if(limitComment!=null){
            // chuyển thành int
            int limitC = Integer.parseInt(limitComment);
            // cộng số lượng đó lên 5 comment
            limit += limitC;
        } // nếu không có số lượng comment (tức là nguời dùng comment)
        else{
            // tạo ra 2 list chưá
            List<Part> imageParts = new ArrayList<>();
            List<Part> videoParts = new ArrayList<>();
            // Lặp qua các file gửi từ client và lưu vào danh sách tương ứng
            for (Part part : req.getParts()) {
                // lấy ra kiểu dữ liệu của từng part
                String contentType = part.getContentType();
               // Kiểm tra kiểu dữ liệu (contentType) của từng Part để phân loại và thêm vào danh sách tương ứng.
                if (contentType != null && contentType.startsWith("image/")) {
                    imageParts.add(part);
                } else if (contentType != null && contentType.equals("video/mp4")) {
                    videoParts.add(part);
                }
            }

            // Lưu các file vào thư mục của server
            List<String> images = new ArrayList<>();
            List<String> videos = new ArrayList<>();
            // Kiểm tra nếu danh sách imageParts không rỗng, thực hiện vòng lặp để lưu các file ảnh vào thư mục trên máy chủ.
            if (imageParts != null && imageParts.size() > 0) {
                // duyệt quanh danh sacách
                for (Part imagePart : imageParts) {
                    // lấy ra tên của ảnh
                    String imagePath = Path.of(imagePart.getSubmittedFileName()).getFileName().toString();
                    // tạo ra đường dẫn để lưuu
                    String realPath = getServletContext().getRealPath("assets/img/dataComment");
                    // nếu file đó chưa tồn tại
                    if (!Files.isDirectory(Paths.get(realPath))) {
                        // tạo ra
                        Files.createDirectories(Paths.get(realPath));
                    }
                    //Tạo đường dẫn tới file ảnh trong thư mục của dự án (imagePathInProject).
                    Path imagePathInProject = Paths.get(realPath, imagePath);
                    // Ghi file ảnh từ Part vào đường dẫn trên máy chủ bằng imagePart.write().
                    imagePart.write(imagePathInProject.toString());
                    //Thêm tên file ảnh vào danh sách images.
                    images.add(imagePath);
                }

            }
            if (videoParts != null && videoParts.size() > 0) {
                for (Part videoPart : videoParts) {
                    String realPath = req.getServletContext().getRealPath("assets/img/dataComment");
                    String vdPart = Path.of(videoPart.getSubmittedFileName()).getFileName().toString();
                    if(!Files.isDirectory(Path.of(realPath))) {
                        Files.createDirectory(Path.of(realPath));
                    }
                    //Tạo đường dẫn tới file ảnh trong thư mục của dự án (imagePathInProject).
                    Path videoPathInProject = Paths.get(realPath, vdPart);
                    videoPart.write(videoPathInProject.toString());
                    videos.add(vdPart);
                }
            }
            // lưu các tên ảnh vào database
            for (String img : images){
                new CommentDAO().addImage(img);

            }
            // lưu các tên video vào database
            for (String video : videos){
                new CommentDAO().addVideo(video);
            }
            // tạo ra đối tượng comment vào lưu vào db
            Comment cmt  = new Comment(idP,tk.getNameAcc(),content,Integer.parseInt(rating));
            new CommentDAO().add(cmt);
        }
        // lấy ra danh sách comment
        List<Comment> commentList = new CommentDAO().showMoreComment(offset,limit, idP );
        List<Comment> commentListFull = new CommentDAO().showMoreComment(offset,new CommentDAO().mapComment.size(), idP );
        req.setAttribute("listComment", commentList);
        req.setAttribute("listCommentFull", commentListFull);
            RequestDispatcher rd = req.getRequestDispatcher("/DisplayComment.jsp");
            rd.forward(req, resp);


    }
}
