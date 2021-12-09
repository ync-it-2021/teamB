<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@include file="includes/header.jsp"%>
<style>
.note-editable { background-color: #0b0c2a !important; color: white !important; }
</style>
<script>
	//썸네일 파일명을 가져오는 함수
	function getThumbFileName(fullFilePath) {
		var arrString = fullFilePath.split("/");
		console.log(arrString);
		arrString.splice(-1, 1, "s_" + arrString[arrString.length - 1]);
		return arrString.join("/");
	}
</script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">뉴스 게시글 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">수정</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/mod_faq" method="post">

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum }"/>'> <input
						type='hidden' name='amount'
						value='<c:out value="${cri.amount }"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword }"/>'> <input
						type='hidden' name='faq_num'
						value='<c:out value="${faq.faq_num }"/>'>

					<table>
						<tr>
							<td colspan="2">
								<div class="form-group">
									<input class="form-control" name='faq_title'
										value='<c:out value="${faq.faq_title }"/>'>
								</div>
							</td>
							<td colspan="4"><sec:authentication property="principal"
									var="pinfo" />
								<div style="padding: 5px; float: right;">
									<sec:authorize access="isAuthenticated()">
										<button type="submit" data-oper='remove' class="btn btn-danger" id="button">삭제</button>
										<button type="submit" data-oper='mod_faq' class="btn btn-success" id="button">등록</button>
									</sec:authorize>
								</div></td>
						</tr>
						<tr>
							<td><div class="form-group" style="padding: 5px;">
									<label>작성자</label> <input class="form-control" name='userid'
										value='${faq.userid }'
										readonly="readonly">
								</div></td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>구분</label>
									<select class="form-control" name='faq_type'>
											<option value="결제 및 프로모션">결제 및 프로모션</option>
											<option value="웹 사이트 및 계정">웹 사이트 및 계정</option>

									</select>
								</div>
							</td>
						</tr>
					</table>

					<div class="form-group">
						<label>상세 설명</label>
							<link href="/resources/vendor/plex/summernote-lite.css" rel="stylesheet" />
							<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
							<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/lang/summernote-ko-KR.js"></script>

						<textarea class="form-control" id="summernote" name='faq_contents'><c:out
								value="${faq.faq_contents}" /></textarea>
						<!-- <div id="summernote" name='info'></div> -->
						<script>
							$('#summernote')
									.summernote(
											{
												toolbar : [
														// [groupName, [list of button]]
														[ 'fontname',
																[ 'fontname' ] ],
														[ 'fontsize',
																[ 'fontsize' ] ],
														[
																'style',
																[
																		'bold',
																		'italic',
																		'underline',
																		'strikethrough',
																		'clear' ] ],
														[
																'color',
																[ 'forecolor',
																		'color' ] ],
														[ 'table', [ 'table' ] ],
														[
																'para',
																[ 'ul', 'ol',
																		'paragraph' ] ],
														[ 'height',
																[ 'height' ] ],
														[
																'insert',
																[ 'picture',
																		'link',
																		'video' ] ],
														[
																'view',
																[ 'help',
																		'codeview' ] ] ],
												fontNames : [ '맑은 고딕', '궁서',
														'굴림체', '굴림', '돋움체',
														'바탕체' ],
												fontSizes : [ '8', '9', '10',
														'11', '12', '14', '16',
														'18', '20', '22', '24',
														'28', '30', '36', '50',
														'72' ],
												height : 250,
												lang : "ko-KR"
											});
						</script>
					</div>
				</form>
			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {


	  let formObj = $("form");

	  $('#button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    if(operation === 'remove'){
	      formObj.attr("action", "/removefaq");
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/faqlist").attr("method","get");

	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);
	    }
	    
	    formObj.submit();
	  });

});
</script>





<%@include file="includes/footer.jsp"%>
