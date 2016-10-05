<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.springdemo.models.UserDetails" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="mytags" uri="/mytags" %>
	<b><h3>${message}</h3></b>
	<table class="flatTable">
		<tr class="titleTr">
			<td><b>user_id</b></td>
			<td>&nbsp;</td>
			<td><b>user_name</b></td>
			<td>&nbsp;</td>
			<td><b>phone_number</b></td>
			<td><b>Actions</b></td>
		</tr>
		<c:choose>
			<c:when test="${fn:length(userDetails) > 0}">
				<c:forEach var="user" items="${userDetails}">
				    <tr class="record" id="record_${user.getUserId()}">
					    <td><c:out value="${user.getUserId()}"/></td>
						<td>&nbsp;</td>
						<td><c:out value="${user.getUserName()}"/></td>
						<td>&nbsp;</td>
						<td><mytags:phoneNumberFormatter phoneNumber="${user.getPhoneNumber()}"/></td>
						<td><a href="UserAdd?userId=${user.getUserId()}">Edit</a> | <a class="deleteUser" id="${user.getUserId()}" href="#">Delete</a></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr><td><b>No Records!</b></td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
			</c:otherwise>
		</c:choose>
	</table>
<%@ include file="/footer.jsp" %>