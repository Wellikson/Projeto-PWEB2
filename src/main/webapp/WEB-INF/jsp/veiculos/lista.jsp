<%-- 
    Document   : lista
    Created on : 13 de fev de 2020, 08:18:43
    Author     : wellikson.silva
--%>

<!--<style>
    body {
        margin: 2px;
        padding-bottom: 20px;
    }

    .navbar {
        margin-bottom: 20px;
    }
    main{
        margin-left: 10em;
        width:75%;
        justify-content: center;
    }
    
</style>-->
<%@ include file="../template/header.jsp" %>


<main >
    <h2>Veiculos Cadastrados</h2>
    <div class="d-flex flex-wrap justify-content-md-center">
        <table class="table  table-dark table-striped">
            <thead>
                <tr>
                    <th scope="col">Nº Veiculo</th>
                    <th scope="col">Modelo</th>
                    <th scope="col">Nº Placa</th>
                    <th scope="col">Valor Diaria</th>
                    <th scope="col">Editar</th>
                    <th scope="col">Excluir</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${veiculoList}" var="v">
                    <tr>
                        <th scope="row">${v.id_veiculo}</th>
                        <td>${v.modelo}</td>
                        <td>${v.placa}</td>
                        <td>${v.valordiaria}</td>
                        <td> <a href="${linkTo[VeiculosController].editar}?id=${v.id_veiculo}"
                                class="btn btn-primary">Editar</a></td>
                        <td><a href="${linkTo[VeiculosController].excluir}?id=${v.id_veiculo}"
                               class="btn btn-danger">Excluir</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>
<%@ include file="../template/footer.jsp" %>
