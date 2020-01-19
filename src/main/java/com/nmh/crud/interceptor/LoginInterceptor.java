package com.nmh.crud.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String uri = request.getRequestURI();

        if(session.getAttribute("manager_session")!=null || uri.indexOf("/loginIn") != -1) {
            return true;
        }else {
            response.sendRedirect(request.getContextPath()+"/index.jsp");
            return false;
        }
    }

}
