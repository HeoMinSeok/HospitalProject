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
$(document).ready(function () {
    $("#datepicker").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        yearRange: '-100:+0',
        onSelect: function (dateText, inst) {
            var selectedDate = new Date(dateText);
            $("#yy").val(selectedDate.getFullYear());
            $("#mm").val(selectedDate.getMonth() + 1);
            $("#dd").val(selectedDate.getDate());
        }
    });
});
