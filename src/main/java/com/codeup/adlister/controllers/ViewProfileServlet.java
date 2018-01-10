package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.Users;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.codeup.adlister.dao.DaoFactory.getAdsDao;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        User user = (User) request.getSession().getAttribute("user");
        long id = user.getId();
        // get a list of ads that belong to the logged in user
        // 1. get the logged in user's id
        // 2. Call a method on the ads dao to get the ads for a given user id
        String ad = request.getParameter( "ad" );
        Ads adFactory = DaoFactory.getAdsDao();
        List<Ad> userAds = adFactory.getAds(id);
        // 3. pass those ads to the jsp
        request.getSession().setAttribute("ads", userAds);

        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }
}
