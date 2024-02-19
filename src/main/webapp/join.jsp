<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="stylesheet" href="css/join.css">

<body>
<%--<div class="container">--%>
<%--  <div class="input-form-backgroud row">--%>
<%--    <div class="input-form col-md-12 mx-auto">--%>
<%--      <h4 class="mb-3">회원가입</h4>--%>
<%--      <hr> <br/>--%>

<%--      <form class="validation-form" novalidate>--%>
<%--        &lt;%&ndash; 아이디 &ndash;%&gt;--%>
<%--        <div class="row g-3 align-items-center">--%>
<%--          <div class="col-auto">--%>
<%--            <label for="inputid6" class="col-form-label">아이디 <em> * </em></label>--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--            <input type="text" id="inputid6" class="form-control" aria-describedby="idHelpInline">--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--            <button type="button" class="btn btn-primary">중복확인</button>--%>
<%--            <span id="idHelpInline" class="form-text">--%>
<%--                         영문, 숫자 조합으로 6~20자 이하로 입력하세요.--%>
<%--                    </span>--%>
<%--          </div>--%>
<%--        </div><br/>--%>

<%--        &lt;%&ndash; 비밀번호 &ndash;%&gt;--%>
<%--        <div class="row g-3 align-items-center">--%>
<%--          <div class="col-auto">--%>
<%--            <label for="inputPassword6" class="col-form-label">비밀번호 <em> * </em></label>--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--            <input type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--                    <span id="passwordHelpInline" class="form-text">--%>
<%--                        8~12자의 (필수조건 영문+숫자)영문,숫자,특문을 조합하셔서 공백없이 기입하세요.--%>
<%--                    </span>--%>
<%--          </div> <br/>--%>
<%--        </div> <br/>--%>

<%--        &lt;%&ndash; 비밀번호 확인 &ndash;%&gt;--%>
<%--        <div class="row g-3 align-items-center">--%>
<%--          <div class="col-auto">--%>
<%--            <label for="inputPassword6" class="col-form-label">비밀번호 확인 <em> * </em></label>--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--            <input type="password" id="inputPassword6_1" class="form-control" aria-describedby="passwordHelpInline">--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--                        <span id="passwor1dHelpInline" class="form-text">--%>
<%--                            비밀번호 확인을 위해 다시 한 번 입력하세요.--%>
<%--                        </span>--%>
<%--          </div>--%>
<%--        </div> <br/>--%>

<%--        &lt;%&ndash; 이름 &ndash;%&gt;--%>
<%--        <div class="row g-3 align-items-center">--%>
<%--          <div class="col-auto">--%>
<%--            <label for="name" class="col-form-label">이름 <em> * </em></label>--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--            <input type="text" id="name" class="form-control" aria-describedby="nameHelpInline">--%>
<%--          </div>--%>
<%--        </div><br/>--%>

<%--        &lt;%&ndash; 전화번호 &ndash;%&gt;--%>
<%--        <div class="row g-3 align-items-center">--%>
<%--          <div class="col-auto">--%>
<%--            <label class="col-form-label">전화번호 <em> * </em></label>--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--            <select class="form-select" aria-label="Default select example">--%>
<%--              <option selected>:: 선택 ::</option>--%>
<%--              <option value="1">010</option>--%>
<%--              <option value="2">011</option>--%>
<%--              <option value="3">016</option>--%>
<%--              <option value="4">017</option>--%>
<%--              <option value="5">018</option>--%>
<%--              <option value="6">019</option>--%>
<%--            </select>--%>
<%--          </div> _--%>
<%--          <div class="col-auto">--%>
<%--            <input class="form-control" type="tel" name="tel" id="tel1"/>--%>
<%--          </div> _--%>
<%--          <div class="col-auto">--%>
<%--            <input class="form-control" type="tel" name="tel" id="tel2"/>--%>
<%--          </div>--%>
<%--        </div><br/>--%>

