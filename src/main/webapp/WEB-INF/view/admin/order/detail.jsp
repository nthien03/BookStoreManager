<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <!-- Required Meta Tags Always Come First -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <!-- Title -->
            <title>Order Detail</title>

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
                    <!-- Page Header -->
                    <div class="page-header d-print-none">
                        <div class="row align-items-center">
                            <div class="col-sm mb-2 mb-sm-0">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb breadcrumb-no-gutter">
                                        <li class="breadcrumb-item"><a class="breadcrumb-link"
                                                href="ecommerce-orders.html">Quản lý đơn hàng</a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">Chi tiết đơn hàng</li>
                                    </ol>
                                </nav>

                                <div class="d-sm-flex align-items-sm-center">
                                    <h1 class="page-header-title">Đơn hàng ${order.orderCode}</h1>
                                    <c:choose>
                                        <c:when test="${order.orderType=='Chưa thanh toán'}">
                                            <span class="badge badge-soft-warning ml-sm-3">
                                                <span class="legend-indicator bg-warning"></span>Chưa thanh toán
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-soft-success ml-sm-3">
                                                <span class="legend-indicator bg-success"></span>${order.orderType}
                                            </span>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${order.status=='Chờ xử lý'}">
                                            <span class="badge badge-soft-warning ml-sm-3">
                                                <span class="legend-indicator bg-warning"></span>Chờ xử lý
                                            </span>
                                        </c:when>
                                        <c:when test="${order.status=='Đang xử lý'}">
                                            <span class="badge badge-soft-primary ml-sm-3">
                                                <span class="legend-indicator bg-primary"></span>Đang xử lý
                                            </span>
                                        </c:when>
                                        <c:when test="${order.status=='Đang giao hàng'}">
                                            <span class="badge badge-soft-info ml-sm-3">
                                                <span class="legend-indicator bg-info"></span>Đang giao hàng
                                            </span>
                                        </c:when>
                                        <c:when test="${order.status=='Đã hoàn thành'}">
                                            <span class="badge badge-soft-success ml-sm-3">
                                                <span class="legend-indicator bg-success"></span>Đã hoàn thành
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-soft-dark ml-sm-3">
                                                <span class="legend-indicator bg-dark"></span>${order.status}
                                            </span>
                                        </c:otherwise>
                                    </c:choose>


                                    <span class="ml-2 ml-sm-3">
                                        <i class="tio-date-range"></i> ${order.orderTime}
                                    </span>
                                </div>

                            </div>

                        </div>
                    </div>
                    <!-- End Page Header -->

                    <div class="row">
                        <div class="col-lg-8 mb-3 mb-lg-0">
                            <!-- Card -->
                            <div class="card mb-3 mb-lg-5">
                                <!-- Header -->
                                <div class="card-header">
                                    <h4 class="card-header-title">Chi tiết đơn hàng</h4>
                                </div>
                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body">
                                    <!-- Media -->
                                    <c:forEach var="orderDetail" items="${order.orderDetails}">
                                        <div class="media">
                                            <div class="avatar avatar-xl mr-3">
                                                <img class="img-fluid" src="/images/book/${orderDetail.book.image}"
                                                    alt="Image Description">
                                            </div>

                                            <div class="media-body">
                                                <div class="row">
                                                    <div class="col-md-6 mb-3 mb-md-0">
                                                        <a class="h5 d-block"
                                                            href="/admin/book/${orderDetail.book.id}">${orderDetail.book.name}</a>
                                                    </div>

                                                    <div class="col col-md-2 align-self-center">
                                                        <h5>${orderDetail.book.salePrice}</h5>
                                                    </div>

                                                    <div class="col col-md-2 align-self-center">
                                                        <h5>${orderDetail.quantity}</h5>
                                                    </div>

                                                    <div class="col col-md-2 align-self-center text-right">
                                                        <h5>${orderDetail.quantity * orderDetail.book.salePrice}</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                    </c:forEach>
                                    <!-- End Media -->
                                    <div class="row justify-content-md-end mb-3">
                                        <div class="col-md-8 col-lg-7">
                                            <dl class="row text-sm-right">
                                                <dt class="col-sm-6">Tổng tiền:</dt>
                                                <dd class="col-sm-6">${order.totalPrice}</dd>

                                            </dl>
                                            <!-- End Row -->
                                        </div>
                                    </div>
                                    <!-- End Row -->
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->
                        </div>

                        <div class="col-lg-4 mb-3 mb-lg-0">
                            <!-- Card -->
                            <div class="card mb-3 mb-lg-5">
                                <!-- Header -->
                                <div class="card-header">
                                    <h4 class="card-header-title">Thông tin khách hàng</h4>
                                </div>
                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body">

                                    <div class="d-flex justify-content-between align-items-center">
                                        <h5>Họ tên</h5>
                                    </div>
                                    <span class="d-block">
                                        ${order.account.fullName}
                                    </span>

                                    <hr>

                                    <div class="d-flex justify-content-between align-items-center">
                                        <h5>Số điện thoại</h5>
                                    </div>
                                    <span class="d-block">
                                        ${order.account.phoneNumber}
                                    </span>

                                    <hr>

                                    <div class="d-flex justify-content-between align-items-center">
                                        <h5>Địa chỉ</h5>
                                    </div>
                                    <span class="d-block">
                                        ${order.account.address}
                                    </span>

                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->
                        </div>
                    </div>
                    <!-- End Row -->
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
                if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="../assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
            </script>
        </body>

        </html>