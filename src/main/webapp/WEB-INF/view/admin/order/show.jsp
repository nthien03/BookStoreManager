<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <!-- Required Meta Tags Always Come First -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <!-- Title -->
            <title>Order Manager</title>

            <!-- Favicon -->
            <!-- <link rel="shortcut icon" href="..\favicon.ico"> -->

            <!-- Font -->
            <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">

            <!-- CSS Implementing Plugins -->
            <link rel="stylesheet" href="\assets\css\vendor.min.css">
            <link rel="stylesheet" href="\assets\vendor\icon-set\style.css">

            <!-- CSS Front Template -->
            <link rel="stylesheet" href="\assets\css\theme.min.css?v=1.0">
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
                    <div class="page-header">
                        <div class="row align-items-center mb-3">
                            <div class="col-sm mb-2 mb-sm-0">
                                <h1 class="page-header-title">Danh sách đơn hàng</h1>
                            </div>
                        </div>
                    </div>
                    <!-- Card -->
                    <div class="card">


                        <!-- Table -->
                        <div class="table-responsive datatable-custom">
                            <table class="table table-lg table-thead-bordered table-nowrap table-align-middle">
                                <thead class="thead-light">
                                    <tr>
                                        <th>Mã đơn hàng</th>
                                        <th>Khách hàng</th>
                                        <th>Thời gian đặt</th>
                                        <th>Tổng tiền</th>
                                        <th>Trạng thái thanh toán</th>
                                        <th>Trạng thái đơn</th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td>
                                                <a href="/admin/order/${order.id}">
                                                    <h5 class="text-hover-primary mb-0">${order.orderCode}</h5>
                                                </a>
                                            </td>
                                            <td>
                                                ${order.account.fullName}
                                            </td>
                                            <td>${order.orderTime}</td>
                                            <td>
                                                ${order.totalPrice}
                                            </td>
                                            <td>
                                                <form action="/admin/order/update/${order.id}" method="post"
                                                    class="media align-items-center">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <input type="hidden" name="id" value="${order.id}" />
                                                    <select class="custom-select custom-select-borderless"
                                                        name="orderType">
                                                        <option value="Chưa thanh toán"
                                                            ${order.orderType=='Chưa thanh toán' ? 'selected' : '' }>
                                                            Chưa thanh toán</option>
                                                        <option value="Đã thanh toán" ${order.orderType=='Đã thanh toán'
                                                            ? 'selected' : '' }>Đã thanh toán</option>
                                                    </select>
                                            </td>
                                            <td>
                                                <select name="status" class="custom-select custom-select-borderless">
                                                    <option value="Chờ xử lý" ${order.status=='Chờ xử lý' ? 'selected'
                                                        : '' }>Chờ xử lý</option>
                                                    <option value="Đang xử lý" ${order.status=='Đang xử lý' ? 'selected'
                                                        : '' }>Đang xử lý</option>
                                                    <option value="Đang giao hàng" ${order.status=='Đang giao hàng'
                                                        ? 'selected' : '' }>Đang giao hàng</option>
                                                    <option value="Đã hoàn thành" ${order.status=='Đã hoàn thành'
                                                        ? 'selected' : '' }>Đã hoàn thành</option>
                                                    <option value="Đã hủy" ${order.status=='Đã hủy' ? 'selected' : '' }>
                                                        Đã hủy</option>
                                                </select>

                                            </td>
                                            <td>
                                                <button type="submit" class="btn btn-primary btn-sm">Cập nhật</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <!-- End Table -->
                    </div>
                    <!-- End Card -->
                </div>

                <!-- End Content -->

                <!-- Footer -->
                <!-- <jsp:include page="../layout/footer.jsp" /> -->
                <!-- End Footer -->
            </main>

            <!-- JS Implementing Plugins -->
            <script src="\assets\js\vendor.min.js"></script>

            <!-- JS Front -->
            <script src="\assets\js\theme.min.js"></script>

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
                if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="/assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
            </script>
        </body>

        </html>