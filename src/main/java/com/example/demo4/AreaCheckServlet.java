package com.example.demo4;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import static java.lang.Math.*;


@WebServlet(name = "AreaCheckServlet", value = "/AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String session_id = request.getSession(true).getId();
        session_id = "values_" + session_id;


        //String session_id = request.getParameter("session_id");
        ServletContext servletContext = this.getServletContext();
        ArrayList<Result> results = new ArrayList<>();
        if (servletContext.getAttribute(session_id) != null){
            results = (ArrayList<Result>) servletContext.getAttribute(session_id);
        }

        long date1 = System.nanoTime();
        response.setContentType("text/html");

        String x1 = request.getParameter("x_value");
        String y1 = request.getParameter("y_field");
        y1 = y1.replaceFirst(",",".");
        String r1 = request.getParameter("r_value");
        String time1 = request.getParameter("time");
        double x = Double.parseDouble(x1);
        double r = Double.parseDouble(r1);
        double y = Double.parseDouble(y1);
        int time = Integer.parseInt(time1);
        String shot;
//        out.println("<tr>");
//
//        out.println("<td>" + x + "</td>");
//        out.println("<td>" + y + "</td>");
//        out.println("<td>" + r + "</td>");
        if ((x>=0 && x<=r && y>=0 && y<=r/2) ||
            (x<=0 && y>=0 && Math.sqrt(x*x+y*y)<=r) ||
                    (x>=-r/2 && x<=0 && y<=0 && y>=-x-r/2)){
//            out.println("<td>true</td>");
            shot = "true";
        }else{
//            out.println("<td>false</td>");
            shot = "false";
        }
        long date2 = System.nanoTime();
        int leadTime = (int)(date2-date1);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        long now1 = now.getTime()+ (long) time *60*60*1000;
//        out.println("data now" + now.getTime());
        now = new Date(now1);
        String currentTime = sdf.format(now);
//        out.println("<td>" + currentTime + "</td>");
//
//        out.println("<td>" + leadTime/1000 + "</td>");
//
//        out.println("</tr>");


        Result result = new Result(x,y,r,shot,currentTime,leadTime/1000);
        results.add(result);
        servletContext.setAttribute(session_id,results);
//        for (int i = 0;i<results.size();i++) {
            out.println("<tr>");

            out.println("<td>" + results.get(results.size()-1).getX() + "</td>");
            out.println("<td>" + results.get(results.size()-1).getY() + "</td>");
            out.println("<td>" + results.get(results.size()-1).getR() + "</td>");
            out.println("<td>" + results.get(results.size()-1).getShot() + "</td>");
            out.println("<td>" + results.get(results.size()-1).getCurrentTime() + "</td>");
            out.println("<td>" + results.get(results.size()-1).getLeadTime() + "</td>");

            out.println("</tr>");
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
