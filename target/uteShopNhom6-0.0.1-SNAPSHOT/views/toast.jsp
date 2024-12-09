<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<body>
	<div class="toast-container">
	  <div id="liveToast" class="toast" data-delay="2000" role="alert" aria-live="assertive" aria-atomic="true" style="position: fixed; top: 10px; right: 0px; display: none;">
	    <div class="toast-header">
	      <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><defs><style>.fa-secondary{opacity:0.4;fill:#33e65f;}.fa-primary{fill:#33e65f;}</style></defs><path class="fa-primary" d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/><path class="fa-secondary" d=""/></svg>
	      <strong class="me-auto ml-2">OriShop</strong>
	    </div>
	    <div class="toast-body">
	      Thêm vào giỏ hàng thành công
	    </div>
	  </div>
	</div>
	
	<script>
	    const addToCartButtons = document.querySelectorAll('.addToCartBtn');

	    addToCartButtons.forEach(button => {
	        button.addEventListener('click', (event) => {
	        	localStorage.setItem('toastMessage', 'true');
	        });
	    });
	</script>
</body>