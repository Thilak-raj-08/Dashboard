package Dashboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DriverServlet", urlPatterns = {"/DriverServlet"})
public class DriverServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String driverId = request.getParameter("DriverID");

        if ("delete".equals(action)) {
            deleteDriver(request, response, driverId);
        } else {
            String fullName = request.getParameter("FullName");
            String licenseNumber = request.getParameter("LicenseNumber");
            String phoneNumber = request.getParameter("PhoneNumber");
            String address = request.getParameter("Address");
            String status = request.getParameter("Status");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String query;
                    if ("edit".equals(action)) {
                        query = "UPDATE Drivers SET FullName=?, LicenseNumber=?, PhoneNumber=?, Address=?, Status=? WHERE DriverID=?";
                    } else {
                        query = "INSERT INTO Drivers (FullName, LicenseNumber, PhoneNumber, Address, Status) VALUES (?, ?, ?, ?, ?)";
                    }

                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setString(1, fullName);
                        stmt.setString(2, licenseNumber);
                        stmt.setString(3, phoneNumber);
                        stmt.setString(4, address);
                        stmt.setString(5, status);

                        if ("edit".equals(action)) {
                            stmt.setInt(6, Integer.parseInt(driverId));
                        }

                        int rowsAffected = stmt.executeUpdate();
                        if (rowsAffected > 0) {
                            response.sendRedirect("drivers.jsp?success=Driver " + ("edit".equals(action) ? "updated" : "added") + " successfully.");
                        } else {
                            response.sendRedirect("drivers.jsp?error=Failed to " + ("edit".equals(action) ? "update" : "add") + " driver.");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("drivers.jsp?error=Database error! Please try again.");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String driverId = request.getParameter("DriverID");

        if ("delete".equals(action)) {
            deleteDriver(request, response, driverId);
        }
    }

    private void deleteDriver(HttpServletRequest request, HttpServletResponse response, String driverId)
            throws IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String query = "DELETE FROM Drivers WHERE DriverID=?";
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setInt(1, Integer.parseInt(driverId));
                    int rowsDeleted = stmt.executeUpdate();
                    if (rowsDeleted > 0) {
                        response.sendRedirect("drivers.jsp?success=Driver deleted successfully.");
                    } else {
                        response.sendRedirect("drivers.jsp?error=Failed to delete driver.");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("drivers.jsp?error=Database error! Please try again.");
        }
    }
}