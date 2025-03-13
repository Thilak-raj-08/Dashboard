<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mega City Cab | Login & Register</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gradient-to-r from-blue-950 to-teal-800 flex justify-center items-center min-h-screen">

        <!-- Auth Container -->
        <div class="w-full max-w-md bg-white/10 backdrop-blur-lg shadow-lg rounded-xl p-6 relative">

            <!-- Header -->
            <div class="text-center mb-6">
                <h2 id="modal-title" class="text-white text-2xl font-bold">Login</h2><br>
                <p class="text-white text-sm">Welcome back to Mega City Cab!</p>
            </div>

            <!-- Login Form -->
            <form id="login-form" action="LoginServlet" method="POST" class="tab-content space-y-4">
                <div>
                    <label class="block text-white font-semibold mb-2">Username</label>
                    <input type="text" name="username" class="w-full px-4 py-2 bg-white/20 border border-gray-300 text-white rounded-md focus:outline-none focus:ring-2 focus:ring-yellow-400 placeholder-white/70" placeholder="Enter your Username">
                </div>

                <div>
                    <label class="block text-white font-semibold mb-2">Password</label>
                    <input type="password" name="password" class="w-full px-4 py-2 bg-white/20 border border-gray-300 text-white rounded-md focus:outline-none focus:ring-2 focus:ring-yellow-400 placeholder-white/70" placeholder="Enter your password">
                </div>

                <div class="flex justify-between text-sm text-gray-300">
                    <label class="flex items-center">
                        <input type="checkbox" class="mr-2"> Remember me
                    </label>
                </div>

                <button class="w-full shadow-lg hover:bg-white bg-transparent border-2 border-white py-2 mt-4 rounded-full text-white hover:text-blue-950 transition duration-300">Login</button>

            </form>
        </div>
        
        
     <!-- Toast Notifications -->
    <div class="fixed top-4 right-4 space-y-2 z-[9999]">
        <% if (request.getParameter("success") != null) { %>
        <div class="toast flex items-center px-4 py-2 rounded-md text-white bg-green-500 animate-slide-in">
            <i class="ri-checkbox-circle-fill mr-2"></i>
            <%= request.getParameter("success") %>
            <button onclick="this.parentElement.remove()" class="ml-4">
                <i class="ri-close-line"></i>
            </button>
        </div>
        <% } %>
        
        <% if (request.getParameter("error") != null) { %>
        <div class="toast flex items-center px-4 py-2 rounded-md text-white bg-red-500 animate-slide-in">
            <i class="ri-error-warning-fill mr-2"></i>
            <%= request.getParameter("error") %>
            <button onclick="this.parentElement.remove()" class="ml-4">
                <i class="ri-close-line"></i>
            </button>
        </div>
        <% } %>
    </div>

    <!-- Existing sidebar and content -->

    <style>
        .animate-slide-in {
            animation: slideIn 0.3s ease-out forwards;
        }
        
        @keyframes slideIn {
            from { transform: translateX(100%); }
            to { transform: translateX(0); }
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
