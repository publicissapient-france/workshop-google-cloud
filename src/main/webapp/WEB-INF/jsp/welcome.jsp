<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="javax.sql.DataSource" %>
<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html lang="en">

<jsp:include page="fragments/headTag.jsp"/>

<body>
<div class="container">
    <jsp:include page="fragments/bodyHeader.jsp"/>
    <% java.net.InetAddress localMachine = java.net.InetAddress.getLocalHost();
        pageContext.setAttribute("hostname", localMachine.getHostName());
        final DataSource dataSource = (DataSource) WebApplicationContextUtils.getRequiredWebApplicationContext(getServletConfig().getServletContext()).getBean("dataSource");
        pageContext.setAttribute("dbUrl", dataSource.getConnection().getMetaData().getURL());
    %>
    <h2><fmt:message key="welcome"/> on instance ${hostname}, db : ${dbUrl}</h2>
    <spring:url value="/resources/images/pets.png" htmlEscape="true" var="petsImage"/>
    <img src="${petsImage}"/>

    <jsp:include page="fragments/footer.jsp"/>

</div>
</body>

</html>
