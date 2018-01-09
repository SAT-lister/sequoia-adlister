package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.codeup.adlister.dao.Config.password;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        User existingUser = DaoFactory.getUsersDao().findByUsername(username);
        boolean passwordsNotMatch = (!password.equals(passwordConfirmation));
        boolean wrongEmail = (!email.contains("@"));



        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || passwordConfirmation.isEmpty();


        if (inputHasErrors) {
            doGet(request, response);
            return;
        } else {

            if (existingUser != null) {

                request.getSession().setAttribute("existingUser", existingUser);

            }

            if (passwordsNotMatch) {
                request.getSession().setAttribute("passwordsNotMatch", true);

            }

            if (existingUser != null || wrongEmail || passwordsNotMatch) {
                response.sendRedirect("/register");
                return;
            }
        }

        // create and save a new user
        User user = new User(username, email, password);




        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
