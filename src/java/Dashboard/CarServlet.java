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

@WebServlet(name = "CarServlet", urlPatterns = {"/CarServlet"})
public class CarServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String carId = request.getParameter("CarID");

        if ("delete".equals(action)) {
            deleteCar(request, response, carId);
        } else {
            String carModel = request.getParameter("CarModel");
            String carNumber = request.getParameter("CarNumber");
            String driverId = request.getParameter("DriverID");
            String status = request.getParameter("Status");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String query;
                    if ("edit".equals(action)) {
                        query = "UPDATE Cars SET CarModel=?, CarNumber=?, DriverID=?, Status=? WHERE CarID=?";
                    } else {
                        query = "INSERT INTO Cars (CarModel, CarNumber, DriverID, Status) VALUES (?, ?, ?, ?)";
                    }

                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setString(1, carModel);
                        stmt.setString(2, carNumber);
                        stmt.setInt(3, Integer.parseInt(driverId));
                        stmt.setString(4, status);

                        if ("edit".equals(action)) {
                            stmt.setInt(5, Integer.parseInt(carId));
                        }

                        int rowsAffected = stmt.executeUpdate();
                        if (rowsAffected > 0) {
                            response.sendRedirect("car.jsp?success=Car " + ("edit".equals(action) ? "updated" : "added") + " successfully.");
                        } else {
                            response.sendRedirect("car.jsp?error=Failed to " + ("edit".equals(action) ? "update" : "add") + " car.");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("car.jsp?error=Database error! Please try again.");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String carId = request.getParameter("CarID");

        if ("delete".equals(action)) {
            deleteCar(request, response, carId);
        }
    }

    private void deleteCar(HttpServletRequest request, HttpServletResponse response, String carId)
            throws IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String query = "DELETE FROM Cars WHERE CarID=?";
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setInt(1, Integer.parseInt(carId));
                    int rowsDeleted = stmt.executeUpdate();
                    if (rowsDeleted > 0) {
                        response.sendRedirect("car.jsp?success=Car deleted successfully.");
                    } else {
                        response.sendRedirect("car.jsp?error=Failed to delete car.");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("car.jsp?error=Database error! Please try again.");
        }
    }
}