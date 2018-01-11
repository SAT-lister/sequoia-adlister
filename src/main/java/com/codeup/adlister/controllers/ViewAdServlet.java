package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.ViewAdsServlet", urlPatterns = "/ads/view")
public class ViewAdServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        if (request.getSession().getAttribute("id") != null) {

            Long id = Long.parseLong(request.getParameter("id"));
            Ad ad = DaoFactory.getAdsDao().getAd(id);
            request.setAttribute("ad", ad);

        request.getRequestDispatcher("/WEB-INF/ads/view.jsp").forward(request, response);
    }
}
