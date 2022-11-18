<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="display:flex; justify-content: center;">
	<div>
	<form method="post">
    		<div class="mb-3">
            	<input class="form-control" type="text" name="userName" placeholder="userName" required>
            </div>
            <div class="mb-3">
            <input class="form-control" type="password" name="passCode" placeholder="passCode" required>
            </div>
            <div class="mb-3">
             <input  class="btn btn-primary" type="submit" value="SIGN IN">
            <a href="AddCustomer.jsp" class="btn btn-primary">SIGN UP</a>
            </div>
           
            
    </form>
    </div>

     
</div>
<br>
    
   
    
    <c:if test="${param.userName != null && param.passCode != null}">
        <jsp:useBean id="customer" class="com.Infinite.inventoryproject.Customer"/>
        <jsp:setProperty property="*" name="customer"/>
        <jsp:useBean id="dao" class="com.Infinite.inventoryproject.CustomerDAO"/>
        <c:out value="${dao.authenticate(param.userName,param.passCode)}"/>


	
       <c:if test="${dao.authenticate(param.userName, param.passCode) > 0 }">
       		<c:set var="userName" value="${param.userName}" scope="session"></c:set>
            <jsp:forward page="CustomerMenu.jsp"/>
        </c:if>
    </c:if>
    
    
    
    
    </body>
</html>