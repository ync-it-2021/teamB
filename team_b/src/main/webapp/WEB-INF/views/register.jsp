<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@include file="includes/header.jsp"%>
<style>
td {
	width: 234px;
}
</style>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Game_Info Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Game_Info Register</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/register" method="post"
					enctype="multipart/form-data">

					<!--
        	controller에서 파라미터 수집시 upload file은 uploadFile 이름으로 server로 넘어간다.(binary data로)
        	하지만 BoardVO에서는 file_1,file_2,file_3의 이름으로 setter를 해줘야 한다.
        	따라서 file_1,file_2,file_3를 hidden으로 넘겨서 controller에서 file이 upload가 안됐을 경우에도
        	파라미터 수집이 되도록(값은 null로 됨) 하기위해 hidden으로 값을 넘긴다.
        	-->
					<input type="hidden" name="file_1" value=""> <input
						type="hidden" name="file_2" value=""> <input type="hidden"
						name="file_3" value=""> <input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />

					<table>
						<tr>
							<td colspan="2">
								<div class="form-group">
									<input class="form-control" name='title' placeholder='게임 제목'>
								</div>
							</td>
							<td colspan="4">
								<div style="padding: 5px; float: right;">
									<button type="reset" class="btn btn-warning"
										style="padding: 5px;">재작성</button>
									<button type="submit" class="btn btn-success"
										style="padding: 5px;">등록</button>
								</div>
							</td>
						</tr>
						<tr>
							<td><div class="form-group" style="padding: 5px;">
									<label>개발사</label> <input class="form-control" name='dev'
										placeholder='개발사'>
								</div></td>
							<td><div class="form-group" style="padding: 5px;">
									<label>유통사</label> <input class="form-control" name='publisher'
										placeholder='유통사'>
								</div></td>
							<td><div class="form-group" style="padding: 5px;">
									<label>한국어 지원</label> <input class="form-control" name='korean'
										placeholder='한국어 지원/미지원'>
								</div></td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>플랫폼</label> <input class="form-control" name='platform'
										placeholder='플랫폼'>
								</div>
							</td>

							<td>
								<div class="form-group" style="padding: 5px;">
									<label>정상가</label> <input class="form-control" name='price'
										placeholder='정상가'>
								</div>
							</td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>할인가</label> <input class="form-control"
										name='sale_price' placeholder='할인가'>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>할인 적용</label> <input class="form-control"
										name='sale_enabled' placeholder='적용: 1, 미적용: 0'>
								</div>
							</td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>출시 일자</label> <input class="form-control"
										name='relase_date' placeholder='yy/MM/dd'>
								</div>
							</td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>장르</label> <input class="form-control" name='genre_id'
										placeholder='장르의 id 입력'>
								</div>
							</td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>플레이 지원</label> <input class="form-control"
										name='size_id' placeholder='플레이 지원의 id 입력'>
								</div>
							</td>
							<td>
								<div class="form-group" style="padding: 5px;">
									<label>요구사양</label> <input class="form-control" name='rec_id'
										placeholder='추후 수정 예정, 1입력'>
								</div>
							</td>
							<td>
								<div class="form-group"
									style="display: inline-block; padding: 5px;">
									<label>게임 타이틀 이미지 등록</label> <input type="file"
										class="form-control" name='uploadFile'>
								</div>
							</td>
						</tr>
					</table>

					<div class="form-group">
						<!-- 		 include libraries(jQuery, bootstrap)
						<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
						<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
						<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

						include summernote css/js
						<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
						<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->


						<link
							href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
							rel="stylesheet">
						<script
							src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
						<label>상세 설명</label>
						<textarea class="form-control" id="summernote" name='info'></textarea>
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

					<!--<div class="form-group">
            <label>Writer</label> <input class="form-control" name='writer'>
          </div> -->

					<!--<div class="form-group">
            <label>게시자</label> <input class="form-control" name='writer' 
                value='<sec:authentication property="principal.username"/>' readonly="readonly">
          </div> -->

					<div class="form-group" style="display: inline-block">
						<label>이미지 등록 2</label> <input type="file" class="form-control"
							name='uploadFile'>
					</div>

					<div class="form-group" style="display: inline-block">
						<label>이미지 등록 3</label> <input type="file" class="form-control"
							name='uploadFile'>
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
<%@include file="includes/footer.jsp"%>
