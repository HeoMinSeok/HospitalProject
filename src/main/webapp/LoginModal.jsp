<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="css/LoginModal.css" type="text/css" />
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="heading" >Sign In</h5>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
            </div>
            <div class="modal-body">
                <form action="/login" class="form" method="post" onsubmit="return validateForm(this);">
                    <input required="" class="input" type="text" name="user_id" id="user_id" placeholder="ID">
                    <input required="" class="input" type="password" name="password" id="password" placeholder="PASSWORD">
                    <span class="forgot-password"><a href="#">Forgot Password ?</a></span>
                    <input class="login-button" type="submit" value="Sign In">
                    <input type="button" class="join-button" value="Join In" onclick="location.href='terms.jsp'">
                </form>
                <span class="agreement"><a href="#">Learn user licence agreement</a></span>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 모달 띄우기
    document.addEventListener('DOMContentLoaded', function () {
        var myModal = new bootstrap.Modal(document.getElementById('loginModal'), {
            keyboard: false
        });

        myModal.show();
    });
</script>
</body>
</html>