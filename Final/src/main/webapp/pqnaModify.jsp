<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Market Detail View</title>
<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	.qna-wrap{
		padding-top:80px;
		padding-left: 10px;
		padding-right: 10px;
		position:relative;
		width:1320px;	
		margin:0 auto;
		background-color: yellow;
	}
	.qna-list{
		width:100%;
		padding : 10px;
		margin:0 auto;
		text-align: center;
		
	}
</style>
<script type="text/javascript">
	function prdqna(){ 	//상품 qna 등록하기
		prdqna.submit();
	}
</script>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	
	
	
<!-- 상품 QNA 수정/삭제/댓글 시작 -->
	
	<div class="qna-wrap">
		<div class="qna-title">
			<div>QnA</div>
			구매하시려는 상품에 대한 궁금점이 있으면 문의주세요.<br>
            <button type="button" class="btn btn-primary" class="btn" data-bs-toggle="modal" data-bs-target="#modal-qna">
			문의하기</button>
		</div>
			<section>
				<form name="prdqna" role="form" method="post" action="">
					<table class="qna-list" border="1">
						<tbody>
							<tr height="50">
								<th width="10%">상태</th><th width="60%">제목</th><th width="15%">작성자</th><th width="15%">등록일</th>
							</tr>
							<tr  height="50">
								<td>
									<c:choose>
										<c:when test="${prd_qna_status == 1}">
											<div>답변대기</div>
										</c:when>
										<c:otherwise>
											<div>답변완료</div>
										</c:otherwise>
									</c:choose>
								</td>
								<td ><span style="opacity:.5;">비밀글입니다.</span></td>
								<td>leejh*</td>
								<td>2022-12-10</td>
							</tr>
						</tbody>
					</table>
				</form>
			</section>
	</div>

	<!-- 1.QnA Modal -->
	<form action="" method="post" name="prdqna">
		<div class="modal fade" id="modal-qna" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel" style="font-family: sans-serif;">Q&A</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body mb-3">
						<label for="message-text" class="col-form-label">Message:</label>
	            		<textarea class="form-control" id="message-text" placeholder="내용을 입력하세요."
	            				style="height:20em; resize:none;"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onclick="javascript:prdqna()">등록</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<!-- 2.QnA Modal Detail -->
	<form action="" method="post" name="prdqnadetail">
		<div class="modal fade" id="modal-qna" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel"
							style="font-family: sans-serif;">Q&A 상세</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body mb-3">
						<label for="message-text" class="col-form-label">Message:</label>
						<textarea class="form-control" id="message-text"
							style="height: 20em; resize: none;" value="${prdqnaContent}"></textarea>
					</div>

					<div id="reply">
						<ol class="replyList">
							<c:forEach items="${replyList}" var="replyList">
								<li>
									<p>
										작성자 : ${replyList.writer}<br /> 작성 날짜 :
										<fmt:formatDate value="${replyList.regdate}"
											pattern="yyyy-MM-dd" />
										<br /> 작성 내용 : ${replyList.content}
									</p>

									<div>
										<button type="button" class="replyUpdateBtn btn btn-warning"
											data-rno="${replyList.rno}">수정</button>
										<button type="button" class="replyDeleteBtn btn btn-danger"
											data-rno="${replyList.rno}">삭제</button>
									</div>
								</li>
							</c:forEach>
						</ol>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary"
							onclick="javascript:prdqna()">등록</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 상품 QNA 수정/삭제/댓글 끝 -->
	
	
	
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

	<script src="/resources/js/index/jquery.min.js"></script>
	<script src="/resources/js/index/owl.carousel.min.js"></script>
	<script src="/resources/js/index/app.js"></script>
</body>
</html>
