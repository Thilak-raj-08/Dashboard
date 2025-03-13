<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Mega City Cab</title>
        <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5tUOI4AyuO-vpChKnt41AW1I8NKAOKEY&libraries=places"></script>
        <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
        <script src="https://unpkg.com/leaflet.gridlayer.googlemutant@latest/dist/Leaflet.GoogleMutant.js"></script>
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
                <li class="mb-1 group active">
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
                <li class="mb-1 group">
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

        <!-- start: Main -->
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
                    <li class="text-gray-600 mr-2 font-medium">Bookings</li>
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

            <%@ page import="java.sql.*" %>
            <%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
            <%@ page contentType="text/html;charset=UTF-8" language="java" %>

            <div class="p-6">
                <div class="bg-white border border-gray-100 shadow-md shadow-black/5 p-6 rounded-md">
                    <div class="flex justify-between mb-4 items-start">
                        <div class="font-medium text-xl">Booking List</div>
                        <button onclick="toggleModal('add')" class="bg-gray-900 text-white px-4 py-2 rounded text-sm hover:bg-gray-800 transition-colors">
                            Add New Booking
                        </button>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="min-w-full bg-white">
                            <thead>
                                <tr style="background-color: #111827;" class="text-white">
                                    <th class="py-3 px-6 text-left text-sm">Booking ID</th>
                                    <th class="py-3 px-6 text-left text-sm">Customer</th>
                                    <th class="py-3 px-6 text-left text-sm">Car</th>
                                    <th class="py-3 px-6 text-left text-sm">Pickup Location</th>
                                    <th class="py-3 px-6 text-left text-sm">Destination</th>
                                    <th class="py-3 px-6 text-left text-sm">Booking Date</th>
                                    <th class="py-3 px-6 text-left text-sm">Status</th>
                                    <th class="py-3 px-6 text-left text-sm">Actions</th>
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
                                        String query = "SELECT * FROM Bookings";
                                        stmt = conn.prepareStatement(query);
                                        rs = stmt.executeQuery();

                                        while (rs.next()) {
                                %>
                                <tr class="border-b">
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("BookingID")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("CustomerID")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("CarID")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("PickupLocation")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("Destination")%></td>
                                    <td class="py-3 px-6 text-sm"><%= rs.getString("BookingDate")%></td>
                                    <td class="py-3 px-6 text-sm">
                                        <span class="px-3 py-1 rounded-full text-sm font-medium 
                                              <%= rs.getString("Status").equals("Pending") ? "bg-yellow-100 text-yellow-800"
                                                      : rs.getString("Status").equals("Completed") ? "bg-green-100 text-green-800"
                                                      : rs.getString("Status").equals("Cancelled") ? "bg-red-100 text-red-800" : ""%>">
                                            <%= rs.getString("Status")%>
                                        </span>
                                    </td>
                                    <td class="py-3 px-6 text-2xl">
                                        <i class="ri-edit-box-line hover:text-gray-600 cursor-pointer" onclick="editBookings('<%= rs.getInt("BookingID")%>', '<%= rs.getString("CustomerID")%>', '<%= rs.getString("CarID")%>', '<%= rs.getString("PickupLocation")%>', '<%= rs.getString("Destination")%>', '<%= rs.getString("BookingDate")%>', '<%= rs.getString("Status")%>')"></i>
                                        <i class="ri-delete-bin-line text-red-600 hover:text-red-800 cursor-pointer ml-2" onclick="deleteBookings('<%= rs.getInt("BookingID")%>')"></i>
                                    </td>

                                </tr>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        if (rs != null) {
                                            rs.close();
                                        }
                                        if (stmt != null) {
                                            stmt.close();
                                        }
                                        if (conn != null) {
                                            conn.close();
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </main>


        <!-- Booking Modal -->
        <div id="bookingModal" class="hidden fixed inset-0 z-50 overflow-y-auto">
            <div class="fixed inset-0 bg-black/50 backdrop-blur-sm"></div>
            <div class="flex min-h-screen items-center justify-center p-4">
                <div class="relative w-full max-w-2xl bg-white rounded-lg shadow-xl">
                    <div class="flex items-center justify-between p-4 border-b border-gray-200">
                        <h3 class="text-xl font-semibold text-gray-900" id="modalTitle">New Booking</h3>
                        <button onclick="toggleModal('close')" class="text-gray-400 hover:text-gray-600">
                            <i class="ri-close-line text-2xl"></i>
                        </button>
                    </div>

                    <form method="POST" action="BookingServlet" class="p-6 space-y-6">
                        <input type="hidden" name="action" id="action" value="add">
                        <input type="hidden" name="BookingID" id="BookingID">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <!-- Customer Dropdown -->
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">
                                    <i class="ri-user-line mr-2"></i>Customer
                                </label>
                                <select name="CustomerID" id="CustomerID" required
                                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                                    <option value="">Select Customer</option>
                                    <%
                                        Connection connCustomers = null;
                                        PreparedStatement pstmtCustomers = null;
                                        ResultSet rsCustomers = null;
                                        try {
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            connCustomers = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                                            String customerQuery = "SELECT CustomerID, FullName FROM Customers";
                                            pstmtCustomers = connCustomers.prepareStatement(customerQuery);
                                            rsCustomers = pstmtCustomers.executeQuery();
                                            while (rsCustomers.next()) {
                                    %>
                                    <option value="<%= rsCustomers.getInt("CustomerID")%>">
                                        <%= rsCustomers.getString("FullName")%>
                                    </option>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        } finally {
                                            if (rsCustomers != null) {
                                                rsCustomers.close();
                                            }
                                            if (pstmtCustomers != null) {
                                                pstmtCustomers.close();
                                            }
                                            if (connCustomers != null) {
                                                connCustomers.close();
                                            }
                                        }
                                    %>
                                </select>
                            </div>

                            <!-- Car Dropdown -->
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">
                                    <i class="ri-car-line mr-2"></i>Car
                                </label>
                                <select name="CarID" id="CarID" required
                                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                                    <option value="">Select Car</option>
                                    <%
                                        Connection connCars = null;
                                        PreparedStatement pstmtCars = null;
                                        ResultSet rsCars = null;
                                        try {
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            connCars = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                                            String carQuery = "SELECT CarID, CarModel FROM Cars";
                                            pstmtCars = connCars.prepareStatement(carQuery);
                                            rsCars = pstmtCars.executeQuery();
                                            while (rsCars.next()) {
                                    %>
                                    <option value="<%= rsCars.getInt("CarID")%>">
                                        <%= rsCars.getString("CarModel")%>
                                    </option>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        } finally {
                                            if (rsCars != null) {
                                                rsCars.close();
                                            }
                                            if (pstmtCars != null) {
                                                pstmtCars.close();
                                            }
                                            if (connCars != null) {
                                                connCars.close();
                                            }
                                        }
                                    %>
                                </select>
                            </div>

                            <!-- Pickup Location -->
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">
                                    <i class="ri-map-pin-line mr-2"></i>Pickup Location
                                </label>
                                <div id="pickupMap" class="w-full h-56 md:h-64 lg:h-72 bg-gray-200 rounded-lg hidden"></div>
                                <input type="text" name="PickupLocation" id="pickupSearch" placeholder="Search pickup location" required
                                       class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500 mt-2">
                            </div>

                            <!-- Destination -->
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">
                                    <i class="ri-flag-line mr-2"></i>Destination
                                </label>
                                <div id="destinationMap" class="w-full h-56 md:h-64 lg:h-72 bg-gray-200 rounded-lg hidden"></div>
                                <input type="text" name="Destination" id="destinationSearch" placeholder="Search destination" required
                                       class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500 mt-2">
                            </div>

                            <!-- Booking Date & Time -->
                            <div class="grid grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        <i class="ri-calendar-line mr-2"></i>Date
                                    </label>
                                    <input type="date" name="BookingDate" id="BookingDate" required
                                           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                                </div>
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2">
                                        <i class="ri-time-line mr-2"></i>Time
                                    </label>
                                    <input type="time" name="BookingTime" id="BookingTime" required
                                           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                                </div>
                            </div>

                            <!-- Status -->
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">
                                    <i class="ri-checkbox-circle-line mr-2"></i>Status
                                </label>
                                <select name="Status" id="Status" required
                                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-gray-500">
                                    <option value="Pending">Pending</option>
                                    <option value="Completed">Completed</option>
                                    <option value="Cancelled">Cancelled</option>
                                </select>
                            </div>
                        </div>
                        <!-- Display Results -->
                        <div class=" text-center mt-4">
                            <p class="text-gray-700">Pickup: <span id="pickupName" class="font-semibold">Not set</span></p>
                            <p class="text-gray-700">Destination: <span id="destinationName" class="font-semibold">Not set</span></p>
                            <h2 id="result" class="text-xl font-bold mt-4"></h2>
                        </div>
                        <div class="flex justify-end space-x-3 border-t border-gray-200 pt-6">
                            <button type="button" onclick="toggleModal('close')"
                                    class="px-4 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-md">
                                Cancel
                            </button>
                         
                            <button type="submit" onclick="calculateFare()"
                                    class="px-4 py-2 text-white bg-gray-900 hover:bg-gray-800 rounded-md">
                                Save Booking
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function toggleModal(action) {
                const modal = document.getElementById('bookingModal');
                if (action === 'close') {
                    modal.classList.add('hidden');
                } else {
                    modal.classList.toggle('hidden');
                    if (action === 'add') {
                        document.getElementById('modalTitle').innerText = 'New Booking';
                        document.getElementById('action').value = 'add';
                        document.getElementById('BookingID').value = '';
                        document.getElementById('CustomerID').value = '';
                        document.getElementById('CarID').value = '';
                        document.getElementById('PickupLocation').value = '';
                        document.getElementById('Destination').value = '';
                        document.getElementById('BookingDate').value = '';
                        document.getElementById('BookingTime').value = '';
                        document.getElementById('Status').value = 'Pending';
                    }
                }
            }

            function editBookings(bookingId, customerId, carId, pickupLocation, destination, bookingDate, status) {
                toggleModal('edit');
                document.getElementById('modalTitle').innerText = 'Edit Booking';
                document.getElementById('action').value = 'edit';
                document.getElementById('BookingID').value = bookingId;
                document.getElementById('CustomerID').value = customerId;
                document.getElementById('CarID').value = carId;
                document.getElementById('PickupLocation').value = pickupLocation;
                document.getElementById('Destination').value = destination;
                document.getElementById('BookingDate').value = bookingDate.split(' ')[0];
                document.getElementById('BookingTime').value = bookingDate.split(' ')[1];
                document.getElementById('Status').value = status;
            }

            function deleteBookings(BookingID) {
                if (confirm('Are you sure you want to delete this booking?')) {
                    window.location.href = 'BookingServlet?action=delete&BookingID=' + BookingID;
                }
            }
        </script>
        <script src="js/script.js"></script>
        <script src="js/map.js"></script>
        <!-- Toast Notifications -->
        <div class="fixed top-4 right-4 space-y-2 z-[9999]">
            <% if (request.getParameter("success") != null) {%>
            <div class="toast flex items-center px-4 py-2 rounded-md text-white bg-green-500 animate-slide-in">
                <i class="ri-checkbox-circle-fill mr-2"></i>
                <%= request.getParameter("success")%>
                <button onclick="this.parentElement.remove()" class="ml-4">
                    <i class="ri-close-line"></i>
                </button>
            </div>
            <% } %>

            <% if (request.getParameter("error") != null) {%>
            <div class="toast flex items-center px-4 py-2 rounded-md text-white bg-red-500 animate-slide-in">
                <i class="ri-error-warning-fill mr-2"></i>
                <%= request.getParameter("error")%>
                <button onclick="this.parentElement.remove()" class="ml-4">
                    <i class="ri-close-line"></i>
                </button>
            </div>
            <% }%>
        </div>

        <!-- Existing sidebar and content -->

        <style>
            .animate-slide-in {
                animation: slideIn 0.3s ease-out forwards;
            }

            @keyframes slideIn {
                from {
                    transform: translateX(100%);
                }
                to {
                    transform: translateX(0);
                }
            }
        </style>

        <script>
            // Auto-remove toasts after 5 seconds
            document.addEventListener('DOMContentLoaded', () => {
                document.querySelectorAll('.toast').forEach(toast => {
                    setTimeout(() => {
                        toast.style.transform = 'translateX(100%)';
                        setTimeout(() => toast.remove(), 300);
                    }, 5000);
                });
            });
        </script>
    </body>

</html>