<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <aside
            class="js-navbar-vertical-aside navbar navbar-vertical-aside navbar-vertical navbar-vertical-fixed navbar-expand-xl navbar-bordered  ">
            <div class="navbar-vertical-container">
                <div class="navbar-vertical-footer-offset">
                    <div class="navbar-brand-wrapper justify-content-between">
                        <!-- Logo -->
                        <a class="navbar-brand" href="/admin" aria-label="Front">
                            <img class="navbar-brand-logo" src="\assets\svg\logos\logo2.svg" alt="Logo">
                            <img class="navbar-brand-logo-mini" src="\assets\svg\logos\logo-short.svg" alt="Logo">
                        </a>

                        <!-- End Logo -->

                        <!-- Navbar Vertical Toggle -->
                        <button type="button"
                            class="js-navbar-vertical-aside-toggle-invoker navbar-vertical-aside-toggle btn btn-icon btn-xs btn-ghost-dark">
                            <i class="tio-clear tio-lg"></i>
                        </button>
                        <!-- End Navbar Vertical Toggle -->
                    </div>

                    <!-- Content -->
                    <div class="navbar-vertical-content">
                        <ul class="navbar-nav navbar-nav-lg nav-tabs">
                            <!-- Dashboards -->

                            <!-- End Dashboards -->

                            <!-- Pages -->
                            <li class="navbar-vertical-aside-has-menu ">
                                <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle "
                                    href="javascript:;" title="Pages">
                                    <i class="tio-book-opened nav-icon"></i>
                                    <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">Quản
                                        lý sách</span>
                                </a>

                                <ul class="js-navbar-vertical-aside-submenu nav nav-sub">
                                    <li class="nav-item">
                                        <a class="nav-link " href="/admin/book" title="Referrals">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate">Cập nhật sách</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " href="/admin/stock-inbound-receipt/create"
                                            title="Referrals">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate">Lập phiếu nhập kho</span>
                                        </a>
                                    </li>

                                </ul>
                            </li>
                            <!-- End Pages -->

                            <!-- Apps -->
                            <li class="navbar-vertical-aside-has-menu ">
                                <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle "
                                    href="/admin/order" title="Apps">
                                    <i class="tio-shopping-basket-outlined tio-xl nav-icon"></i>
                                    <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">Quản
                                        lý bán hàng
                                </a>

                                <!-- <ul class="js-navbar-vertical-aside-submenu nav nav-sub">
                                    <li class="nav-item">
                                        <a class="nav-link " href="/admin" title="Kanban">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate">Quản lý đơn hàng</span>
                                        </a>
                                    </li>


                                    <li class="nav-item">
                                        <a class="nav-link " href="/admin" title="File Manager">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate">Báo cáo doanh thu</span>
                                        </a>
                                    </li>
                                </ul> -->
                            </li>
                            <!-- End Apps -->

                            <li class="nav-item ">
                                <a class="js-nav-tooltip-link nav-link " href="/admin" title="Welcome page"
                                    data-placement="left">
                                    <i class="tio-lock-outlined nav-icon"></i>
                                    <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">Quản
                                        lý tài khoản</span>
                                </a>
                            </li>
                            <li class="nav-item ">
                                <a class="js-nav-tooltip-link nav-link " href="/admin" title="Welcome page"
                                    data-placement="left">
                                    <i class="tio-apps nav-icon"></i>
                                    <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">Quản
                                        lý nhà cung cấp</span>
                                </a>
                            </li>

                        </ul>
                    </div>
                    <!-- End Content -->


                </div>
            </div>
        </aside>