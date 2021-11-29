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
		<h1 class="page-header">Game_Info Modify</h1>
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

				<form action="/modify" method="post" enctype="multipart/form-data"
					id="form">
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
							<c:when test="${not empty games[t]}">
								<input type="hidden" name="file_${i}" value="${games[t]}">
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
						type='hidden' name='game_num'
						value='<c:out value="${games.game_num }"/>'>

					<table>
						<tr>
							<td colspan="2">
								<div class="form-group">
									<input class="form-control" name='title'
										value='<c:out value="${games.title }"/>'>
								</div>
							</td>
							<td colspan="4"><sec:authentication property="principal"
									var="pinfo" />
								<div style="padding: 5px; float: right;">
									<sec:authorize access="isAuthenticated()">
										<button type="submit" data-oper='remove'
											class="btn btn-danger" id="confirm">
											<i class="fa fa-trash-o fa-fw"></i>
										</button>
										<input type="submit" class="btn btn-success" value="등록" />
									</sec:authorize>
								</div></td>
						</tr>
						<tr>
							<td><div class="form-group" style="padding: 5px;">
									<label>개발사</label> <input class="form-control" name='dev'
										placeholder='개발사' value='<c:out value="${games.dev}"/>'>
								</div></td>
							<td><div class="form-group" style="padding: 5px;">
									<label>유통사</label> <input class="form-control" name='publisher'
										placeholder='유통사' value='<c:out value="${games.publisher}"/>'>
								</div></td>
							<td><div class="form-group" style="padding: 5px;">
									<label>한국어 지원</label> <input class="form-control" name='korean'
										placeholder='한국어 지원/미지원'
										value='<c:out value="${games.korean}"/>'>
								</div></td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>플랫폼</label> <input class="form-control" name='platform'
										placeholder='플랫폼' value='<c:out value="${games.platform}"/>'>
								</div>
							</td>

							<td>
								<div class="form-group" style="padding: 5px;">
									<label>정상가</label> <input class="form-control" name='price'
										placeholder='정상가' value='<c:out value="${games.price}"/>'>
								</div>
							</td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>할인가</label> <input class="form-control"
										name='sale_price' placeholder='할인가'
										value='<c:out value="${games.sale_price}"/>'>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>할인 적용</label> <input class="form-control"
										name='sale_enabled' placeholder='적용: 1, 미적용: 0'
										value='<c:out value="${games.sale_enabled}"/>'>
								</div>
							</td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>출시 일자</label> <input class="form-control"
										name='relase_date' placeholder='yy/MM/dd'
										value='<c:out value="${games.relase_date}"/>'>
								</div>
							</td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>장르</label> 
									<!-- <input class="form-control" name='genre_id'
										placeholder='장르의 id 입력'
										value='<c:out value="${games.genre_id}"/>'> -->
										<select class="form-control" name='genre_id'>
										<c:forEach items="${genre}" var="genre">
											<option value="${genre.genre_id }"><c:out
													value="${genre.genre_name}" /></option>
										</c:forEach>
									</select>
								</div>
							</td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>플레이 지원</label> 
									<!--<input class="form-control"
										name='size_id' placeholder='플레이 지원의 id 입력'
										value='<c:out value="${games.size_id}"/>'> -->
										
										<select class="form-control" name='size_id'>
										<c:forEach items="${size}" var="size">
											<option value="${size.size_id }"><c:out
													value="${size.size_name}" /></option>
										</c:forEach>
									</select>
								</div>
							</td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>요구사양</label> <input class="form-control" name='rec_id'
										placeholder='추후 수정 예정, 1입력'
										value='<c:out value="${games.rec_id}"/>'>
								</div>
							</td>
						</tr>
					</table>

					<div class="form-group">
						<label>상세 설명</label>
						<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
						<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>

						<textarea class="form-control" id="summernote" name='info'><c:out
								value="${games.info}" /></textarea>
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
							<c:if test="${not empty games[t]}">
								<a href="/resources/upload/${games[t]}" target="_blank"><img
									src="/resources/upload/${games[t]}" id="thumb_${i}"></a>
								<script>
									document.getElementById('thumb_${i}').src = "/resources/upload/"
											+ getThumbFileName('${games[t]}');
								</script>
							</c:if>
							<input type="file" class="form-control" name='uploadFile'>
						</div>
					</c:forEach>
					<button type="submit" data-oper='list' class="btn btn-info"
						id="confirm">List</button>
				</form>


			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
<!--  
<script type="text/javascript">
$(document).ready(function() {


	  let formObj = $("#form");

	  $('#confirm').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/remove");
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/list").attr("method","get");

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
-->





<%@include file="includes/footer.jsp"%>
