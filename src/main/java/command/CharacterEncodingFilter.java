package command;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpFilter;

                //urlPatterns {} 안에 특정 여러 서블릿 매핑 가능
@WebFilter(urlPatterns = {"*.do1", "*.do2", "*.do3", "*.do4", "*.do5", "*.do6", "*.do7", "*.do8"}, 
	initParams = @WebInitParam(name = "boardEncoding", value = "UTF-8"))

public class CharacterEncodingFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;  
	private String encoding;
	
    public CharacterEncodingFilter() {
        super();
        // TODO Auto-generated constructor stub
    }


    public void init(FilterConfig fConfig) throws ServletException {
    	encoding = fConfig.getInitParameter("boardEncoding");
    }


// 필터에서 사전 처리를 수행하고 나서 브라우저가 요청한 서블릿으로 호출을 전달하기 위해서는 
	// doFilter() 메소드에서 매개변수로 받은 FilterChain 객체의 doFilter()를 호출해야 함
	//그렇지 않으면 사용자가 호출한 서블릿은 절대 실행되지 않음
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain(요청을 필터 체인에 넘기기)
		// 서블릿이 수행되기 전에 인코딩을 처리한다.
		request.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

}
