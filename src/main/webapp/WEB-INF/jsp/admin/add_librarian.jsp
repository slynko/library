<%@ include file="/WEB-INF/jspf/directive/page.jspf"%>
<%@ include file="/WEB-INF/jspf/directive/taglib.jspf"%>

<html>

<c:url var="controllerUrl" value="controller" />
<c:set var="title" value="Add librarian" />
<%@ include file="/WEB-INF/jspf/head.jspf"%>

<body>
	<table id="main-container">
		<%@ include file="/WEB-INF/jspf/header.jspf"%>
		<tr>
			<td class="content center">
				<form id="sign_up_form" action="${controllerUrl}" method=post>
					<input type="hidden" name="command" value="addLibrarian" />
					<table class="table">
						<tr>
							<td colspan=2>
								<div class="alert alert-danger">
									<ul>
										<c:if test="${not empty fillInMessage}">
											<li>${fillInMessage}</li>
										</c:if>
										<c:if test="${not empty firstNameMessage}">
											<li>${firstNameMessage}</li>
										</c:if>
										<c:if test="${not empty lastNameMessage}">
											<li>${lastNameMessage}</li>
										</c:if>
										<c:if test="${not empty loginMessage}">
											<li>${loginMessage}</li>
										</c:if>
										<c:if test="${not empty emailMessage}">
											<li>${emailMessage}</li>
										</c:if>
										<c:if test="${not empty passwordMessage}">
											<li>${passwordMessage}</li>
										</c:if>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<th colspan=2><fmt:message key="signup.librarianRegistration" /><br> <sup>*</sup>
								<fmt:message key="signup.requiredFields" />
							</th>
						</tr>
						<tr>
							<td>
								<fieldset>
									<legend>
										<fmt:message key="signup.firstName" /><sup>*</sup>
									</legend>
									<input name="firstName" value="${firstName}" />
								</fieldset>
							</td>
							<td>
								<fieldset>
									<legend>
										<fmt:message key="signup.lastName" /><sup>*</sup>
									</legend>
									<input name="lastName" value="${lastName}" /><br />
								</fieldset>
							</td>
						</tr>
						<tr>
							<td>
								<fieldset>
									<legend>
										<fmt:message key="signup.login" /><sup>*</sup>
									</legend>
									<input name="login" value="${login}" /><br />
								</fieldset>
							</td>
							<td>
								<fieldset>
									<legend>
										<fmt:message key="signup.email" /><sup>*</sup>
									</legend>
									<input name="email" value="${email}" /><br />
								</fieldset>
							</td>
						</tr>
						<tr>
							<td>
								<fieldset>
									<legend>
										<fmt:message key="signup.password" /><sup>*</sup>
									</legend>
									<input name="password1" type="password" /><br />
								</fieldset>
							</td>
							<td>
								<fieldset>
									<legend>
										<fmt:message key="signup.confirmPassword" /><sup>*</sup>
									</legend>
									<input name="password2" type="password" /><br />
								</fieldset>
							</td>
						</tr>
						<tr>
							<td align=center colspan=2><input type="submit"
								value="<fmt:message key="signup.submit" />"></td>
						</tr>
					</table>

				</form>
			</td>
		</tr>
		<%@ include file="/WEB-INF/jspf/footer.jspf"%>
	</table>
</body>
</html>