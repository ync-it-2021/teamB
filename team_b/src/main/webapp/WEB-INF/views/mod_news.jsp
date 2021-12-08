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

				<form role="form" action="/mod_news" method="post" enctype="multipart/form-data">
					<!--
       	controller에서 파라미터 수집시 upload file은 uploadFile 이름으로 server로 넘어간다.(binary data로)
       	하지만 BoardVO에서는 file_1,file_2,file_3의 이름으로 setter를 해줘야 한다.
       	따라서 file_1,file_2,file_3를 hidden으로 넘겨서 controller에서 file이 upload가 안됐을 경우에도
       	파라미터 수집이 되도록(값은 null로 됨) 하기위해 hidden으로 값을 넘긴다.
       	
       	업로드 파일 삭제 기능 추가시 해당 file의 value="" 로 바꿔주면 된다.
       	-->
					<c:forEach var="i" begin="1" end="3">
						<c:set var="t" value="file_${i}" />
						<c:choose>
							<c:when test="${not empty news[t]}">
								<input type="hidden" name="file_${i}" value="${news[t]}">
							</c:when>
							<c:otherwise>
								<input type="hidden" name="file_${i}" value="">
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum }"/>'> <input
						type='hidden' name='amount'
						value='<c:out value="${cri.amount }"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword }"/>'> <input
						type='hidden' name='news_num'
						value='<c:out value="${news.news_num }"/>'>

					<table>
						<tr>
							<td colspan="2">
								<div class="form-group">
									<input class="form-control" name='news_title'
										value='<c:out value="${news.news_title }"/>'>
								</div>
							</td>
							<td colspan="4"><sec:authentication property="principal"
									var="pinfo" />
								<div style="padding: 5px; float: right;">
									<sec:authorize access="isAuthenticated()">
										<button type="submit" data-oper='remove' class="btn btn-danger" id="button">삭제</button>
										<button type="submit" data-oper='mod_news' class="btn btn-success" id="button">등록</button>
									</sec:authorize>
								</div></td>
						</tr>
						<tr>
							<td><div class="form-group" style="padding: 5px;">
									<label>작성자</label> <input class="form-control" name='userid'
										value='${news.userid }'
										readonly="readonly">
								</div></td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>구분</label>
									<select class="form-control" name='gubun'>
											<option value="공지사항">공지사항</option>
											<option value="프로모션">프로모션</option>
											<option value="PC">PC</option>
											<option value="PS/XB">PC/XB</option>
									</select>
								</div>
							</td>	
							<td>
								<div class="form-group"
									style="display: inline-block; padding: 5px;">
									<label>대표 이미지(정사각형)</label> <input type="file"
										class="form-control" name='uploadFile'>
								</div>
							</td>
						</tr>
					</table>

					<div class="form-group">
						<label>상세 설명</label>
							<link href="/resources/vendor/plex/summernote-lite.css" rel="stylesheet" />
							<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
							<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/lang/summernote-ko-KR.js"></script>

						<textarea class="form-control" id="summernote" name='news_contents'><c:out
								value="${news.news_contents}" /></textarea>
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
												height : 450,
												lang : "ko-KR"
											});
						</script>
					</div>

					<c:forEach var="i" begin="1" end="3">
						<c:set var="t" value="file_${i}" />
						<div class="form-group">
							<label>이미지${i}</label>
							<c:if test="${not empty news[t]}">
								<a href="/resources/upload/${news[t]}" target="_blank"><img
									src="/resources/upload/${news[t]}" id="thumb_${i}"></a>
								<script>
									document.getElementById('thumb_${i}').src = "/resources/upload/"
											+ getThumbFileName('${news[t]}');
								</script>
							</c:if>
							<input type="file" class="form-control" name='uploadFile'>
						</div>
					</c:forEach>
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
	      formObj.attr("action", "/removenews");
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/newslist").attr("method","get");

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
