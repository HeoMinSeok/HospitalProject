function openModal() {
    var modal = document.getElementById("passModal");
    modal.style.display = "block";
}

function closeModal() {
    var modal = document.getElementById("passModal");
    modal.style.display = "none";
}
function openModalAndSendInfo(mode, rbNum) {
    // 모달 창 열기
    openModal();

    // 모드 값과 rbNum을 URL에 추가하여 AJAX 요청 보내기
    var password = document.getElementById("password").value; // 비밀번호 가져오기
    var url = "/pass?mode=" + mode + "&rbnum=" + rbNum + "&password=" + password;
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // 성공적으로 처리된 경우
                console.log("삭제 요청이 성공적으로 전송되었습니다.");
                // 여기서 필요한 추가 작업 수행
            } else {
                // 오류 처리
                console.error("서버 오류 발생");
            }
        }
    };
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send(); // 데이터 없이 모드 값만 전송
}
