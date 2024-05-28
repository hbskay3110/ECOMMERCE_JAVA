package controller;

import model.Comment;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/CommentForward")
public class CommentForward extends HttpServlet {
    public CommentForward(){
        super();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher rd = req.getRequestDispatcher("product/product-details.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    if(req.getCharacterEncoding() !=null){
    req.setCharacterEncoding("UTF-8");
}
       String idP = req.getParameter("idP");
       String content = req.getParameter("content");
       String username = req.getParameter("username");

       Comment cmt  = new Comment();
       cmt.setContent(content);
       cmt.setNameAcc(username);
       cmt.setIdP(idP);

    }
}
