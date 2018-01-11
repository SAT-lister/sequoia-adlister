package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.EditPasswordServlet", urlPatterns = "/editPassword")
public class EditPasswordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        Long id = Long.parseLong(request.getParameter("id"));
        User user = DaoFactory.getUsersDao().findById(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/editProfile.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Long id = Long.parseLong(request.getParameter("id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        // after a user submits the form..
        // check if a username already exists in the database for the newly edited name.
        // But also handle the issue of when a user doesn't change their name.

        //get the existingUser in the database:
        User existingUser = DaoFactory.getUsersDao().findById(id);
        if (!existingUser.getUsername().equals(username)) {
            User updatedUser = DaoFactory.getUsersDao().findByUsername(username);
            if (updatedUser != null) {
                request.getSession().setAttribute("existingUser", updatedUser);
                request.getRequestDispatcher("/WEB-INF/editProfile.jsp").forward(request, response);
                return;
            }

        }

        User user = DaoFactory.getUsersDao().findById(Long.parseLong(request.getParameter("id")));

        user.setUsername(username);
        user.setEmail(email);
        DaoFactory.getUsersDao().updateUser(user);
        request.getSession().setAttribute("user", user);
        response.sendRedirect("/profile");


    }


}
