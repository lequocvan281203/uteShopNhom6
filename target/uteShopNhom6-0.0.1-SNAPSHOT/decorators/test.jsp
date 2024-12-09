<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-category"/>
<!DOCTYPE html>
<html>
<head>
<title><dec:title default="Trang chủ" /></title>

<link rel="stylesheet" href="<c:url value='/template/admin/assets/css/bootstrap.min.css' />" />

<link rel="stylesheet" href="<c:url value='/template/admin/font-awesome/4.5.0/css/font-awesome.min.css' />" />

<link rel="stylesheet" href="<c:url value='/template/admin/assets/css/ace.min.css' />" class="ace-main-stylesheet" id="main-ace-style" />

<script src="<c:url value='/template/admin/assets/js/ace-extra.min.js' />"></script>

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type='text/javascript' src='<c:url value="/template/admin/js/jquery-2.2.3.min.js" />'></script>

<script src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js' />"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>


<style type="text/css">
	.center112
	{
      	text-align: center!important;
    	vertical-align: middle!important;
	}
</style>
</head>
<body class="no-skin">
	
    <%@ include file="/common/admin/header.jsp" %>
    

	<div class="main-container" id="main-container">
		<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<!-- menu -->
		<%@ include file="/common/admin/menu.jsp" %>
		<!-- menu -->
		<dec:body/>
		<!-- footer-->
		<%@ include file="/common/admin/footer.jsp" %>
		<!-- footer-->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
	 </div>

	<script src="<c:url value='/template/admin/assets/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery-ui.custom.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.ui.touch-punch.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.easypiechart.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.sparkline.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.pie.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.resize.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/ace-elements.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/ace.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.inputlimiter.1.3.1.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/bootstrap-tag.min.js'/>"></script>
	<script>
	var tag_input = $('#form-field-tags');
	var data = [];
	var ids = $('#valuechild input').map(function () {
        return $(this).val();
    }).get();
	
	data = ids;
	try{
		tag_input.tag(
		  {
			placeholder:tag_input.attr('placeholder'),	
			//enable typeahead by specifying the source array
			source: ace.vars['US_STATES'],//defined in ace.js >> ace.enable_search_ahead
			/**
			or fetch data from database, fetch those that match "query"
			source: function(query, process) {
			  $.ajax({url: 'remote_source.php?q='+encodeURIComponent(query)})
			  .done(function(result_items){
				process(result_items);
			  });
			}
			*/
		  }
		)
		//programmatically add a new
		var $tag_obj = $('#form-field-tags').data('tag');
		data.map((item)=> $tag_obj.add(item));
	}
	catch(e) {
		//display a textarea for old IE, because it doesn't support this plugin or another one I tried!
		tag_input.after('<textarea id="'+tag_input.attr('id')+'" name="'+tag_input.attr('name')+'" rows="3">'+tag_input.val()+'</textarea>').remove();
		//$('#form-field-tags').autosize({append: "\n"});
	}
	var tags = document.querySelector('#test .tags');
	tags.style.width="400px";
	var idAllCategory = $('#valuechild input').map(function () {
        return $(this).attr('id');
    }).get()
	var allTag = document.querySelectorAll('#test .tags .tag');
	for(var i =0 ;i<allTag.length;i++){
		allTag[i].id=idAllCategory[i];
	}
	listIdCategoryDelete=[]	
	var buttonTagAll = document.querySelectorAll('#test .tags .tag button');
	for (var i = 0; i < buttonTagAll.length; i++) {
	    buttonTagAll[i].addEventListener("click", (function (index) {
	        return function () {
	        	listIdCategoryDelete.push(idAllCategory[index]); // index là vị trí của nút bị click
	        };
	    })(i));
	}
	//xu ly them Category
	
	
	$("#btnUpdate").click(function (e) {
		var check=true;
		listCategoryNew = [];
		var categoryName = $("#categoryName").val();
		var imageLink = $("#imageLink").val();
		var imageOld = $("#imageOld").attr('src');
		var categoryID=$("#categoryID").val();
		if(imageLink===""){
			imageLink=imageOld;
		}
		var allTag = document.querySelectorAll('#test .tags .tag');
		for(var i =0 ;i<allTag.length;i++){
			if(allTag[i].id===""){
				listCategoryNew.push(allTag[i].textContent.slice(0, -1));
			}
		}
		data ={};
		data["categoryID"]=categoryID;
		data["categoryName"]= categoryName;
		data["imageLink"]=imageLink;
		data["categoryNews"]=listCategoryNew;
		data["idDeletes"]=listIdCategoryDelete;
		if($('#image').attr('alt') == ""){
				updateCategory(data);
			
		}
		else{
			$('#LinkError').text("Link hình ảnh không hợp lệ");
		}
	})
	
	function updateCategory(data){
		$.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) { //result la ket qua tra ve vd : newModel,...
            	window.location.href = "/uteShopNhom6/admin-category-edit?categoryID=${model.categoryID}";
            	$('#Error').text("");
            	alert("Cập nhập thành công");
            },
            error: function (error) {
            	if (error.status === 400) {
            		window.location.href = "/uteShopNhom6/admin-category-edit?categoryID=${model.categoryID}";
            		alert("Lỗi rồi bạn vừa xóa một số thể loại đang còn sử dụng cho một số sản phẩm");
            	}
            	else{
            		$('#success').text("");
                	$('#Error').text("Lỗi rồi");
            	}
            	
            }
        });
	}
	</script>
	
	<script>
	    $('#imageLink').change(function(){
	    	var newSrc = $(this).val();
            $('#image').attr('src', newSrc);
           
	        $('#imageTitle').text("Hình ảnh hiện thị");
	        $('#image').on('error', function () {
	        	$('#image').attr('alt', "Link hình ảnh không hợp lệ");
	        	$('#success').text("");
	        });
	        
	        $('#image').on('load', function () {
	        	$('#image').attr('alt', "");
	        	$('#LinkError').text("");
	        });
	    })
	    
	 
	    $('#btnAdd').click(function (e) {
	    	e.preventDefault();
	    	var datas = {};
	    	var data = [];
			$('.tag').map(function() {
				var tagValue = $(this).text().slice(0, -1);; // Lấy nội dung (text) của mỗi thẻ
				data.push(tagValue); // Thêm giá trị vào mảng tagValues
			});
	    	var categoryName = $('#categoryName').val();
	    	var imageLink = $('#image').attr('src');
	    	var icon = $('#icon').val();
	    	datas["nameChildCategorys"]=data;
	    	datas["categoryName"]=categoryName;
	    	datas["imageLink"]=imageLink;
	    	datas["icon"]=icon;
	    	console.log(datas);
	    	if($('#image').attr('alt') == ""){
	    		addCategory(datas);
	    	}
	    	else{
	    		$('#LinkError').text("Link hình ảnh không hợp lệ");
	    	}
	    	
	    })
	    
	    function addCategory(datas){
		$.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(datas),
            dataType: 'json',	
            success : function(result) 
            { //result la ket qua tra ve vd : newModel,...
            	$('#Error').text("");
            	$('#success').text("Thêm thành công");
			},
			error: function(error) 
			{
				$('#success').text("");
            	$('#Error').text("Lỗi rồi");
		    }
        });
	}
	</script>
</body>
</html>