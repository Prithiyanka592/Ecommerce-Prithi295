# Contributing Guide

## How to set up the project locally

1. Clone the repository
2. Make sure you have Java 17 and Maven installed
3. Run `mvn clean package`
4. Deploy the generated WAR file to Tomcat 9 or above
5. Access the application at `http://localhost:8080/ecommerce-prithi295`

## Project Guidelines

- Follow the layered architecture: DAO → Service → Servlet
- Always use PreparedStatement for database queries
- Never store plain text passwords (use BCrypt)
- Escape all user-supplied output in JSP pages
- Keep commits small and meaningful
- Update this file and README when adding major features

## Code Style

- Use meaningful class and method names
- Keep methods focused on single responsibility
- Add comments only when the logic is not obvious
