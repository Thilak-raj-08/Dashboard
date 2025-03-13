<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Reports - Mega City Cab</title>
</head>
<body class="text-gray-800 font-inter">
    <!-- start: Sidebar -->
    <div class="fixed left-0 top-0 w-64 h-full bg-gray-900 p-4 z-50 sidebar-menu transition-transform">
        <a href="#" class="flex items-center pb-4 border-b border-b-gray-800">
                <img src="images/WhatsApp Image 2025-02-10 at 17.49.10_a246eb1e.jpg" alt="" class="w-8 h-8 rounded object-cover">
                <span class="text-lg font-bold text-white ml-3">Mega City Cab</span>
            </a>
        <ul class="mt-4">
            <li class="mb-1 group">
                <a href="dashboard.jsp"
                   class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                    <i class="ri-home-2-line mr-3 text-lg"></i>
                    <span class="text-sm">Home</span>
                </a>
            </li>
            <li class="mb-1 group ">
                <a href="bookings.jsp"
                   class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100 ">
                    <i class="ri-taxi-line mr-3 text-lg"></i>
                    <span class="text-sm">Bookings</span>
                </a>
            </li>
            <li class="mb-1 group ">
                <a href="customers.jsp"
                   class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100 ">
                    <i class="ri-user-6-line mr-3 text-lg"></i>
                    <span class="text-sm">Customers</span>
                </a>
            </li>
            <li class="mb-1 group">
                <a href="drivers.jsp"
                   class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                    <i class="ri-steering-2-line mr-3 text-lg"></i>
                    <span class="text-sm">Drivers</span>
                </a>
            </li>
            <li class="mb-1 group">
                <a href="billing.jsp"
                   class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                    <i class="ri-money-dollar-circle-line mr-3 text-lg"></i>
                    <span class="text-sm">Billing</span>
                </a>
            </li>
            <li class="mb-1 group active">
                <a href="reports.jsp"
                   class="flex items-center py-2 px-4 text-gray-300 hover:bg-gray-950 hover:text-gray-100 rounded-md group-[.active]:bg-gray-800 group-[.active]:text-white group-[.selected]:bg-gray-950 group-[.selected]:text-gray-100">
                    <i class="ri-file-chart-line mr-3 text-lg"></i>
                    <span class="text-sm">Reports</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="fixed top-0 left-0 w-full h-full bg-black/50 z-40 md:hidden sidebar-overlay"></div>
    <!-- end: Sidebar -->
    <main class="w-full md:w-[calc(100%-256px)] md:ml-64 bg-gray-50 min-h-screen transition-all main">
        <div class="py-2 px-6 bg-white flex items-center shadow-md shadow-black/5 sticky top-0 left-0 z-30">
            <button type="button" class="text-lg text-gray-600 sidebar-toggle">
                <i class="ri-menu-line"></i>
            </button>
            <ul class="flex items-center text-sm ml-4">
                <li class="mr-2">
                    <a href="#" class="text-gray-400 hover:text-gray-600 font-medium">MCC Dashboard</a>
                </li>
                <li class="text-gray-600 mr-2 font-medium">/</li>
                <li class="text-gray-600 mr-2 font-medium">Reports</li>
            </ul>
            <ul class="ml-auto flex items-center text-sm">
                    <li class="mr-2 text-gray-600 font-sm">
                        Welcome, Admin
                    </li>
                    <li class="mr-1">
                        <a href="LogoutServlet">
                            <button type="button"
                                    class="text-gray-400 w-8 h-8 rounded flex items-center justify-center hover:bg-gray-50 hover:text-gray-600">
                                <i class="ri-logout-circle-r-line"></i>
                            </button>
                        </a>
                    </li>
                </ul>
        </div>

        <div class="p-6">
            <div class="bg-white border border-gray-100 shadow-md shadow-black/5 p-6 rounded-md">
                <div class="flex justify-between mb-4 items-start">
                    <div class="font-medium text-xl">Reports</div>
                </div>

                <!-- Booking Reports -->
                <div class="mb-8">
                    <h3 class="text-lg font-semibold mb-4">Booking Reports</h3>
                    <div class="overflow-x-auto">
                        <table class="min-w-full bg-white">
                            <thead>
                                <tr style="background-color: #111827;" class="text-white">
                                    <th class="py-3 px-6 text-left text-sm">Booking ID</th>
                                    <th class="py-3 px-6 text-left text-sm">Customer Name</th>
                                    <th class="py-3 px-6 text-left text-sm">Car Model</th>
                                    <th class="py-3 px-6 text-left text-sm">Pickup Location</th>
                                    <th class="py-3 px-6 text-left text-sm">Destination</th>
                                    <th class="py-3 px-6 text-left text-sm">Booking Date</th>
                                    <th class="py-3 px-6 text-left text-sm">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String dbURL = "jdbc:mysql://localhost:3306/megacitycab";
                                    String dbUser = "root";
                                    String dbPassword = "root";
                                    Connection conn = null;
                                    PreparedStatement stmt = null;
                                    ResultSet rs = null;

                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                                        String query = "SELECT Bookings.*, Customers.FullName AS CustomerName, Cars.CarModel " +
                                                       "FROM Bookings " +
                                                       "JOIN Customers ON Bookings.CustomerID = Customers.CustomerID " +
                                                       "JOIN Cars ON Bookings.CarID = Cars.CarID";
                                        stmt = conn.prepareStatement(query);
                                        rs = stmt.executeQuery();

                                        while (rs.next()) {
                                %>
                                <tr class="border-b">
                                    <td class="py-3 px-6 text-sm"><%= rs.getInt("BookingID") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("CustomerName") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("CarModel") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("PickupLocation") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("Destination") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getTimestamp("BookingDate") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("Status") %></td>
                                </tr>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        if (rs != null) rs.close();
                                        if (stmt != null) stmt.close();
                                        if (conn != null) conn.close();
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Billing Reports -->
                <div class="mb-8">
                    <h3 class="text-lg font-semibold mb-4">Billing Reports</h3>
                    <div class="overflow-x-auto">
                        <table class="min-w-full bg-white">
                            <thead>
                                <tr style="background-color: #111827;" class="text-white">
                                    <th class="py-3 px-6 text-left text-sm">Bill ID</th>
                                    <th class="py-3 px-6 text-left text-sm">Booking ID</th>
                                    <th class="py-3 px-6 text-left text-sm">Total Amount</th>
                                    <th class="py-3 px-6 text-left text-sm">Tax</th>
                                    <th class="py-3 px-6 text-left text-sm">Discount</th>
                                    <th class="py-3 px-6 text-left text-sm">Final Amount</th>
                                    <th class="py-3 px-6 text-left text-sm">Payment Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                                        String query = "SELECT * FROM Bills";
                                        stmt = conn.prepareStatement(query);
                                        rs = stmt.executeQuery();

                                        while (rs.next()) {
                                %>
                                <tr class="border-b">
                                    <td class="py-3 px-6 text-sm"><%= rs.getInt("BillID") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getInt("BookingID") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getDouble("TotalAmount") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getDouble("Tax") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getDouble("Discount") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getDouble("FinalAmount") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("PaymentStatus") %></td>
                                </tr>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        if (rs != null) rs.close();
                                        if (stmt != null) stmt.close();
                                        if (conn != null) conn.close();
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Driver Reports -->
                <div class="mb-8">
                    <h3 class="text-lg font-semibold mb-4">Driver Reports</h3>
                    <div class="overflow-x-auto">
                        <table class="min-w-full bg-white">
                            <thead>
                                <tr style="background-color: #111827;" class="text-white">
                                    <th class="py-3 px-6 text-left text-sm">Driver ID</th>
                                    <th class="py-3 px-6 text-left text-sm">Full Name</th>
                                    <th class="py-3 px-6 text-left text-sm">License Number</th>
                                    <th class="py-3 px-6 text-left text-sm">Phone Number</th>
                                    <th class="py-3 px-6 text-left text-sm">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                                        String query = "SELECT * FROM Drivers";
                                        stmt = conn.prepareStatement(query);
                                        rs = stmt.executeQuery();

                                        while (rs.next()) {
                                %>
                                <tr class="border-b">
                                    <td class="py-3 px-6 text-sm"><%= rs.getInt("DriverID") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("FullName") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("LicenseNumber") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("PhoneNumber") %></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("Status") %></td>
                                </tr>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        if (rs != null) rs.close();
                                        if (stmt != null) stmt.close();
                                        if (conn != null) conn.close();
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
                             <script src="js/script.js"></script>
</body>
</html>