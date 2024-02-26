<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>의사 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/join.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>


<body>
<form action="/AdminPage/DocUpdate.do" method="post" class="validation-form" novalidate>
    <%--  의사 고유번호 불러오기--%>
    <input type="hidden" name="doc_num" value="${dto.doc_num}"/>
    <h4 class="mb-3"><br>의사 정보 수정</h4>
    <hr> <br/>
    <!-- 아이디 -->
    <div class="row g-3 align-items-center">
        <div class="col-auto">
            <label for="inputid6" class="col-form-label">아이디 <em> * </em></label>
        </div>
        <div class="col-auto">
            <%--  의사 아이디 불러오기 (수정불가)--%>
            <input type="text" value="${dto.doc_id}" id="inputid6" name="doc_id"  class="form-control" aria-describedby="idHelpInline"  readonly/>
        </div>
        <div class="col-auto">
            <button type="button" class="btn btn-primary">중복확인</button>
            <span id="idHelpInline" class="form-text">
        영문, 숫자 조합으로 6~20자 이하로 입력하세요.
      </span>
        </div>
    </div><br/>

    <!-- 비밀번호 -->
    <div class="row g-3 align-items-center">
        <div class="col-auto">
            <label for="inputPassword6"  class="col-form-label">비밀번호 <em> * </em></label>
        </div>
        <div class="col-auto">
            <%--  의사 비밀번호 불러오기--%>
            <input type="password" value="${dto.doc_pw}" id="inputPassword6" name="doc_pw" class="form-control" aria-describedby="passwordHelpInline" required>
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
            <label for="inputPassword6" class="col-form-label">비밀번호 확인 <em> * </em></label>
        </div>
        <div class="col-auto">
            <%--  의사 비밀번호 불러오기--%>
            <input type="password" value="${dto.doc_pw}" id="inputPassword6_1" class="form-control" aria-describedby="passwordHelpInline" required>
        </div>
        <div class="col-auto">
      <span id="password1HelpInline" class="form-text">
        비밀번호 확인을 위해 다시 한 번 입력하세요.
      </span>
        </div>
    </div> <br/>


    <!-- 이메일 -->
    <div class="row g-3 align-items-center">
        <div class="col-auto">
            <label class="col-form-label">이메일</label>
        </div>
        <%--  의사 이메일 불러오기--%>
        <div  class="col-auto">
            <input class="form-control" value="${doc_email1}" type="text" name="doc_email1" id="email1">
        </div>
        <div  class="col-auto">
            <input class="form-control" value="${doc_emaildomain}" type="text" name="doc_email2" id="email2">
        </div>
        <div class="col-auto">
            <select class="form-select" name="doc_emailDomain" aria-label="Default select example" id="domain-list">
                <option value="type">:: 직접 입력 ::</option>
                <option value="naver.com">naver.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="nate.com">nate.com</option>
                <option value="kakao.com">kakao.com</option>
                <!-- 다른 이메일 도메인 추가 -->
            </select>
        </div><br/>
        <!-- 이름 -->
        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <label for="name" class="col-form-label">이름 <em> * </em></label>
            </div>
            <div class="col-auto">
                <%--  의사 이름 불러오기--%>
                <input type="text" value="${dto.doc_name}" id="name" name="doc_name" class="form-control" aria-describedby="nameHelpInline" required>
            </div>
        </div><br/>
        <script src="../js/join.js"></script>
    </div> <br/>


    <hr><br/>

    <div class="modal-footer">
        <button type="submit" class="btn btn-outline-primary">수정</button>&nbsp&nbsp
        <button type="button"  onclick="location.href='/AdminPage/DocList.do';" class="btn btn-outline-secondary">취소</button>
    </div>
</form>
</body>
</html>