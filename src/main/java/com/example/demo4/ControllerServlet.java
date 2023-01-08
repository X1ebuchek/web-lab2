package com.example.demo4;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "ControllerServlet", value = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String x = request.getParameter("x_value");
        x = x.replaceFirst(",",".");
        String y = request.getParameter("y_field");
        y = y.replaceFirst(",",".");
        String r = request.getParameter("r_value");
        String time = request.getParameter("time");
        PrintWriter out = response.getWriter();
//        out.println(x);
//        out.println(y);
//        out.println(r);
        try {
            double x1 = Double.parseDouble(x);
            double r1 = Double.parseDouble(r);
            double y1 = Double.parseDouble(y);
            int time1 = Integer.parseInt(time);
            if (x1<-4 || x1>4 || r1<1 || r1>4 || y1<-3 || y1>5 || time1<-12 || time1>12){
                //out.println(x1 + " " + y1 + " " + r1);
                out.println("100500");
            }
            else {
                getServletContext().getRequestDispatcher("/AreaCheckServlet").forward(request, response);

//                out.println(x1);
//                out.println(y1);
//                out.println(r1);
            }
        }catch (Exception e){
            out.println("Ne trogay url");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = this.getServletContext();
        if (request.getParameter("clearTable") != null){
            servletContext.setAttribute("values_" + request.getSession().getId(),new ArrayList<Result>());
        }
    }
}