<%--        &lt;%&ndash; 생년월일 &ndash;%&gt;--%>
<%--        <div class="row g-3 align-items-center">--%>
<%--          <div class="col-auto">--%>
<%--            <label class="col-form-label">생년월일 <em> * </em></label>--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--            <input class="form-control" type="text" name="birth" id="yy" placeholder="년(4자리)" maxlength="4"/>--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--            <select class="form-select" id="mm" id="exampleSelect1">--%>
<%--              <option selected>월</option>--%>
<%--              <option>1월</option>--%>
<%--              <option>2월</option>--%>
<%--              <option>3월</option>--%>
<%--              <option>4월</option>--%>
<%--              <option>5월</option>--%>
<%--              <option>6월</option>--%>
<%--              <option>7월</option>--%>
<%--              <option>8월</option>--%>
<%--              <option>9월</option>--%>
<%--              <option>10월</option>--%>
<%--              <option>11월</option>--%>
<%--              <option>12월</option>--%>
<%--            </select>--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--            <input class="form-control" type="text" name="birth" id="dd" placeholder="일" maxlength="2"/>--%>
<%--          </div>--%>
<%--        </div><br/>--%>

<%--        &lt;%&ndash; 성별 &ndash;%&gt;--%>
<%--        <div class="row g-3 align-items-center">--%>
<%--          <div class="col-auto">--%>
<%--            <label class="col-form-label">성별 <em> * </em></label>--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--            <select class="form-select" aria-label="Default select example">--%>
<%--              <option selected>:: 선택 ::</option>--%>
<%--              <option value="1">여자</option>--%>
<%--              <option value="2">남자</option>--%>
<%--            </select>--%>
<%--          </div>--%>
<%--        </div><br/>--%>

<%--        &lt;%&ndash; 이메일 &ndash;%&gt;--%>
<%--        <div class="row g-3 align-items-center">--%>
<%--          <div class="col-auto">--%>
<%--            <label class="col-form-label">이메일</label>--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--            <input class="form-control" type="text" name="email" id="email1"/>--%>
<%--          </div>@--%>
<%--          <div class="col-auto">--%>
<%--            <input class="form-control" type="text" name="email" id="email2"/>--%>
<%--          </div>--%>
<%--          <div class="col-auto">--%>
<%--            <select class="form-select" aria-label="Default select example">--%>
<%--              <option value="">:: 선택 ::</option>--%>
<%--              <option value="1">naver.com</option>--%>
<%--              <option value="2">gmail.com</option>--%>
<%--              <option value="3">hanmail.net</option>--%>
<%--              <option value="4">hotmail.com</option>--%>
<%--              <option value="5">korea.com</option>--%>
<%--              <option value="6">nate.com</option>--%>
<%--              <option value="7">yahoo.com</option>--%>
<%--            </select>--%>
<%--          </div>--%>
<%--        </div> <br/>--%>

<%--        &lt;%&ndash; 주소 &ndash;%&gt;--%>
<%--        <div class="row g-3 align-items-center">--%>
<%--          <div class="col-auto">--%>
<%--            <label class="col-form-label">주소</label>--%>
<%--          </div>--%>
<%--          <div class="col-sm-10">--%>
<%--            <input type="addr1" class="form-control" id="inputaddr1">--%>
<%--          </div>--%>
<%--        </div><br/>--%>
<%--        <hr><br/>--%>

