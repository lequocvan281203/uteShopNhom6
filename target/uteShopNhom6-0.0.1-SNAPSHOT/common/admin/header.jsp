<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div id="navbar" class="navbar navbar-default ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
    <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
	</button>
        <div class="navbar-header pull-left"> 
            <a href="<c:url value = '/admin-home'/>" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    Trang quản trị
                </small>
            </a>
        </div>

        <li class="light-blue dropdown-modal">
        <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        Xin chào, ${USERMODEL.fullName}
                    </a>
                    <li class="light-blue dropdown-modal">
                        <a href='<c:url value = 'thoat?action=loguot'/>'>
                            <i class="ace-icon fa fa-power-off"></i>
                            Thoát
                        </a>
                    </li> 
        <div class="navbar-buttons navbar-header pull-right collapse navbar-collapse" role="navigation">
            <ul class="nav ace-nav">
            

						
						
                <li class="light-blue">
					<a data-toggle="dropdown" href="#" class="dropdown-toggle" style="padding: 0 16px 0 8px!important;">
						<img class="nav-user-photo" src="<c:url value='/template/admin/assets/avatars/avatar.png'/>" />
						<span class="user-info">
							<small style="font-size: 14px!important;">Xìn chào,</small>
							${USERMODEL.fullName}
						</span>

						<i class="ace-icon fa fa-caret-down"></i>
					</a>

					<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						
						<li class="divider"></li>

						<li>
							<a href='<c:url value = 'thoat?action=loguot'/>'>
								<i class="ace-icon fa fa-power-off"></i>
								Đăng xuất
							</a>
						</li>
					</ul>
				</li>
            </ul>
        </div>
    </div>
</div>
