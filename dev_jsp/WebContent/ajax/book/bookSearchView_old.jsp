<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서검색[자동완성 + 초성검사]</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
	<style type="text/css">
		#d_search {
			position: absolute;
		}
	</style>
	<script type="text/javascript">
		function bookSearch(){
			alert("bookSearch 호출 성공");
		}
	</script>
</head>
<body>
	<script type="text/javascript">
/*
t.textbox('textbox').bind('keydown', function(e){
	if (e.keyCode == 13){	// when press ENTER key, accept the inputed value.
		t.textbox('setValue', $(this).val());
	}
});
*/
		$(document).ready(function (){
			$('#book_title').textbox({
				cls: 'book_title'
			});
			$('.book_title').css("left", "500px");
//			$('#book_title2').textbox('textbox').bind('keyup',bookSearch);
			//$('#book_title2').textbox('keyup',bookSearch);
			var t = $('#book_title2');
			t.textbox('textbox').bind('keydown', function(e){
				if (e.keyCode == 13){	// when press ENTER key, accept the inputed value.
					alert("13");
					//t.textbox('setValue', $(this).val());
				}
			});			
			t.textbox('textbox').bind('keyup', function(e){
				alert("keyup");
				//t.textbox('setValue', $(this).val());
			});			
		});
	</script>
	<input id="book_title" style="width:100px"/> 
	<input id="book_title2" class="easyui-textbox" style="width:200px"/> 
	<!-- 
	<span class="textbox" style="width: 300px;"><input
		id="book_title" type="text" onKeyUp="bookSearch()"
		class="textbox-text validatebox-text textbox-prompt"
		autocomplete="off" tabindex="" placeholder=""
		style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 298px;"><input
		type="hidden" class="textbox-value" value=""></span>
		-->
	<div id="d_search"></div>
</body>
</html>





