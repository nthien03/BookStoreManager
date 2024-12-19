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
                <title>Add Book</title>

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
                <!-- <style>
                /* Đảm bảo rằng select2 có cùng chiều rộng với các trường input khác */
                .js-select2 {
                    width: 100%;
                    /* Đảm bảo trường dropdown có chiều rộng 100% */
                }

                /* Điều chỉnh margin và padding để đồng bộ */
                .form-group select.form-control,
                .form-group input.form-control {
                    padding: 0.375rem 0.75rem;
                    /* Đảm bảo padding giống nhau */
                    font-size: 1rem;
                    /* Giữ kích thước chữ đồng nhất */
                    height: auto;
                    /* Đảm bảo chiều cao không bị thay đổi */
                }

                /* Điều chỉnh kích thước select2 cho phù hợp với các input */
                .select2-container .select2-selection--single {
                    height: 38px;
                    /* Đảm bảo chiều cao giống với các trường input */
                    line-height: 36px;
                    /* Căn chỉnh chữ bên trong select */
                }

                .select2-container .select2-selection--single .select2-selection__rendered {
                    padding: 8px;
                    /* Căn chỉnh lại padding bên trong select2 */
                }

                /* Đảm bảo border và background của select2 giống các input */
                .select2-container .select2-selection--single {
                    border: 1px solid #ced4da;
                    /* Tạo viền giống input */
                    background-color: #fff;
                    /* Màu nền giống input */
                }
            </style> -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });

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
                                            <li class="breadcrumb-item active" aria-current="page">Thêm mới sách
                                            </li>
                                        </ol>
                                    </nav>

                                    <h1 class="page-header-title">Thêm mới sách</h1>
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
                                        <form:form method="post" action="/admin/book/create" modelAttribute="newBook"
                                            enctype="multipart/form-data">
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
                                                            <form:option value="" label="--Chọn tác giả" />
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
                                                            <form:option value="" label="--Chọn thể loại" />
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
                                                        <label class="input-label">Mô tả</label>

                                                        <form:textarea path="description" class="form-control"
                                                            placeholder="Nhập mô tả sách" rows="4"></form:textarea>

                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="avatarFile" class="input-label">Hình
                                                            ảnh</label>
                                                        <input class="form-control" type="file" name="imageBookFile"
                                                            id="avatarFile" accept=".png, .jpg, .jpeg" />
                                                    </div>
                                                    <div class="form-group">
                                                        <img style="max-height: 250px; display: none;"
                                                            alt="avatar preview" id="avatarPreview" />
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Hiển thị thông báo dạng alert -->

                                            <!-- <c:if test="${not empty alertMessage}"> -->
                                            <!-- <div class="alert alert-${alertType}">
                                                    ${alertMessage}
                                                </div> -->
                                            <!-- <script>
                                                    window.onload = function () {
                                                        var message = "${alertMessage}";
                                                        var alertType = "${alertType}";
                                                        if (message) {
                                                            // Hiển thị thông báo alert
                                                            alert(message);

                                                            // Nếu là thông báo thành công, chuyển hướng sau khi nhấn OK
                                                            if (alertType == 'success') {
                                                                // Chuyển hướng đến danh sách sách sau khi nhấn OK
                                                                window.location.href = "/admin/book";
                                                            }
                                                        }
                                                    };
                                                </script> -->
                                            <!-- </c:if> -->
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
                <!-- <script>
                    $(document).ready(function () {
                        // Áp dụng Select2 cho thẻ <select> có class 'form-control'
                        $('.form-control').select2({
                            dropdownAutoWidth: true,
                            width: '100%',  // Đảm bảo dropdown chiếm toàn bộ chiều rộng
                            maximumSelectionLength: 10  // Giới hạn số lựa chọn tối đa (nếu cần)
                        });
                    });
                </script> -->
                <!-- <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        // Lấy tất cả các trường input có class 'form-control'
                        const formFields = document.querySelectorAll('.form-control');

                        formFields.forEach(function (field) {
                            field.addEventListener('input', function () {
                                const errorElement = field.nextElementSibling; // lấy phần tử lỗi (form:errors)

                                // Nếu trường hợp hợp lệ, xóa lớp is-invalid và ẩn lỗi
                                if (field.value.trim() !== '') {
                                    field.classList.remove('is-invalid');
                                    if (errorElement && errorElement.classList.contains('invalid-feedback')) {
                                        errorElement.style.display = 'none'; // Ẩn thông báo lỗi
                                    }
                                } else {
                                    field.classList.add('is-invalid');
                                    if (errorElement && errorElement.classList.contains('invalid-feedback')) {
                                        errorElement.style.display = 'block'; // Hiển thị thông báo lỗi
                                    }
                                }
                            });

                            field.addEventListener('blur', function () {
                                const errorElement = field.nextElementSibling;

                                if (field.value.trim() !== '') {
                                    field.classList.remove('is-invalid');
                                    if (errorElement && errorElement.classList.contains('invalid-feedback')) {
                                        errorElement.style.display = 'none';
                                    }
                                } else {
                                    field.classList.add('is-invalid');
                                    if (errorElement && errorElement.classList.contains('invalid-feedback')) {
                                        errorElement.style.display = 'block';
                                    }
                                }
                            });
                        });
                    });

                </script> -->

            </body>

            </html>