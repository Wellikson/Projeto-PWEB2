<%-- 
    Document   : dados
    Created on : 13 de ago de 2020, 09:42:04
    Author     : wellikson
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
                <th scope="col">Nº Locação</th>
                <th scope="col">Data da Locaçao</th>
                <th scope="col">Veiculo</th>
                <th scope="col">Qtd Diarias</th>
                <th scope="col">Editar</th>
                <th scope="col">Excluir</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <th scope="row">${cliente.id_cliente}</th>
                    <td>${cliente.nome}</td>
                    <td>${cliente.telefone}</td>
                        <td> ${locacao.veiculoNome()}</td>
                    <td> <a href="${linkTo[ClientesController].editar}?id=${c.id_cliente}"
                            class="btn btn-primary">Editar</a></td>
                    <td><a href="${linkTo[ClientesController].excluir}?id=${c.id_cliente}"
                           class="btn btn-danger">Excluir</a></td>
                </tr>
        </tbody>
    </table>
</div>
<%@ include file="../template/footer.jsp" %>

