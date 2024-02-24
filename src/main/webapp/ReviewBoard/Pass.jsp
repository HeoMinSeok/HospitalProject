<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>PONI</title>
    <link rel="stylesheet" href="../css/Pass.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script type="text/javascript">
      function validateForm(form){
        if(form.password.value === "") {
          alert("비밀번호를 입력하세요.");
          form.password.focus();
          return false;
        }
      }
    </script>
</head>
<body>
<form name="writeFrm" method="post" action="../pass" onsubmit="return validateForm(this);">
  <input type="hidden" name="rbNum" value="${ param.rbNum }">
  <input type="hidden" name="mode" value="${ param.mode }">
    <div class="box-container">
        <div class="box">
            <input type="password" name="password" placeholder="비밀번호를 입력해주세요.">
            <span></span>
        </div>
        <button type="submit"> 확인 </button>
    </div>
</form>
</body>
</html>
