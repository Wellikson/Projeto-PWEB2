<%-- 
    Document   : lista
    Created on : 13 de fev de 2020, 08:18:43
    Author     : wellikson.silva
--%>

<%@ include file="../template/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>Clientes Cadastrados</h2>
<div class="d-flex flex-wrap justify-content-md-center" "="">
    <table class="table table-dark table-striped">
        <thead>
            <tr>
                <th scope="col">Nº Cliente</th>
                <th scope="col">Nome</th>
                <th scope="col">Telefone</th>
                <th scope="col">Mais Informações</th>
                <th scope="col">Editar</th>
                <th scope="col">Excluir</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${clienteList}" var="c">
                <tr>
                    <th scope="row">${c.id_cliente}</th>
                    <td>${c.nome}</td>
                    <td>${c.telefone}</td>
                    <td><a href="${linkTo[ClientesController].enviardados}?id=${c.id_cliente}"
                           class="btn btn-primary">Informação da Locação</a></td>
                    <td> <a href="${linkTo[ClientesController].editar}?id=${c.id_cliente}"
                            class="btn btn-primary">Editar</a></td>
                    <td><a href="${linkTo[ClientesController].excluir}?id=${c.id_cliente}"
                           class="btn btn-danger">Excluir</a></td>
                </tr>
            </c:forEach>

        </tbody>
    </table>

</div>

<%@ include file="../template/footer.jsp" %>