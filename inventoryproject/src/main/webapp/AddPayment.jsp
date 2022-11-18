<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="beanDao" class="com.Infinite.inventoryproject.PaymentDAO"/>
<jsp:useBean id="orderDao" class="com.Infinite.inventoryproject.OrderDAO"/>
	<jsp:useBean id="stockDao" class="com.Infinite.inventoryproject.StockDAO"/>
	<c:set var="user" value="${userName}"/>
<form method="get"  action="AddPayment.jsp">
<center>	
   Customer User Name:
  <input type="text" name="customerName" value="${user}" readonly  /><br><br>   
   Customer ID:
  <input type="text" name="customerid" value="${cid }" readonly /><br><br>   
   Price:
   <input type="text" name="amt" value="${param.total}"><br><br>
	UPI:		 
		  <select name="walletType" id="language">
			  <option value="GPAY">GPAY</option>
			  <option value="PAYTM">PAYTM</option>
			  <option value="PHONEPAY">PHONEPAY</option>
		</select>
    <input type= "submit" value ="ADD">
    </center>
 </form>
 	<c:if test="${param.amt != null}">
		<jsp:useBean id="wallet" class="com.Infinite.inventoryproject.Wallet" />
		<jsp:useBean id="dao" class="com.Infinite.inventoryproject.WalletDAO"/>
		
		<jsp:setProperty property="*" name="wallet"/>
		
		<c:out value="${dao.addWallet(wallet)}" />
	</c:if>
 

</body>
</html>