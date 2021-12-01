 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="includes/header.jsp"%>
<style>
td {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">GAME_INFO</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">	
			<div class="panel-heading">
				Game_info
				<button id='regBtn' type="button" class="btn btn-success btn-xs pull-right">
					새로운 게임 등록
				</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover"
					style="table-layout:fixed">
					<thead>
						<tr>
							<th style="width:50px;">#</th>
							<th style="width:230px;">타이틀</th>
							<th style="width:110px;">한국어</th>
							<th style="width:110px;">개발사</th>
							<th style="width:110px;">유통사</th>
							<th style="width:60px;">플랫폼</th>
							<th>정상가</th>
							<th>할인가</th>
							<th style="width:50px;">할인적용</th>
							<th>출시일</th>
							<th>장르</th>
							<th>플레이 지원</th>
							<th style="width:58px;"></th>
						</tr>
					</thead>

					<c:forEach items="${games}" var="games">
						<tr>
							<td><c:out value="${games.game_num}" /></td>
							<%-- <td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td> --%>
							<td>
							<a href='detail?game_num=<c:out value="${games.game_num}"/>'><c:out value="${games.title}" /></a></td>
							<td><c:out value="${games.korean}" /></td>
							<td><c:out value="${games.dev}" /></td>
							<td><c:out value="${games.publisher}" /></td>
							<td><c:out value="${games.platform}" /></td>
							<td><c:out value="${games.price}" /></td>
							<td><c:out value="${games.sale_price}" /></td>
							<td><c:out value="${games.sale_enabled}" /></td>
							<td><c:out value="${games.relase_date}" /></td>
							<td><c:out value="${games.genre_name}" /></td>
							<td><c:out value="${games.size_name}" /></td>
							<td><sec:authentication property="principal" var="pinfo" /> 
							<sec:authorize access="isAuthenticated()">
							<div style="width:15px;">
									<a href="/modify?game_num=${games.game_num}" role="button"
										data-oper='modify' class="btn-sm btn-default"> <i
										class="fa fa-gear fa-fw"></i>
									</a>
										</div>
								</sec:authorize></td>
						</tr>
					</c:forEach>
				</table>
				
				<!-- 검색 영역 시작 -->
				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/list" method='get'>
							<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
							<input type='hidden' name='pageNum'	value='<c:out value="${pageMaker.cri.pageNum}"/>' />
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>
				<!-- 검색 영역 시작 -->
				
				<!--  Pagination 시작 -->
				<div class='pull-right'>
					<ul class="pagination">

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>

					</ul>
				</div>
				<!--  Pagination 끝 -->
				
				<!-- 페이징 Form 시작 -->
				<form id='actionForm' action="/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
				<input type='hidden' name='keyword'	value='<c:out value="${ pageMaker.cri.keyword }"/>'>
				</form>
				<!-- 페이징 Form 끝 -->
				
			
			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal">Save
								changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
</div>
<!-- /.row -->

<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		// replaceState(data, title [, url ]) 히스토리를 수정
		history.replaceState({}, null, null);

		function checkModal(result) {
			// alert(history.state);
			// 글 등록 후 리스트 화면에서 model창이 나온 뒤 새로고침을 해도 model창이 안나오도록
			// result값 체크
			// result값은 controller에서 넘어온 1회성 값으로 페이지를 다시 읽으면 null이된다.
			// history.state 는 조회에서 back 했을때 history객체의 현재 정보를 읽어 값이 있다면 
			// modal창을 띄우지 않는다.
			if (result === '' || history.state) {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html("새로운 게임 " + parseInt(result)	+ " 등록되었습니다.");
			}

			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click", function() {
			self.location = "/register";
		});
		
		var actionForm = $("#actionForm");

		// 페이지 번호 클릭 이벤트
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			// console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		// 상세보기 클릭 이벤트
		$(".move").on("click",function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href")	+ "'>");
			actionForm.attr("action", "/get");
			actionForm.submit();
		});
		
		// 검색 버튼 클릭 이벤트
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click",	function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
	});
</script>

<%@include file="includes/footer.jsp"%>
