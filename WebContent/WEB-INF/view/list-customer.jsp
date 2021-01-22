<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Customer Spring Demo</title>
	<link type ="text/css"
		  rel="stylesheet"
	 href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
	<div id="wrapper">
		<div id = "header">
			<h2>CRM - Customer Relationship Manager</h2>	
		</div>
	</div>
	<div id = "container">
		<div id = "contant">
			<!-- dodajemy przycisk dodania klienta -->
			<input type="button" value = "Add customer"
				   onclick="window.location.href='showFormForAdd'"
				   class="add-button"
			/>
			<!-- Dodajemy HTML tabele -->
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>	
				<!-- Zapetlamy i wyswietlamy liste klientow -->
				<c:forEach var="tempCustomer" items="${customers}">
				
					<!-- construct an update link with customer id -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}"></c:param> <!-- pobiera id klienta po nacisnieciu UPDATE -->
					</c:url>
					<!-- construct a delete link with customer id -->
					<c:url var="deleteLink" value="/customer/showFormForDelete">
						<c:param name="customerId" value="${tempCustomer.id}"></c:param> <!-- pobiera id klienta po nacisnieciu UPDATE -->
					</c:url>
					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						<!-- display the update link -->
						<td>
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}" onclick="if(!(confirm('napewno usunac?')))return false">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>