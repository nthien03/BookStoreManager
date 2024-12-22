<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <!-- Required Meta Tags Always Come First -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <!-- Title -->
            <title>Sign in</title>

            <!-- Favicon -->
            <!-- <link rel="shortcut icon" href="/favicon.ico"> -->

            <!-- Font -->
            <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">

            <!-- CSS Implementing Plugins -->
            <link rel="stylesheet" href="\assets\css\vendor.min.css">
            <link rel="stylesheet" href="\assets\vendor\icon-set\style.css">

            <!-- CSS Front Template -->
            <link rel="stylesheet" href="\assets\css\theme.min.css?v=1.0">
        </head>

        <body>
            <!-- ========== MAIN CONTENT ========== -->
            <main id="content" role="main" class="main">
                <div class="position-fixed top-0 right-0 left-0 bg-img-hero"
                    style="height: 32rem; background-image: url(/assets/svg/components/abstract-bg-4.svg);">
                    <!-- SVG Bottom Shape -->
                    <figure class="position-absolute right-0 bottom-0 left-0">
                        <svg preserveaspectratio="none" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                            viewbox="0 0 1921 273">
                            <polygon fill="#fff" points="0,273 1921,273 1921,0 "></polygon>
                        </svg>
                    </figure>
                    <!-- End SVG Bottom Shape -->
                </div>

                <!-- Content -->
                <div class="container py-5 py-sm-7">


                    <div class="row justify-content-center align-items-center">
                        <div class="col-md-7 col-lg-5">
                            <!-- Card -->
                            <div class="card card-lg">
                                <div class="card-body">
                                    <!-- Form -->
                                    <form method="post" action="/login">
                                        <div class="text-center">
                                            <div class="mb-5">
                                                <h1 class="display-4">Đăng nhập</h1>
                                            </div>
                                        </div>
                                        <c:if test="${param.error != null}">
                                            <!-- <div class="my-2" style="color: red;">Invalid email or password.</div> -->
                                            <div class="alert alert-soft-danger" role="alert">
                                                Tên đăng nhập hoặc mật khẩu không đúng.
                                            </div>
                                        </c:if>
                                        <!-- Form Group -->
                                        <div class="form-group">
                                            <label class="input-label">Tên đăng nhập</label>

                                            <input name="username" type="text" class="form-control form-control-lg">
                                        </div>
                                        <!-- End Form Group -->

                                        <!-- Form Group -->
                                        <div class="form-group">
                                            <label class="input-label">Mật khẩu</label>

                                            <div class="input-group input-group-merge">
                                                <input name="password" type="password"
                                                    class="form-control form-control-lg">


                                            </div>
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <!-- End Form Group -->



                                        <button type="submit" class="btn btn-lg btn-block btn-primary">Đăng
                                            nhập</button>
                                    </form>
                                    <!-- End Form -->
                                </div>
                            </div>
                            <!-- End Card -->
                        </div>
                    </div>
                </div>
                <!-- End Content -->
            </main>
            <!-- ========== END MAIN CONTENT ========== -->


            <!-- JS Implementing Plugins -->
            <script src="\assets\js\vendor.min.js"></script>

            <!-- JS Front -->
            <script src="\assets\js\theme.min.js"></script>

            <!-- JS Plugins Init. -->
            <script>
                $(document).on('ready', function () {
                    // INITIALIZATION OF SHOW PASSWORD
                    // =======================================================
                    $('.js-toggle-password').each(function () {
                        new HSTogglePassword(this).init()
                    });


                    // INITIALIZATION OF FORM VALIDATION
                    // =======================================================
                    $('.js-validate').each(function () {
                        $.HSCore.components.HSValidation.init($(this));
                    });
                });
            </script>

            <!-- IE Support -->
            <script>
                if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="./assets/vendor/babel-polyfill/polyfill.min.js"><\/script>');
            </script>
        </body>

        </html>