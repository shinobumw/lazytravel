<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.lazytravel.customer.entity.Customer" %>

<%
  Customer customer = (Customer) session.getAttribute("customer");
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>會員中心 - 修改會員資料</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

  <link rel="icon" href="../static/images/logo.ico" type="image/x-icon">


  <style>
      #preview {
          border: 1px solid lightgray;
          display: inline-block;
          width: 150px;
          min-height: 150px;
          position: relative;
      }

      #preview span.text {
          position: absolute;
          display: inline-block;
          left: 50%;
          top: 50%;
          transform: translate(-50%, -50%);
          z-index: -1;
          color: lightgray;
      }

      #preview img.preview_img {
          width: 100%;
      }
  </style>

</head>

<body>
<header id="header"></header>

<div class="container d-flex justify-content-center mb-5">
  <form method="post" action="customer.do" class="row border m-3 p-3 rounded-3">
    <h2 class="mb-4">修改會員資料</h2>
    <div class="col-md-4 mb-3">
      <label for="staticId" class="col-sm-2 col-form-label">會員ID</label>
      <div class="col-sm-10">
        <input type="text" readonly class="form-control-plaintext" id="staticId" value="<%= customer.getCustomerId() %>">
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="staticPoint" class="col-sm-2 col-form-label">會員金</label>
      <div class="col-sm-10">
        <input type="text" readonly class="form-control-plaintext" id="staticPoint" value="<%= customer.getCustomerPoint() %>">
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <div id="preview">
        <span class="text">預覽圖</span>
      </div>
    </div>
    <div class="col-12 mb-3">
      <label for="inputEmail" class="form-label">Email 信箱</label>
      <input type="email" name="email" class="form-control" id="inputEmail" placeholder="name@gmail.com" required>
      <div class="invalid-feedback">
        請輸入正確的Email格式
      </div>
    </div>
    <div class="col-12 mb-3">
      <label for="inputAvatar" class="form-label">大頭貼</label>
      <input type="file" class="form-control" id="inputAvatar">
    </div>
    <div class="col-md-5 mb-3">
      <label for="inputName" class="form-label">姓名</label>
      <input type="text" name="customer_name" class="form-control" id="inputName" required>
      <div class="valid-feedback">
        輸入正確
      </div>
      <div class="invalid-feedback">
        請輸入姓名
      </div>
    </div>
    <div class="col-md-5 mb-3">
      <label for="inputNickname" class="form-label">暱稱</label>
      <input type="text" name="nickname" class="form-control" id="inputNickname" required>
    </div>
    <div class="col-md-2 mb-3">
      <label for="inputSex" class="form-label">性別</label>
      <select name="sex" id="inputSex" class="form-select">
        <option value="0" selected>男</option>
        <option value="1">女</option>
      </select>
    </div>
    <div class="col-md-4 mb-3">
      <label for="inputPhone" class="form-label">手機號碼</label>
      <input type="text" name="phone" class="form-control" id="inputPhone" required>
    </div>
    <div class="col-md-4 mb-3">
      <label for="inputIdno" class="form-label">身份證</label>
      <input type="text" name="idno" class="form-control" id="inputIdno" required>
    </div>
    <div class="col-md-4 mb-3">
      <label for="inputDate" class="form-label">生日</label>
      <input type="date" name="birth" class="form-control" id="inputDate" required>
    </div>
    <div class="col-12 mb-3">
      <label for="inputAddress" class="form-label">地址</label>
      <input type="text" name="address" class="form-control" id="inputAddress" required>
    </div>
    <div class="col-md-6 mt-3">
      <input type="hidden" name="action" value="signup">
      <button type="submit" id="btn-confirm" class="btn w-100" style="background-color: #6B705C;">
        <span class="text-light">確認</span></button>
    </div>
    <div class="col-md-6 mt-3">
      <input type="hidden" name="action" value="signup">
      <button type="submit" id="btn-cancell" class="btn w-100" style="background-color: #B7B7A4;">
        <span class="text-light">取消</span></button>
    </div>
  </form>
</div>

<footer id="footer"></footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script>
    $(function () {
        $("#header").load("<%=request.getContextPath()%>/components/html/header.jsp");
        $("#footer").load("<%=request.getContextPath()%>/components/html/footer.jsp");
    });

    $("#btn-signup").on("click", function () {

    });

</script>
</body>

</html>