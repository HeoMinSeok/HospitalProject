document.addEventListener('DOMContentLoaded', function () {
    const domainListEl = document.querySelector('#domain-list');
    const email1InputEl = document.querySelector('#email1');
    const email2InputEl = document.querySelector('#email2');

    domainListEl.addEventListener('change', function (event) {
        if (event.target.value !== "type") {
            email2InputEl.value = event.target.value;
            email2InputEl.disabled = true;
        } else {
            email2InputEl.value = "";
            email2InputEl.disabled = false;
        }
    });
});
document.addEventListener('DOMContentLoaded', function () {
    const userIdInput = document.querySelector('#inputid6');
    const checkDuplicateButton = document.querySelector('.btn-primary');

    checkDuplicateButton.addEventListener('click', function () {
        const userId = userIdInput.value.trim(); // 입력된 아이디

        // AJAX를 사용하여 서버에 중복된 아이디 확인 요청
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText);

                    if (response.isDuplicate) {
                        alert('이미 사용중인 아이디입니다.');
                        userIdInput.value = ''; // 입력 필드 초기화
                    } else {
                        alert('사용 가능한 아이디입니다.');
                    }
                } else {
                    alert('중복 확인에 실패하였습니다.');
                }
            }
        };

        xhr.open('POST', '/checkDuplicate', true);
        xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
        xhr.send(JSON.stringify({ userId: userId }));
    });
});

