<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="css/PatUpdate.css">
</head>

<body>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="../update" method="post" class="validation-form" novalidate>
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">나의 정보 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="pat_num" value="${dto.pat_num}"/>

                    <div class="row g-3 align-items-center">
                        <div class="col-auto">
                            <label for="inputid6" class="col-form-label">아이디 <em> * </em></label>
                        </div>

                        <div class="col-auto">
                            <input type="text" value="${dto.pat_id}" id="inputid6" name="pat_id"  class="form-control" aria-describedby="idHelpInline"  readonly/>
                        </div>
                    </div><br/>

                    <!-- 비밀번호 -->
                    <div class="row g-3 align-items-center">
                        <div class="col-auto">
                            <label for="inputPassword6"  class="col-form-label">새 비밀번호 <em> * </em></label>
                        </div>

                        <div class="col-auto">
                            <input type="password" value="${dto.pat_pw}" id="inputPassword6" name="pat_pw" class="form-control" aria-describedby="passwordHelpInline" required>
                        </div>

                        <div class="col-auto">
                            <span id="passwordHelpInline" class="form-text">
                                8~12자의 (필수조건 영문+숫자)영문,숫자,특문을 조합하셔서 공백없이 기입하세요.
                            </span>
                        </div> <br/>
                    </div> <br/>

                    <!-- 비밀번호 확인 -->
                    <div class="row g-3 align-items-center">
                        <div class="col-auto">
                            <label for="inputPassword6" class="col-form-label" >새 비밀번호 확인 <em> * </em></label>
                        </div>
                        <div class="col-auto">
                            <input type="password" value="${dto.pat_pw}" id="inputPassword6_1" class="form-control" aria-describedby="passwordHelpInline" required>
                        </div>
                        <div class="col-auto">
                            <span id="password1HelpInline" class="form-text">
                                비밀번호 확인을 위해 다시 한 번 입력하세요.
                            </span>
                        </div>
                    </div> <br/>

                    <!-- 이름 -->
                    <div class="row g-3 align-items-center">
                        <div class="col-auto">
                            <label for="name" class="col-form-label">이름 <em> * </em></label>
                        </div>
                        <div class="col-auto">
                            <input type="text" value="${dto.pat_name}" id="name" name="pat_name" class="form-control" aria-describedby="nameHelpInline" required>
                        </div>
                    </div><br/>

                    <!-- 전화번호 -->
                    <div class="row g-3 align-items-center">
                        <div class="col-auto">
                            <label class="col-form-label">전화번호 <em> * </em></label>
                        </div>

                        <div class="col-auto">
                            <select class="form-select" name="pat_phone1" aria-label="Default select example" required>
                                <option ${tel1 == '010' ? 'selected' : ''} value="010">010</option>
                                <option ${tel1 == '011' ? 'selected' : ''} value="011">011</option>
                                <option ${tel1 == '016' ? 'selected' : ''} value="016">016</option>
                                <option ${tel1 == '017' ? 'selected' : ''} value="017">017</option>
                                <option ${tel1 == '018' ? 'selected' : ''} value="018">018</option>
                                <option ${tel1 == '019' ? 'selected' : ''} value="019">019</option>
                            </select>
                        </div>

                        <div class="col-auto">
                            <input class="form-control" value="${tel2}" type="tel" name="pat_phone2" id="tel1" required>
                        </div>

                        <div class="col-auto">
                            <input class="form-control" value="${tel3}" type="tel" name="pat_phone3" id="tel2" required>
                        </div>
                    </div><br/>

                    <!-- 성별 -->
                    <div class="row g-3 align-items-center">
                        <div class="col-auto">
                            <label class="col-form-label">성별 <em> * </em></label>
                        </div>
                        <div class="col-auto">
                            <select class="form-select" name="pat_gen" aria-label="Default select example" required>
                                <option ${dto.pat_gen == '여자' ? 'selected' : ''} value="여자">여자</option>
                                <option ${dto.pat_gen == '남자' ? 'selected' : ''} value="남자">남자</option>
                            </select>
                        </div>
                    </div><br/>

                    <!-- 이메일 -->
                    <div class="row g-3 align-items-center">
                        <div class="col-auto">
                            <label class="col-form-label">이메일</label>
                        </div>

                        <div  class="col-auto">
                            <input class="form-control" value="${pat_email1}" type="text" name="pat_email1" id="email1">
                        </div>

                        <div  class="col-auto">
                            <input class="form-control" value="${pat_emaildomain}" type="text" name="pat_email2" id="email2">
                        </div>

                        <div class="col-auto">
                            <select class="form-select" name="pat_emailDomain" aria-label="Default select example" id="domain-list">
                                <option value="type">:: 직접 입력 ::</option>
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="nate.com">nate.com</option>
                                <option value="kakao.com">kakao.com</option>
                            </select>
                        </div>
                    </div> <br/>

                    <!-- 주소 -->
                    <div class="row g-3 align-items-center">
                        <div class="col-auto">
                            <label class="col-form-label">주소</label>
                        </div>
                        <div class="col-sm-10">
                            <input type="text"  value="${dto.pat_addr}" class="form-control" name="pat_addr" id="inputaddr1">
                        </div>
                    </div><br/>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-outline-primary">수정</button>&nbsp&nbsp
                        <button type="button"  onclick="location.href='MyPage.jsp';" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-..." crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-..." crossorigin="anonymous"></script>

<script>
    $(document).ready(function(){
        $("#exampleModal").modal('show');
    });
</script>
</body>
</html>