package Dashboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ReportsServlet", urlPatterns = {"/ReportsServlet"})
public class ReportsServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String query = "";
                switch (reportType) {
                    case "bookings":
                        query = "SELECT Bookings.*, Customers.FullName AS CustomerName, Cars.CarModel " +
                                "FROM Bookings " +
                                "JOIN Customers ON Bookings.CustomerID = Customers.CustomerID " +
                                "JOIN Cars ON Bookings.CarID = Cars.CarID";
                        break;
                    case "bills":
                        query = "SELECT * FROM Bills";
                        break;
                    case "drivers":
                        query = "SELECT * FROM Drivers";
                        break;
                    default:
                        response.sendRedirect("reports.jsp?error=Invalid report type.");
                        return;
                }

                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    ResultSet rs = stmt.executeQuery();
                    request.setAttribute("reportData", rs);
                    request.getRequestDispatcher("reports.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("reports.jsp?error=Database error! Please try again.");
        }
    }
}