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
                    <div class="page-header">
                        <div class="row align-items-center mb-3">
                            <div class="col-sm mb-2 mb-sm-0">
                                <h1 class="page-header-title">Danh sách Sách</h1>
                            </div>

                            <div class="col-sm-auto">
                                <a class="btn btn-primary" href="/admin/book/create">Thêm mới sách</a>
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
                                        <th>Tên sách</th>
                                        <th>Tác giả</th>
                                        <th>Thể loại</th>
                                        <th>Số lượng</th>
                                        <th>Trạng thái</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="book" items="${books}">
                                        <tr>
                                            <td>
                                                <a class="media align-items-center" href="/admin/book/${book.id}">

                                                    <img class="avatar avatar-lg mr-3" src="/images/book/${book.image}"
                                                        alt="Image Description" onerror="this.src='/assets/img/400x400/img2.jpg'
                                                        ;">

                                                    <div class="media-body">
                                                        <h5 class="text-hover-primary mb-0">${book.name}
                                                        </h5>
                                                    </div>
                                                </a>
                                            </td>
                                            <td>
                                                ${book.author.name}
                                            </td>
                                            <td>${book.category.name}</td>
                                            <td>
                                                ${book.quantity}
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${book.isDisabled=='0'}">
                                                        <span class="legend-indicator bg-success"></span>Đang kinh doanh
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="legend-indicator bg-danger"></span> Ngừng kinh
                                                        doanh
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <div class="btn-group" role="group">
                                                    <a class="btn btn-sm btn-white" href="/admin/book/${book.id}">
                                                        <i class="tio-edit"></i> Sửa
                                                    </a>

                                                    <!-- <div class="hs-unfold btn-group">
                                                        <a class="js-hs-unfold-invoker btn btn-icon btn-sm btn-white dropdown-toggle dropdown-toggle-empty"
                                                            href="javascript:;" data-hs-unfold-options='{
                                                                             "target": "#productsEditDropdown1",
                                                                             "type": "css-animation",
                                                                             "smartPositionOffEl": "#datatable"
                                                                           }'></a>

                                                        <div id="productsEditDropdown1"
                                                            class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-right mt-1">
                                                            <a class="dropdown-item" href="#">
                                                                <i class="tio-delete-outlined dropdown-item-icon"></i>
                                                                Delete
                                                            </a>
                                                            <a class="dropdown-item" href="#">
                                                                <i class="tio-archive dropdown-item-icon"></i> Archive
                                                            </a>
                                                            <a class="dropdown-item" href="#">
                                                                <i class="tio-publish dropdown-item-icon"></i> Publish
                                                            </a>
                                                            <a class="dropdown-item" href="#">
                                                                <i class="tio-clear dropdown-item-icon"></i> Unpublish
                                                            </a>
                                                        </div>
                                                    </div> -->
                                                </div>
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