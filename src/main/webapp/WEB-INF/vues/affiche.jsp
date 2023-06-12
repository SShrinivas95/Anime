<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="/webjars/bootstrap/5.0.2/css/bootstrap.min.css">
    <script src="/webjars/bootstrap/5.0.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/test.css">
</head>
<style>
    .btn.btn-success {
        width: 90px;
    }
    .navbar {
        width: 1151px;
        margin-left:13px;
    }
</style>

<body>

<div class="container">
    <div class="row">
        <h1 class="text-center" style="display:none;" id="t1">Animé non vu</h1>
        <h1 class="text-center" style="display:none;" id="t2">Animé vu</h1>
        <h1 class="text-center" id="tt">Tout</h1>
        <nav class="navbar navbar-dark bg-dark">
            <div class="Test text-center">
                <button class="btn btn-dark" onclick="affichertout()">Tout</button>
                <button class="btn btn-dark" onclick="afficher1()">Animé non vu</button>
                <button class="btn btn-dark" onclick="afficher2()">Animé vu</button>
            </div>
        </nav>
        <div id="tout">
             <span class="d-flex flex-wrap">
            <c:forEach items="${mangas}" var="manga">
                    <div class="card" style="width: 18rem;">
                        <img src="${manga.mediumImg}" class="card-img-top" alt="bug" style="width:auto;height:375px;">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">${manga.titre}</h5>
                            <div class="d-flex justify-content-center">
                            <form:form action="/affiche" method="post" modelAttribute="Mangaa">
                                <form:input type="hidden" path="nom" value="${manga.nom}"/>
                                <form:input type="hidden" path="editeur" value="${manga.editeur}"/>
                                <button type="submit" class="noselect"><span class="text">Supprimer</span><span
                                        class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                          viewBox="0 0 24 24"><path
                                        d="M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z"></path></svg></span>
                                </button>
                            </form:form>
                                 <c:choose>
                                     <c:when test="${manga.vu == 'non vu'}">
                                         <form:form action="/Lu" method="post" modelAttribute="Mangaa">
                                             <form:input type="hidden" path="id" value="${manga.id}"/>
                                             <form:input type="hidden" path="vu" value="Oui vu"/>
                                             <button type="submit"
                                                     class="btn btn-success btn-rounded"><b>Vu</b></button>
                                         </form:form>
                                     </c:when>
                                     <c:otherwise>
                                         <form:form action="/Lu" method="post" modelAttribute="Mangaa">
                                             <form:input type="hidden" path="id" value="${manga.id}"/>
                                             <form:input type="hidden" path="vu" value="non vu"/>
                                             <button type="submit"
                                                     class="btn btn-success btn-rounded"><b>Non vu</b></button>
                                         </form:form>
                                     </c:otherwise>
                                 </c:choose>
                            </div>
                        </div>
                    </div>
            </c:forEach>
             </span>
        </div>
        <div id="lu" style="display:none;">
             <span class="d-flex flex-wrap">
            <c:forEach items="${mangas}" var="manga">
                <c:if test="${manga.vu == 'non vu'}">
                    <div class="card" style="width: 18rem;">
                        <img src="${manga.mediumImg}" class="card-img-top" alt="bug" style="width:auto;height:375px;">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">${manga.titre}</h5>
                            <div class="d-flex justify-content-center">
                            <form:form action="/affiche" method="post" modelAttribute="Mangaa">
                                <form:input type="hidden" path="nom" value="${manga.nom}"/>
                                <form:input type="hidden" path="editeur" value="${manga.editeur}"/>
                                <button type="submit" class="noselect"><span class="text">Supprimer</span><span
                                        class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                          viewBox="0 0 24 24"><path
                                        d="M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z"></path></svg></span>
                                </button>
                            </form:form>
                            <form:form action="/Lu" method="post" modelAttribute="Mangaa">
                                <form:input type="hidden" path="id" value="${manga.id}"/>
                                <form:input type="hidden" path="vu" value="Oui vu"/>
                                <button type="submit" class="btn btn-success btn-rounded"><b>Vu</b></button>
                            </form:form>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
             </span>
        </div>
        <div id="Paslu" style="display:none;">
            <span class="d-flex flex-wrap">
            <c:forEach items="${mangas}" var="manga">
                <c:if test="${manga.vu == 'Oui vu'}">
                    <div class="card" style="width: 18rem;">
                        <img src="${manga.mediumImg}" class="card-img-top" alt="bug" style="width:auto;height:375px;">
                        <div class="card-body">
                            <h5 class="card-title">${manga.titre}</h5>
                            <div class="d-flex justify-content-center">
                            <form:form action="/affiche" method="post" modelAttribute="Mangaa">
                                <form:input type="hidden" path="nom" value="${manga.nom}"/>
                                <form:input type="hidden" path="editeur" value="${manga.editeur}"/>
                                <button type="submit" class="noselect"><span class="text">Supprimer</span><span
                                        class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                          viewBox="0 0 24 24"><path
                                        d="M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z"></path></svg></span></button>
                            </form:form>
                            <form:form action="/Lu" method="post" modelAttribute="Mangaa">
                                <form:input type="hidden" path="id" value="${manga.id}"/>
                                <form:input type="hidden" path="vu" value="non vu"/>
                                <button type="submit" class="btn btn-success btn-rounded"><b>Non vu</b></button>
                            </form:form>
                                </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
            </span>
        </div>
    </div>
</div>

</body>
</html>
<script>
    function afficher1() {
        const table1 = document.getElementById("lu");
        const table2 = document.getElementById("Paslu");
        const title1 = document.getElementById("t1");
        const title2 = document.getElementById("t2");
        const title = document.getElementById("tt");
        const tout = document.getElementById("tout");

        if (table1.style.display === "none") {
            table1.style.display = "table";
            title1.style.display = "block";
            table2.style.display = "none";
            title2.style.display = "none";
            tout.style.display = "none";
            title.style.display = "none";
        }
    }

    function affichertout() {
        const table1 = document.getElementById("lu");
        const table2 = document.getElementById("Paslu");
        const title1 = document.getElementById("t1");
        const title2 = document.getElementById("t2");
        const title = document.getElementById("tt");
        const tout = document.getElementById("tout");
        if (tout.style.display === "none") {
            table1.style.display = "none";
            title1.style.display = "none";
            table2.style.display = "none";
            title2.style.display = "none";
            tout.style.display = "table";
            title.style.display = "block";
        }
    }

    function afficher2() {
        const table1 = document.getElementById("lu");
        const table2 = document.getElementById("Paslu");
        const title1 = document.getElementById("t1");
        const title2 = document.getElementById("t2");
        const title = document.getElementById("tt");
        const tout = document.getElementById("tout");
        if (table2.style.display === "none") {
            table2.style.display = "table";
            title2.style.display = "block";
            table1.style.display = "none";
            title1.style.display = "none";
            tout.style.display = "none";
            title.style.display = "none";
        }
    }

    // JavaScript code to open the modal automatically
    <%--document.addEventListener('DOMContentLoaded', function () {--%>
    <%--var myModal = new bootstrap.Modal(document.getElementById('exampleModal'));--%>
    <%--    if (${existe} !== null) {--%>
    <%--        myModal.show();--%>
    <%--    }--%>

    <%--});--%>

</script>
</html>


