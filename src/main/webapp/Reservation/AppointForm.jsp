<%@ page import="java.util.List" %>
<%@ page import="com.membership.DocDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약</title>
    <link href="../css/AppointForm.css" rel="stylesheet">
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <form action="../Reservation/Appoint.do" method="post">
            <h1> 예약하기 </h1>

            <fieldset>
                <input type="hidden" name="pId" value="<%= session.getAttribute("UserId") %>">
                <span>작성자 : ${ sessionScope.UserName }</span>
            </fieldset>

            <fieldset>
                <label for="doctor">의사</label>
                <select id="doctor" name="docID">
                    <option value="">의사 선택</option>
                    <c:forEach var="doctor" items="${ doctors }">
                        <option value="${ doctor.doc_id }">${ doctor.doc_name }</option>
                    </c:forEach>
                </select>
                <input type="hidden" name="hiddenDocID" value="${ doctor.doc_id }">
            </fieldset>

            <fieldset>
                <div class="form-group">
                    <label for="appointment-date">진료 날짜</label>
                    <input type="date" id="appointment-date" name="selectedDate">
                </div>
            </fieldset>

            <fieldset>
                <div class="form-group">
                    <label for="appointment-time">진료 시간</label>
                    <select id="appointment-time" name="selectedTime">
                        <option value="09:00">9:00</option>
                        <option value="09:30">9:30</option>
                        <option value="10:00">10:00</option>
                        <option value="10:30">10:30</option>
                        <option value="10:00">11:00</option>
                        <option value="10:30">11:30</option>
                        <option value="10:00">12:00</option>
                        <option value="10:30">12:30</option>
                        <option value="15:30">13:00</option>
                        <option value="16:00">13:30</option>
                        <option value="15:30">14:00</option>
                        <option value="16:00">14:30</option>
                        <option value="15:30">15:00</option>3
                        <option value="16:00">15:30</option>
                        <option value="15:30">16:00</option>
                        <option value="16:00">16:30</option>
                    </select>
                </div>
            </fieldset>

            <button type="submit">제출하기</button>

        </form>
    </div>
</div>

</body>
</html>

