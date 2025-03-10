# Simple CRUD Web Application

This is a minimal CRUD (Create, Read, Update, Delete) web application built using Jakarta EE 11, MySQL, Maven, and Tomcat 11. It allows users to manage a list of persons with basic information (name and email).

## Technologies Used
- **Jakarta EE 11**: For Servlets, JPA, and JSP.
- **MySQL**: Database to store person data.
- **Maven**: Dependency management and build tool.
- **Tomcat 11**: Web server compatible with Jakarta EE 11.
- **JDK 21**: Java Development Kit version.
- **IntelliJ IDEA**: IDE for development and deployment.

## Project Structure
- **src/main/java/org/example/crudwebapp/model/Person.java**: Entity class representing a person.
- **src/main/java/org/example/crudwebapp/dao/PersonDAO.java**: Data Access Object for CRUD operations using JPA.
- **src/main/java/org/example/crudwebapp/servlet/PersonServlet.java**: Servlet to handle HTTP requests and responses.
- **src/main/webapp/WEB-INF/list.jsp**: JSP page to list all persons and provide a form to create a new person.
- **src/main/webapp/WEB-INF/edit.jsp**: JSP page to edit an existing person.
- **src/main/webapp/index.jsp**: Welcome page with links to the CRUD operations.
- **src/main/resources/META-INF/persistence.xml**: JPA configuration for database connection.

## Prerequisites
1. **JDK 21**: Ensure JDK 21 is installed and configured in your environment.
2. **MySQL**: Install MySQL and create a database named `testdb`.
3. **Tomcat 11**: Download and configure Apache Tomcat 11.
4. **Maven**: Ensure Maven is installed for dependency management.
5. **IntelliJ IDEA**: Recommended IDE for development and deployment.

## Setup Instructions

### 1. Clone the Repository
Clone this project to your local machine:
```bash
git clone <repository-url>
