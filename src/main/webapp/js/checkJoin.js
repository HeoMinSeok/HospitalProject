// ID 유효성
//
//
document.addEventListener("DOMContentLoaded", function() {
    var duplicateBtn = document.querySelector(".btn.btn-primary");
    duplicateBtn.onclick = checkDuplicate;
});

function checkDuplicate() {
    var id = document.getElementById("inputid6").value;
    var duplicateMessage = document.getElementById("duplicateMessage");

    if (id === "") {
        alert("ID를 입력해주세요.");
        return;
    }
    var idRegex = /^[a-zA-Z0-9]{6,20}$/;
    if (!idRegex.test(id)) {
        alert("영문자와 숫자 조합으로 6~20자 이하로 입력해주세요.");
        return;
    }
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/duplicateCheck", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = xhr.responseText;
            if (response === "duplicate") {
                duplicateMessage.textContent = " 중복된 ID입니다. 다른 ID를 사용해주세요.";
                duplicateMessage.style.color = "red";
            } else {
                duplicateMessage.textContent = " 사용 가능한 ID입니다";
                duplicateMessage.style.color = "green";
            }
            setTimeout(function() {
                duplicateMessage.textContent = "";
            }, 3000);
        }
    };
    var data = "id=" + encodeURIComponent(id);

    xhr.send(data);
}
// 패스워드 유효성
//
//

