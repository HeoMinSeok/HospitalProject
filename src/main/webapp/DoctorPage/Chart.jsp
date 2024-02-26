<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="../css/chart.css" rel="stylesheet">
</head>

<body>
<form action="../Chart" class="container">
    <h2>EMR</h2>

    <div class="form-group row">
        <div class="col-sm-5" style="padding-left: 130px">
            <input type="hidden" name="eDocId" value="<%= session.getAttribute("UserId") %>">
            <input type="hidden" name="pat_id" value="<%= request.getParameter("pat_id") %>">
            <label for="write" class="col-form-label"><b>담당 의사</b></label>
            <input type="text" id="write" value="${ sessionScope.UserName }">
        </div>
        <div class="col-sm-5" style="padding-left: 130px">
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-5" style="padding-left: 130px">
            <label for="name" class="col-form-label"><b>환자 이름 :</b></label>
            <input type="text" name="patId" id="name" value="${ patients.pat_name }">
        </div>

        <div class="col-sm-5" style="padding-left: 130px">
            <label for="ebirth" class="col-form-label"><b>생년월일 :</b></label>
            <input type="text" id="ebirth" value="${ patients.pat_birth }">
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-5" style="padding-left: 130px">
            <label for="phone" class="col-form-label"><b>연락처 :</b></label>
            <input type="tel" id="phone" name="tel" value="${ patients.pat_phone}">
        </div>

        <div class="col-sm-5" style="padding-left: 130px">
            <label class="col-form-label"><b>성별 : </b></label>
            <input type="tel" id="pgen" name="gen" value="${ patients.pat_gen }">
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-5" style="padding-left: 130px">
            <label for="addr" class="col-form-label_adr"><b>주소 :</b></label>
            <input type="tel" id="addr" name="addr" value="${ patients.pat_addr}">
        </div>

        <div class="col-sm-5" style="padding-left: 130px">
            <label for="email" class="col-form-label"><b>이메일 :</b></label>
            <input type="text" id="email" name="email" value="${ patients.pat_email}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-form-lab"><b>특이사항&nbsp(해당 사항 없을 시 체크 x)</b></label><br/>

        <div id="checkbox-container">
            <input type="checkbox" id="allergy" name="pmh" value="알레르기">
            <label for="allergy" class="col-form-lb">알레르기</label>

            <input type="checkbox" id="hypertension" name="pmh" value="고혈압">
            <label for="hypertension" class="col-form-lb">고혈압</label>

            <input type="checkbox" id="pregnancy" name="pmh" value="임신">
            <label for="pregnancy" class="col-form-lb">임신</label><br/>

            <input type="checkbox" id="heart-disease" name="pmh" value="심장질환">
            <label for="heart-disease" class="col-form-lb">심장질환</label>

            <input type="checkbox" id="diabetes" name="pmh" value="당뇨병">
            <label for="diabetes" class="col-form-lb">당뇨병</label>

            <input type="checkbox" id="other-note" name="pmh" value="기타">
            <label for="other-note" class="col-form-lb">기타</label>
        </div>
    </div>

    <div class="form-group_content" style="padding-bottom: 10px">
        <label for="note" class="col-form-label"><b>내용</b></label>
    </div>
    <textarea id="note" name="contents"></textarea>

    <div class="buttons">
        <button type="submit" formmethod="post" class="btn btn-primary"
                style="background-color: dodgerblue; color: white; border: none; width: 30%; margin-top: 10px;;" onclick="location.href='../Chart';">확인
        </button>
        &nbsp
    </div>
</form>
</body>
</html>