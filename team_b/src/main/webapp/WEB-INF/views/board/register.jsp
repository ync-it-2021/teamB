<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/board/register" method="post"
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
					<div class="form-group">
						<label>게임 제목</label> <input class="form-control" name='title'>
					</div>

					<div class="form-group">
						<label>개발사</label> <input class="form-control" name='dev'>
					</div>

					<div class="form-group">
						<label>유통사</label> <input class="form-control" name='publisher'>
					</div>

					<div class="form-group">
						<label>한국어 지원</label> <input class="form-control" name='korean'>
					</div>

					<div class="form-group">
						<label>플랫폼</label> <input class="form-control" name='platform'>
					</div>

					<div class="form-group">
						<label>정상가</label> <input class="form-control" name='price'>
					</div>

					<div class="form-group">
						<label>할인가</label> <input class="form-control" name='sale_price'>
					</div>

					<div class="form-group">
						<label>세일 적용</label> <input class="form-control"
							name='sale_enabled'>
					</div>
					<div class="form-group">
						<label>출시 일자 YY/MM/DD</label> <input class="form-control"
							name='relase_date'>
					</div>

					<div class="form-group">
						<label>장르</label> <input class="form-control" name='genre_id'>
					</div>
					<div class="form-group">
						<label>플레이 지원</label> <input class="form-control" name='size_id'>
					</div>
					<div class="form-group">
						<label>요구사양</label> <input class="form-control" name='rec_id'>
					</div>

					<div class="form-group">
						<label>상세 설명</label>
						<textarea class="form-control" rows="3" name='content'></textarea>
					</div>

					<!--<div class="form-group">
            <label>Writer</label> <input class="form-control" name='writer'>
          </div> -->

					<!--<div class="form-group">
            <label>게시자</label> <input class="form-control" name='writer' 
                value='<sec:authentication property="principal.username"/>' readonly="readonly">
          </div> -->

					<div class="form-group">
						<label>이미지 등록 1</label> <input type="file" class="form-control"
							name='uploadFile'>
					</div>

					<div class="form-group">
						<label>이미지 등록 2</label> <input type="file" class="form-control"
							name='uploadFile'>
					</div>

					<div class="form-group">
						<label>이미지 등록 3</label> <input type="file" class="form-control"
							name='uploadFile'>
					</div>

					<button type="submit" class="btn btn-default">Submit
						Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
				</form>

			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp"%>
