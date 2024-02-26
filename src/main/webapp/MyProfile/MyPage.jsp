<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
</head>
<body>
<!-- My Profile 모달 창 -->
<div class="modal fade" id="myProfileModal" tabindex="-1" aria-labelledby="myProfileModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myProfileModalLabel">My Profile</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="margin: 30px; text-align: center;">
                <!-- 수정 버튼 -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifyModal" style="margin-bottom: 2%" onclick="location.href='/update';">수정</button>

                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reservationModal" style="margin-bottom: 2%" onclick="location.href='/PatAppoint';">예약 현황</button>
                <!-- 작성 글 버튼 -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#writeModal" style="margin-bottom: 2%" onclick="location.href='/mylist';">작성 글</button>
            </div>
        </div>
    </div>
</div>

<!-- 수정 모달 창 -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="modifyModalLabel" aria-hidden="true">
    <!-- 수정 모달 내용 -->
</div>

<!-- 예약 현황 모달 창 -->
<div class="modal fade" id="reservationModal" tabindex="-1" aria-labelledby="reservationModalLabel" aria-hidden="true">
    <!-- 예약 현황 모달 내용 -->
</div>

<!-- 작성 글 모달 창 -->
<div class="modal fade" id="writeModal" tabindex="-1" aria-labelledby="writeModalLabel" aria-hidden="true">
    <!-- 작성 글 모달 내용 -->
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // My Profile 모달 띄우기
    document.addEventListener('DOMContentLoaded', function () {
        var myProfileModal = new bootstrap.Modal(document.getElementById('myProfileModal'));
        myProfileModal.show();

        // 모달 닫기(close) 버튼 이벤트 처리
        var closeModalBtn = document.querySelector('#myProfileModal .btn-close');
        closeModalBtn.addEventListener('click', function () {
            window.location.href = 'index.jsp'; // index.jsp로 이동
        });
    });
</script>
</body>
</html>