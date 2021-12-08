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
.note-editable { background-color: #0b0c2a !important; color: white !important; }
</style>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">새 뉴스 작성</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">뉴스 편집기</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/reg_news" method="post"
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
									<input class="form-control" name='news_title' placeholder='뉴스 제목'>
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
									<label>작성자</label> <input class="form-control" name='userid'
										value='<sec:authentication property="principal.username"/>'
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
					
							<link href="/resources/vendor/plex/summernote-lite.css" rel="stylesheet" />
							<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
							<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/lang/summernote-ko-KR.js"></script>
						<label>상세 설명</label>
						<textarea class="form-control" id="summernote" name='news_contents'></textarea>
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
						<label>사이드 배너 이미지(직사각형 3:1 비율)</label> <input type="file" class="form-control"
							name='uploadFile'>
					</div>

					<div class="form-group" style="display: inline-block">
						<label>기타 이미지</label> <input type="file" class="form-control"
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
