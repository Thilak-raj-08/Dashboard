package Dashboard;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get the current session
        HttpSession session = request.getSession(false); // false prevents creating a new session if none exists
        
        if (session != null) {
            session.invalidate(); // Destroy session
        }
        
        // Redirect to login page with a message
        response.sendRedirect("index.jsp?success=You have been logged out successfully.");
    }

    @Override
    public String getServletInfo() {
        return "Handles user logout and session termination.";
    }
}
