<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <!-- Required Meta Tags Always Come First -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <!-- Title -->
            <title>Book Manager</title>

            <!-- Favicon -->
            <link rel="shortcut icon" href="..\favicon.ico">

            <!-- Font -->
            <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">

            <!-- CSS Implementing Plugins -->
            <link rel="stylesheet" href="..\assets\css\vendor.min.css">
            <link rel="stylesheet" href="..\assets\vendor\icon-set\style.css">

            <!-- CSS Front Template -->
            <link rel="stylesheet" href="..\assets\css\theme.min.css?v=1.0">
        </head>

        <body class="has-navbar-vertical-aside navbar-vertical-aside-show-xl">


            <!-- ========== HEADER ========== -->
            <jsp:include page="../layout/header.jsp" />
            <!-- ========== END HEADER ========== -->

            <!-- ========== MAIN CONTENT ========== -->
            <!-- Navbar Vertical -->
            <jsp:include page="../layout/sidebar.jsp" />
            <!-- End Navbar Vertical -->

            <main id="content" role="main" class="main">
                <!-- Content -->
                <div class="content container-fluid">
                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="row align-items-center mb-3">
                            <a class="btn btn-primary" href="/admin/book/create">Thêm mới sách</a>
                        </div>
                        <!-- End Row -->

                        <!-- Nav Scroller -->

                        <!-- End Nav Scroller -->
                    </div>
                    <!-- End Page Header -->
                    <!-- Hiển thị thông báo nếu có -->


                </div>
                <!-- End Content -->

                <!-- Footer -->
                <jsp:include page="../layout/footer.jsp" />
                <!-- End Footer -->
            </main>

            <!-- JS Implementing Plugins -->
            <script src="..\assets\js\vendor.min.js"></script>

            <!-- JS Front -->
            <script src="..\assets\js\theme.min.js"></script>

            <!-- JS Plugins Init. -->
            <script>
                $(document).on('ready', function () {
                    // INITIALIZATION OF NAVBAR VERTICAL NAVIGATION
                    // =======================================================
                    var sidebar = $('.js-navbar-vertical-aside').hsSideNav();


                    // INITIALIZATION OF TOOLTIP IN NAVBAR VERTICAL MENU
                    // =======================================================
                    $('.js-nav-tooltip-link').tooltip({ boundary: 'window' })

                    $(".js-nav-tooltip-link").on("show.bs.tooltip", function (e) {
                        if (!$("body").hasClass("navbar-vertical-aside-mini-mode")) {
                            return false;
                        }
                    });


                    // INITIALIZATION OF UNFOLD
                    // =======================================================
                    $('.js-hs-unfold-invoker').each(function () {
                        var unfold = new HSUnfold($(this)).init();
                    });


                    // INITIALIZATION OF FORM SEARCH
                    // =======================================================
                    $('.js-form-search').each(function () {
                        new HSFormSearch($(this)).init()
                    });
                });
            </script>

            <!-- IE Support -->
            <script>
                if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="../assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
            </script>
        </body>

        </html>