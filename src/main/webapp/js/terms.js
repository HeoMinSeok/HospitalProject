window.onload = function () {
    const checkAll = document.getElementById('chkAll');
    const chks = document.querySelectorAll('.chk');
    const chkBoxLength = chks.length;

    checkAll.addEventListener('click', function(event) {
        if(event.target.checked)  {
            chks.forEach(function(value){
                value.checked = true;
            })
        }else {
            chks.forEach(function(value){
                value.checked = false;
            })
        }
    });

    for (chk of chks){
        chk.addEventListener('click', function() {
            let count = 0;
            chks.forEach(function(value){
                if(value.checked == true){
                    count++;
                }
            })
            if(count !== chkBoxLength){
                checkAll.checked = false;
            }else{
                checkAll.checked = true;
            }
        })
    }
}

function checkAllAgreements(redirectUrl) {
    const chks = document.querySelectorAll('.chk');
    let allChecked = true;

    for (chk of chks) {
        if (!chk.checked) {
            allChecked = false;
            break;
        }
    }

    if (allChecked) {
        // 모든 약관에 동의한 경우 다음 단계로 이동
        window.location.href = 'join.jsp';
    } else {
        // 하나라도 체크가 안된 경우 이동을 막음
        alert("회원약관에 모두 체크하셔야 합니다.");
        return false;
    }
}






