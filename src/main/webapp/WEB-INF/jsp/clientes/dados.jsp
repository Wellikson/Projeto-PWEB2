<%-- 
    Document   : dados
    Created on : 13 de ago de 2020, 09:42:04
    Author     : wellikson
--%>
<%@ include file="../template/header.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .container {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center
    }
    .box {
        width: 85%;
        background: #fff;
    }
</style>
<h2>Dados do Cliente</h2>
<div class="container">
    <div class="card text-white bg-dark box" >
        <div class="card-header">
            <h4>Nome Completo : ${cliente.nome}
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                Telefone : ${cliente.telefone}</h4>
        </div>
        <div class="card-body">
            <h4 class="card-title">Locação</h4>
            <c:forEach items="${cliente.locacoes}" var="l">
                <ul class="list-group list-group-flush bg-dark">
                    <li class="list-group-item bg-dark">Modelo do Veiculo : ${l.veiculoNome()}
                        &nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;
                        Data de Locação : ${l.dataInicio}
                        &nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;
                        Data de Devolução : ${l.dataFim}</li>
                    <li class="list-group-item bg-dark">Quantidade de Dias : ${l.qtdDias()}
                        &nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;
                        Valor da Diaria : ${l.veiculo.getValordiaria()}
                        &nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;
                        Total a Pagar : ${l.total()}</li>
                </ul><br>
            </c:forEach>
        </div>
    </div>
        
</div>
<%@ include file="../template/footer.jsp" %>

