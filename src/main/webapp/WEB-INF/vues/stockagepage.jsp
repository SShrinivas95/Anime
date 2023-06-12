<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/webjars/bootstrap/5.0.2/css/bootstrap.min.css">
    <script src="/webjars/bootstrap/5.0.2/js/bootstrap.min.js"></script>
</head>
<body>

<form:form action="/manga" method="post" modelAttribute="Mangaa" class="form-horizontal">
    <div class="form-group">
        <label for="nom" class="col-sm-2 control-label">Nom:</label>
        <div class="col-sm-10">
            <form:input path="nom" id="nom" class="form-control" value="${manga.nom}"/>
        </div>
    </div>
    <div class="form-group">
        <label for="editeur" class="col-sm-2 control-label">Editeur:</label>
        <div class="col-sm-10">
            <form:input path="editeur" id="editeur" class="form-control" value="${manga.editeur}"/>
        </div>
    </div>
    <form:input type="hidden" path="vu" value="non vu"/>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-danger">Envoyer</button>
        </div>
    </div>
</form:form>


</body>
</html>
