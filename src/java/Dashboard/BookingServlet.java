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

@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action"); // Determine the action (add, edit, delete)
        String bookingId = request.getParameter("BookingID"); // For edit and delete

        if ("delete".equals(action)) {
            // Handle delete action
            deleteBooking(request, response, bookingId);
        } else {
            // Handle add or edit action
            String customerId = request.getParameter("CustomerID");
            String carId = request.getParameter("CarID");
            String pickupLocation = request.getParameter("PickupLocation");
            String destination = request.getParameter("Destination");
            String bookingDate = request.getParameter("BookingDate");
            String bookingTime = request.getParameter("BookingTime");
            String status = request.getParameter("Status");

            // Validate required fields
            if (customerId == null || carId == null || pickupLocation == null || destination == null ||
                customerId.isEmpty() || carId.isEmpty() || pickupLocation.isEmpty() || destination.isEmpty()) {
                response.sendRedirect("bookings.jsp?error=All required fields must be filled.");
                return;
            }

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String query;
                    if ("edit".equals(action)) {
                        // Update existing booking
                        query = "UPDATE Bookings SET CustomerID=?, CarID=?, PickupLocation=?, Destination=?, BookingDate=?, Status=? WHERE BookingID=?";
                    } else {
                        // Insert new booking
                        query = "INSERT INTO Bookings (CustomerID, CarID, PickupLocation, Destination, BookingDate, Status) VALUES (?, ?, ?, ?, ?, ?)";
                    }

                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(customerId));
                        stmt.setInt(2, Integer.parseInt(carId));
                        stmt.setString(3, pickupLocation);
                        stmt.setString(4, destination);
                        stmt.setString(5, bookingDate + " " + bookingTime); // Combine date and time
                        stmt.setString(6, status);

                        if ("edit".equals(action)) {
                            stmt.setInt(7, Integer.parseInt(bookingId)); // Set BookingID for update
                        }

                        int rowsAffected = stmt.executeUpdate();
                        if (rowsAffected > 0) {
                            response.sendRedirect("bookings.jsp?success=Booking " + ("edit".equals(action) ? "updated" : "added") + " successfully.");
                        } else {
                            response.sendRedirect("bookings.jsp?error=Failed to " + ("edit".equals(action) ? "update" : "add") + " booking.");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("bookings.jsp?error=Database error! Please try again.");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String bookingId = request.getParameter("BookingID");

        if ("delete".equals(action)) {
            deleteBooking(request, response, bookingId);
        }
    }

    private void deleteBooking(HttpServletRequest request, HttpServletResponse response, String bookingId)
            throws IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String query = "DELETE FROM Bookings WHERE BookingID=?";
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setInt(1, Integer.parseInt(bookingId));
                    int rowsDeleted = stmt.executeUpdate();
                    if (rowsDeleted > 0) {
                        response.sendRedirect("bookings.jsp?success=Booking deleted successfully.");
                    } else {
                        response.sendRedirect("bookings.jsp?error=Failed to delete booking.");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bookings.jsp?error=Database error! Please try again.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles booking creation, editing, and deletion for Mega City Cab.";
    }
}