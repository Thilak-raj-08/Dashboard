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

@WebServlet(name = "BillingServlet", urlPatterns = {"/BillingServlet"})
public class BillingServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String billId = request.getParameter("BillID");

        if ("delete".equals(action)) {
            deleteBill(request, response, billId);
        } else {
            String bookingId = request.getParameter("BookingID");
            String totalAmount = request.getParameter("TotalAmount");
            String tax = request.getParameter("Tax");
            String discount = request.getParameter("Discount");
            String finalAmount = request.getParameter("FinalAmount");
            String paymentStatus = request.getParameter("PaymentStatus");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                    String query;
                    if ("edit".equals(action)) {
                        query = "UPDATE Bills SET BookingID=?, TotalAmount=?, Tax=?, Discount=?, FinalAmount=?, PaymentStatus=? WHERE BillID=?";
                    } else {
                        query = "INSERT INTO Bills (BookingID, TotalAmount, Tax, Discount, FinalAmount, PaymentStatus) VALUES (?, ?, ?, ?, ?, ?)";
                    }

                    try (PreparedStatement stmt = conn.prepareStatement(query)) {
                        stmt.setInt(1, Integer.parseInt(bookingId));
                        stmt.setDouble(2, Double.parseDouble(totalAmount));
                        stmt.setDouble(3, Double.parseDouble(tax));
                        stmt.setDouble(4, Double.parseDouble(discount));
                        stmt.setDouble(5, Double.parseDouble(finalAmount));
                        stmt.setString(6, paymentStatus);

                        if ("edit".equals(action)) {
                            stmt.setInt(7, Integer.parseInt(billId));
                        }

                        int rowsAffected = stmt.executeUpdate();
                        if (rowsAffected > 0) {
                            response.sendRedirect("billing.jsp?success=Bill " + ("edit".equals(action) ? "updated" : "added") + " successfully.");
                        } else {
                            response.sendRedirect("billing.jsp?error=Failed to " + ("edit".equals(action) ? "update" : "add") + " bill.");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("billing.jsp?error=Database error! Please try again.");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String billId = request.getParameter("BillID");

        if ("delete".equals(action)) {
            deleteBill(request, response, billId);
        }
    }

    private void deleteBill(HttpServletRequest request, HttpServletResponse response, String billId)
            throws IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String query = "DELETE FROM Bills WHERE BillID=?";
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setInt(1, Integer.parseInt(billId));
                    int rowsDeleted = stmt.executeUpdate();
                    if (rowsDeleted > 0) {
                        response.sendRedirect("billing.jsp?success=Bill deleted successfully.");
                    } else {
                        response.sendRedirect("billing.jsp?error=Failed to delete bill.");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("billing.jsp?error=Database error! Please try again.");
        }
    }
}