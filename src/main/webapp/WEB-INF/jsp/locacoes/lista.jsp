<%-- 
    Document   : lista
    Created on : 13 de fev de 2020, 08:18:43
    Author     : wellikson.silva
--%>

<%@ include file="../template/header.jsp" %>
<h2>Locações</h2>
<div class="d-flex flex-wrap justify-content-md-center">
    <table class="table table-dark table-striped">
        <thead>
            <tr>
                <th scope="col">Nº Locação</th>
                <th scope="col">Nome Cliente</th>
                <th scope="col">Data Locação</th>
                <th scope="col">Data Devolução</th>
                <th scope="col">Modelo Veiculo</th>
                <th scope="col">Qtd de Diarias</th>
                <th scope="col">Valor Total</th>
                <th scope="col">Editar</th>
                <th scope="col">Excluir</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${locacaoList}" var="l">
                <tr>
                    <th scope="row">${l.id_locacao}</th>
                    <td>${l.clienteNome()}</td>
                    <td>${l.dataInicio}</td>
                    <td>${l.dataFim}</td>
                    <td>${l.veiculoNome()}</td>
                    <td>${l.qtdDias()}</td>
                    <td>${l.total()}</td>
                    <td> <a href="${linkTo[LocacoesController].editar}?id=${l.id_locacao}"
                            class="btn btn-primary">Editar</a></td>
                    <td><a href="${linkTo[LocacoesController].excluir}?id=${l.id_locacao}"
                           class="btn btn-danger">Excluir</a></td>
                </tr>
            </c:forEach>

        </tbody>
    </table>

</div>
<%@ include file="../template/footer.jsp" %>