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
        User existingEmail = DaoFactory.getUsersDao().findByEmail(email);
        boolean passwordsNotMatch = (!password.equals(passwordConfirmation));
        boolean wrongEmail = (!email.contains("@"));
        boolean emptyUsername = username.isEmpty();
        boolean emptyEmail = email.isEmpty();
        boolean emptyPassword = password.isEmpty();
        boolean emptyPasswordConfirmation = passwordConfirmation.isEmpty();

        // validate input
        boolean inputHasErrors = emptyUsername
            || emptyEmail
            || emptyPassword
            || emptyPasswordConfirmation;

            if (emptyUsername) {

                request.getSession().setAttribute("emptyUsername", emptyUsername);

            }

            if (emptyPassword) {

                request.getSession().setAttribute("emptyPassword", emptyPassword);

            }

            if (emptyPasswordConfirmation) {

                request.getSession().setAttribute("emptyPasswordConfirmation", emptyPasswordConfirmation);

            }

            if (existingUser != null) {

                request.getSession().setAttribute("existingUser", existingUser);

            }

            if (existingEmail != null) {

                request.getSession().setAttribute("existingEmail", existingEmail);

            }

            if (emptyEmail) {

                request.getSession().setAttribute("emptyEmail", emptyEmail);

            } else if (wrongEmail) {

                request.getSession().setAttribute("wrongEmail", true);

                }

            if (passwordsNotMatch) {

                request.getSession().setAttribute("passwordsNotMatch", true);

            }

            if (existingUser != null || wrongEmail || passwordsNotMatch || emptyUsername || emptyEmail || emptyPassword || emptyPasswordConfirmation) {
                if (username == null) {
                request.getSession().setAttribute("username", "");

                }
                if (email == null) {
                request.getSession().setAttribute("email", "");

                }
//                response.sendRedirect("/register");
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);


                return;
            }
//        }

        // create and save a new user
        User user = new User(username, email, password);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
