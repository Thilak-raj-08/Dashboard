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

@WebServlet(name = "CustomerServlet", urlPatterns = {"/CustomerServlet"})
public class CustomerServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action"); // Determine the action (add, edit, delete)
        String customerId = request.getParameter("customerId"); // For edit and delete

        if ("delete".equals(action)) {
            // Handle delete action
            deleteCustomer(request, response, customerId);
        } else {
            // Handle add or edit action
            String regNumber = request.getParameter("regNumber");
            String nic = request.getParameter("nic");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            if (regNumber == null || nic == null || fullName == null || phone == null ||
                regNumber.isEmpty() || nic.isEmpty() || fullName.isEmpty() || phone.isEmpty()) {
                response.sendRedirect("customers.jsp?error=All required fields must be filled.");
                return;
            }

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String query;
                    if ("edit".equals(action)) {
                        // Update existing customer
                        query = "UPDATE Customers SET RegistrationNumber=?, NIC=?, FullName=?, PhoneNumber=?, Email=?, Address=? WHERE CustomerID=?";
                    } else {
                        // Insert new customer
                        query = "INSERT INTO Customers (RegistrationNumber, NIC, FullName, PhoneNumber, Email, Address) VALUES (?, ?, ?, ?, ?, ?)";
                    }

                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setString(1, regNumber);
                        stmt.setString(2, nic);
                        stmt.setString(3, fullName);
                        stmt.setString(4, phone);
                        stmt.setString(5, email);
                        stmt.setString(6, address);

                        if ("edit".equals(action)) {
                            stmt.setInt(7, Integer.parseInt(customerId)); // Set CustomerID for update
                        }

                        int rowsAffected = stmt.executeUpdate();
                        if (rowsAffected > 0) {
                            response.sendRedirect("customers.jsp?success=Customer " + ("edit".equals(action) ? "updated" : "added") + " successfully.");
                        } else {
                            response.sendRedirect("customers.jsp?error=Failed to " + ("edit".equals(action) ? "update" : "add") + " customer.");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("customers.jsp?error=Database error! Please try again.");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String customerId = request.getParameter("customerId");

        if ("delete".equals(action)) {
            deleteCustomer(request, response, customerId);
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response, String customerId)
            throws IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String query = "DELETE FROM Customers WHERE CustomerID=?";
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setInt(1, Integer.parseInt(customerId));
                    int rowsDeleted = stmt.executeUpdate();
                    if (rowsDeleted > 0) {
                        response.sendRedirect("customers.jsp?success=Customer deleted successfully.");
                    } else {
                        response.sendRedirect("customers.jsp?error=Failed to delete customer.");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("customers.jsp?error=Database error! Please try again.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles customer registration, editing, and deletion for Mega City Cab.";
    }
}