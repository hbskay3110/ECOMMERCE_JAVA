package filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.Filter;
import model.Account;

/**
 * Servlet Filter implementation class Filter
 */
@WebFilter("/startbootstrap-sb-admin-2-master/*")
public class FilterAdmin implements Filter{

    /**
     * Default constructor. 
     */
    public FilterAdmin() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see FilterAdmin#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see FilterAdmin#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		// pass the request along the filter chain
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String url = httpRequest.getServletPath();
		
		HttpSession session = ((HttpServletRequest) request).getSession();
		Account tk = (Account) session.getAttribute("userLogin");
		
		if((tk == null || tk.getRole().equals("0")) && !url.contains("Login.jsp") && !url.contains("/Admin")) {
			httpRequest.getRequestDispatcher("/startbootstrap-sb-admin-2-master/Login.jsp").forward(httpRequest, httpResponse);
		}else {
			if(url.contains("Xoa")){
				if(!tk.getRole().equals("2")){
					httpRequest.getRequestDispatcher("/startbootstrap-sb-admin-2-master/404.jsp").forward(httpRequest, httpResponse);;
				}else {
					chain.doFilter(request, response);
				}
			}else{
				chain.doFilter(request, response);
			}

		}



	}

	/**
	 * @see FilterAdmin#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
