<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
    <script type="text/javascript">
        try{ace.settings.loadState('sidebar')}catch(e){}
    </script>
    <div class="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="ace-icon fa fa-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
        </div>
        <div class="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div>
    <ul class="nav nav-list">
	    <li class="">
			<a href="<c:url value = '/admin-home'/>">
				<i class="menu-icon fa fa-tachometer pink"></i>
				<span class="menu-text"> Dashboard </span>
			</a>
			<b class="arrow"></b>
		</li>
        <li class="">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list blue"></i>
                <span class="menu-text"></span>
                Quản lý người dùng
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            
			<ul class="submenu">
				<li class="">
	                				<a href='<c:url value='/admin-user-list?page=1&maxPageItem=7'/>'>
	                       <i class="menu-icon fa fa-caret-right"></i>
	                       Danh sách tài khoản
	                   </a>
	                   <b class="arrow"></b>
	              	</li>
			</ul>
			
        </li>
        
        <li class="">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list-alt green"></i>
                <span class="menu-text"></span>
                Quản lý sản phẩm
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
           
				<ul class="submenu">
					<li class="">
	                 				<a href='<c:url value='/admin-category-list?page=1&maxPageItem=3'/>'>
	                        <i class="menu-icon fa fa-caret-right"></i>
	                        Danh sách thể loại
	                    </a>
	                    <b class="arrow"></b>
	               	</li>
	               	<li class="">
	                 			<a href='<c:url value = '/admin-product-list?page=1&maxPageItem=10'/>'>
	                        <i class="menu-icon fa fa-caret-right"></i>
	                        Danh sách sản phẩm
	                    </a>
	                    <b class="arrow"></b>
	               	</li>
	               	<li class="">
	                 			<a href='<c:url value = 'admin-brand-list?page=1&maxPageItem=6'/>'>
	                        <i class="menu-icon fa fa-caret-right"></i>
	                        Danh sách thương hiệu
	                    </a>
	                    <b class="arrow"></b>
	               	</li>
				</ul>	
        </li>
        <li class="">
			<a href="<c:url value = '/admin-bill-list?page=1&maxPageItem=9'/>">
				<i class="menu-icon fa fa-pencil-square-o black"></i>
				<span class="menu-text">Thông tin đơn hàng</span>
			</a>
			<b class="arrow"></b>
		</li>
		<%-- <li class="">
			<a href="<c:url value = 'admin-promotion-list?page=1&maxPageItem=10'/>">
				<i class="menu-icon fa fa-gift red"></i>
				<span class="menu-text">Sản phẩm khuyến mãi</span>
			</a>
			<b class="arrow"></b>
		</li> --%>
    </ul>
    <div class="sidebar-toggle sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>
</div>
