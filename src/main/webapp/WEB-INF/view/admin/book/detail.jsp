<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <!-- Required Meta Tags Always Come First -->
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

                <!-- Title -->
                <title>Book detail</title>

                <!-- Favicon -->
                <link rel="shortcut icon" href="\favicon.ico">

                <!-- Font -->
                <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap"
                    rel="stylesheet">

                <!-- CSS Implementing Plugins -->
                <link rel="stylesheet" href="\assets\css\vendor.min.css">
                <link rel="stylesheet" href="\assets\vendor\icon-set\style.css">

                <!-- CSS Front Template -->
                <link rel="stylesheet" href="\assets\css\theme.min.css?v=1.0">

                <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

                <!-- Thêm CSS của Select2 -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css"
                    rel="stylesheet" />

                <!-- Thêm JS của Select2 -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
                <style>
                    .required::after {
                        content: " *";
                        color: red !important;
                    }
                </style>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");

                        avatarFile.change(function (e) {
                            const file = e.target.files[0];

                            if (file) {
                                // Nếu có file được chọn, hiển thị ảnh preview
                                const imgURL = URL.createObjectURL(file);
                                $("#avatarPreview").attr("src", imgURL);
                                $("#avatarPreview").css({ "display": "block" });
                            } else {
                                // Nếu không có file, ẩn ảnh preview
                                $("#avatarPreview").css({ "display": "none" });
                            }


                        });
                    });
                </script>
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
                            <div class="row align-items-center">
                                <div class="col-sm mb-2 mb-sm-0">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb breadcrumb-no-gutter">
                                            <li class="breadcrumb-item"><a class="breadcrumb-link"
                                                    href="/admin/book">Cập
                                                    nhật sách</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Chi tiết sách
                                            </li>
                                        </ol>
                                    </nav>

                                    <h1 class="page-header-title">Chi tiết sách</h1>
                                </div>
                            </div>
                            <!-- End Row -->
                        </div>
                        <!-- End Page Header -->


                        <div class="row">
                            <div class="col-lg-12">
                                <!-- Card -->
                                <div class="card mb-3 mb-lg-5">
                                    <!-- Body -->
                                    <div class="card-body">
                                        <form:form method="post" action="/admin/book/update" modelAttribute="newBook"
                                            enctype="multipart/form-data">
                                            <div class="form-group" style="display: none;">
                                                <label class="input-label">ID: </label>
                                                <form:input type="text" class="form-control" path="id" />
                                            </div>
                                            <div class="form-group">
                                                <c:set var="errName">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label class="input-label required">Tên sách</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errName ? 'is-invalid':''}"
                                                    placeholder="Nhập tên sách" path="name" />
                                                <form:errors path="name" class="text-danger" />

                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <c:set var="errAuthor">
                                                            <form:errors path="author" />
                                                        </c:set>
                                                        <label class="input-label required">Tác giả</label>
                                                        <form:select path="author"
                                                            class="form-control ${not empty errAuthor ? 'is-invalid':''}">
                                                            <form:options items="${authors}" itemValue="id"
                                                                itemLabel="name" />
                                                        </form:select>
                                                        <form:errors path="author" class="text-danger" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <c:set var="errCategory">
                                                            <form:errors path="category" />
                                                        </c:set>
                                                        <label class="input-label required">Thể loại</label>
                                                        <form:select
                                                            class="form-control ${not empty errCategory ? 'is-invalid':''}"
                                                            path="category">
                                                            <form:options items="${categories}" itemValue="id"
                                                                itemLabel="name" />
                                                        </form:select>
                                                        <form:errors path="category" class="text-danger" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <c:set var="errPublisher">
                                                            <form:errors path="publisher" />
                                                        </c:set>

                                                        <label class="input-label required">Nhà xuất bản</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errPublisher ? 'is-invalid':''}"
                                                            placeholder="Nhập nhà xuất bản" path="publisher" />
                                                        <form:errors path="publisher" class="text-danger" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <c:set var="errSalePrice">
                                                            <form:errors path="salePrice" />
                                                        </c:set>
                                                        <label class="input-label required">Đơn giá bán
                                                            (VND)</label>
                                                        <form:input type="number"
                                                            class="form-control ${not empty errSalePrice ? 'is-invalid':''}"
                                                            path="salePrice"
                                                            placeholder="Nhập đơn giá bán (VD: 100000)" />
                                                        <form:errors path="salePrice" class="text-danger" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <c:set var="errQuantity">
                                                            <form:errors path="quantity" />
                                                        </c:set>
                                                        <label class="input-label required">Số lượng</label>
                                                        <form:input type="number" path="quantity"
                                                            class="form-control ${not empty errQuantity ? 'is-invalid':''}"
                                                            placeholder="Nhập số lượng (VD: 10)" />
                                                        <form:errors path="quantity" class="text-danger" />

                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label class="input-label required">Trạng thái</label>
                                                        <form:select class="form-control" path="isDisabled">
                                                            <form:option value="0" label="Đang kinh doanh" />
                                                            <form:option value="1" label="Ngừng kinh doanh" />
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label class="input-label">Mô tả</label>

                                                        <form:textarea path="description" class="form-control"
                                                            placeholder="Nhập mô tả sách" rows="4"></form:textarea>

                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="avatarFile" class="input-label">Hình
                                                            ảnh</label>
                                                        <!-- Hiển thị ảnh hiện tại nếu có -->
                                                        <input class="form-control" type="file" name="imageBookFile"
                                                            id="avatarFile" accept=".png, .jpg, .jpeg" />
                                                    </div>
                                                    <div class="form-group">
                                                        <c:choose>
                                                            <c:when test="${not empty newBook.image}">
                                                                <img src="/images/book/${newBook.image}"
                                                                    style="max-height: 250px;" alt="avatar preview"
                                                                    id="avatarPreview" />
                                                                <form:input type="text" class="form-control"
                                                                    path="image" style="display: none;" />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img style="max-height: 250px; display: none;"
                                                                    alt="No avatar available" id="avatarPreview" />
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="d-flex justify-content-end">
                                                <button type="submit" class="btn btn-primary"
                                                    style="padding-left: 30px; padding-right: 30px;">Lưu</button>
                                            </div>
                                        </form:form>
                                    </div>
                                    <!-- Body -->
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
                    if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="/assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
                </script>


            </body>

            </html>