package filter;

import javax.servlet.*;
import java.io.IOException;

public class EncodingFilter implements Filter {
    public void init(FilterConfig config) throws ServletException{}
    public void destroy(){}
    public void doFilter(ServletRequest requset,ServletResponse response,
                         FilterChain chain)throws IOException,ServletException{
        requset.setCharacterEncoding("utf-8");
        chain.doFilter(requset,response);
    }
}

