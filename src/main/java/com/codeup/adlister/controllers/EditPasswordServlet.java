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

        }

        Long id = Long.parseLong(request.getParameter("id"));
        User user = DaoFactory.getUsersDao().findById(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/users/editPassword.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Long id = Long.parseLong(request.getParameter("id"));
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("passwordConfirmation");
        System.out.println(password);
        System.out.println(passwordConfirmation);


        boolean passwordsNotMatch = (!password.equals(passwordConfirmation));
        boolean emptyPassword = password.isEmpty();
        boolean emptyPasswordConfirmation = passwordConfirmation.isEmpty();

        if (emptyPassword) {

            request.getSession().setAttribute("emptyPassword", emptyPassword);

        }

        if (emptyPasswordConfirmation) {

            request.getSession().setAttribute("emptyPasswordConfirmation", emptyPasswordConfirmation);

        }

        if (passwordsNotMatch) {

            request.getSession().setAttribute("passwordsNotMatch", true);

        }

        User user = DaoFactory.getUsersDao().findById(id);
        user.setPassword(password);
        DaoFactory.getUsersDao().updatePassword(user);
        request.getSession().setAttribute("user", user);
        response.sendRedirect("/profile");
    }


}
