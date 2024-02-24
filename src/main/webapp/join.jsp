<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="stylesheet" href="css/join.css">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
</head>
<body>

<!-- 회원가입 폼 모달 -->
<div class="modal fade" id="joinModal" tabindex="-1" aria-labelledby="joinModalLabel" aria-hidden="true" style="background-color: rgba(0, 0, 0, 0.4);">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <form action="register" method="post" class="validation-form" novalidate id="myJoinForm">
        <div class="modal-header">
          <h5 class="modal-title" id="joinModalLabel">회원가입</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">

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

            <div class="col-auto" >
              <input type="button" id="datepicker" value="생년월일 선택" style="border-radius: 5px; padding: 6px 12px; width: 150px; background-color: white; border: 1px solid #dee2e6;">
            </div>
            <div class="col-auto">
              <input type="text" id="yy" name="yy" placeholder="년도" style="border-radius: 5px; padding: 6px 12px; width: 150px; border: 1px solid #dee2e6;">
            </div>
            <div class="col-auto">
              <input type="text" id="mm" name="mm" placeholder="월" style="border-radius: 5px; padding: 6px 12px; width: 150px; border: 1px solid #dee2e6;">
            </div>
            <div class="col-auto">
              <input type="text" id="dd" name="dd" placeholder="일" style="border-radius: 5px; padding: 6px 12px; width: 150px; border: 1px solid #dee2e6;">
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
              <input type="text" class="form-control" name="addr1" id="inputaddr1">
            </div>
          </div><br/>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-outline-primary">회원가입</button>
          <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" onclick="location.href='modal.jsp'">취소</button>
        </div>
      </form>
    </div>
  </div>
</div>
<%--<script src="./js/modal.js" type="text/javascript"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>

  // 모달 띄우기
  document.addEventListener('DOMContentLoaded', function () {
    var myModal = new bootstrap.Modal(document.getElementById('joinModal'), {
      keyboard: false
    });
    myModal.show();
  });
</script>
</body>
</html>