<%--        <div class="modal-footer">--%>
<%--          <button type="button" class="btn btn-outline-primary">회원가입</button>&nbsp&nbsp--%>
<%--          <button type="button" class="btn btn-outline-secondary">취소</button>--%>
<%--        </div>--%>
<%--      </form>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>
<form action="register" method="post" class="validation-form" novalidate>
  <h4 class="mb-3">회원가입</h4>
  <hr> <br/>

  <!-- 아이디 -->
  <div class="row g-3 align-items-center">
    <div class="col-auto">
      <label for="inputid6" class="col-form-label">아이디 <em> * </em></label>
    </div>
    <div class="col-auto">
      <input type="text" id="inputid6" name="userId" class="form-control" aria-describedby="idHelpInline" required>
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
      <label for="inputPassword6" class="col-form-label">비밀번호 <em> * </em></label>
    </div>
    <div class="col-auto">
      <input type="password" id="inputPassword6" name="password" class="form-control" aria-describedby="passwordHelpInline" required>
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
      <input type="password" id="inputPassword6_1" class="form-control" aria-describedby="passwordHelpInline" required>
    </div>
    <div class="col-auto">
      <span id="passwor1dHelpInline" class="form-text">
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
      <input type="text" id="name" name="name" class="form-control" aria-describedby="nameHelpInline" required>
    </div>
  </div><br/>

  <!-- 전화번호 -->
  <div class="row g-3 align-items-center">
    <div class="col-auto">
      <label class="col-form-label">전화번호 <em> * </em></label>
    </div>
    <div class="col-auto">
      <select class="form-select" name="tel1" aria-label="Default select example" required>
        <option selected>:: 선택 ::</option>
        <option value="010">010</option>
        <option value="011">011</option>
        <option value="016">016</option>
        <option value="017">017</option>
        <option value="018">018</option>
        <option value="019">019</option>
      </select>
    </div>
    <div class="col-auto">
      <input class="form-control" type="tel" name="tel2" id="tel1" required>
    </div>
    <div class="col-auto">
      <input class="form-control" type="tel" name="tel3" id="tel2" required>
    </div>
  </div><br/>

  <!-- 생년월일 -->
  <div class="row g-3 align-items-center">
    <div class="col-auto">
      <label class="col-form-label">생년월일 <em> * </em></label>
    </div>
    <div class="col-auto">
      <input class="form-control" type="text" name="yy" id="yy" placeholder="년(4자리)" maxlength="4" required>
    </div>
    <div class="col-auto">
      <input class="form-control" type="text" name="mm" id="mm" placeholder="월" maxlength="2" required/>
<%--        <option selected>월</option>--%>
<%--        <option>1월</option>--%>
<%--        <option>2월</option>--%>
        <!-- 나머지 월 추가 -->
    </div>
    <div class="col-auto">
      <input class="form-control" type="text" name="dd" id="dd" placeholder="일" maxlength="2" required>
    </div>
  </div><br/>

  <!-- 성별 -->
  <div class="row g-3 align-items-center">
    <div class="col-auto">
      <label class="col-form-label">성별 <em> * </em></label>
    </div>
    <div class="col-auto">
      <select class="form-select" name="gender" aria-label="Default select example" required>
        <option selected>:: 선택 ::</option>
        <option value="여자">여자</option>
        <option value="남자">남자</option>
      </select>
    </div>
  </div><br/>

  <!-- 이메일 -->
  <div class="row g-3 align-items-center">
    <div class="col-auto">
      <label class="col-form-label">이메일</label>
    </div>
    <div class="col-auto">
      <input class="form-control" type="text" name="email1" id="email1">
    </div>
    <div class="col-auto">
      <input class="form-control" type="text" name="email2" id="email2">
    </div>
    <div class="col-auto">
      <select class="form-select" name="emailDomain" aria-label="Default select example" id="domain-list">
        <option value="type">:: 직접 입력 ::</option>
        <option value="naver.com">naver.com</option>
        <option value="gmail.com">gmail.com</option>
        <option value="nate.com">nate.com</option>
        <option value="kakao.com">kakao.com</option>
        <!-- 다른 이메일 도메인 추가 -->
      </select>
    </div>
    <script src="js/join.js"></script>
  </div> <br/>

  <!-- 주소 -->
  <div class="row g-3 align-items-center">
    <div class="col-auto">
      <label class="col-form-label">주소</label>
    </div>
    <div class="col-sm-10">
      <input type="addr1" class="form-control" name="address" id="inputaddr1">
    </div>
  </div><br/>

  <hr><br/>

  <div class="modal-footer">
    <button type="submit" class="btn btn-outline-primary">회원가입</button>&nbsp&nbsp
    <button type="button" class="btn btn-outline-secondary">취소</button>
  </div>
</form>
</body>
</html>
