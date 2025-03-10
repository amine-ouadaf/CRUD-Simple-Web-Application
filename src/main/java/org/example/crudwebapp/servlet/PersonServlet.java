package org.example.crudwebapp.servlet;

import org.example.crudwebapp.dao.PersonDAO;
import org.example.crudwebapp.model.Person;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/persons")
public class PersonServlet extends HttpServlet {
    private PersonDAO personDAO;

    @Override
    public void init() throws ServletException {
        personDAO = new PersonDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            Long id = Long.parseLong(request.getParameter("id"));
            Person person = personDAO.read(id);
            request.setAttribute("person", person);
            request.getRequestDispatcher("/WEB-INF/edit.jsp").forward(request, response);
        } else {
            request.setAttribute("persons", personDAO.readAll());
            request.getRequestDispatcher("/WEB-INF/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            Person person = new Person();
            person.setName(request.getParameter("name"));
            person.setEmail(request.getParameter("email"));
            personDAO.create(person);
        } else if ("update".equals(action)) {
            Person person = new Person();
            person.setId(Long.parseLong(request.getParameter("id")));
            person.setName(request.getParameter("name"));
            person.setEmail(request.getParameter("email"));
            personDAO.update(person);
        } else if ("delete".equals(action)) {
            Long id = Long.parseLong(request.getParameter("id"));
            personDAO.delete(id);
        }

        response.sendRedirect("persons");
    }
}