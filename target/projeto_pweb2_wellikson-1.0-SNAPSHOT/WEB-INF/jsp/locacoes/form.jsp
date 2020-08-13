<%-- 
    Document   : form
    Created on : 24 de abr de 2020, 15:31:45
    Author     : wellikson
--%>
<!--<style>
    body {
        padding-bottom: 20px;
    }

    .navbar {
        margin-bottom: 20px;
    }
    form{
        margin-left: 20em;
    }


</style>-->
<%@ include file="../template/header.jsp" %>
<h2>Cadastrar Locação</h2>
<form class="needs-validation" novalidate action="${linkTo[LocacoesController].salvar}" method="POST">
    <input type="hidden" name="locacao.id_locacao" value="${locacao.id_locacao}"/><br/>
    <div class="form-row">
        <div class="col-md-4 mb-3">
            <label for="validationCustom01">Data da Locação</label>
            <input type="text" class="form-control" id="validationCustom01" placeholder="dd-mm-aaaa" 
                   name="locacao.dataInicio" value="${locacao.dataInicio}" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}" required>
            <div class="valid-feedback">
                Tudo certo!
            </div>
            <div class="invalid-feedback">
                Por favor,Digite a Data de Locação dd-mm-aaaa.
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <label for="validationCustom02">Data de Devolução</label>
            <input type="text" class="form-control" id="validationCustom02" placeholder="dd-mm-aaaa" 
                   name="locacao.dataFim" value="${locacao.dataFim}" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}" required >
            <div class="valid-feedback">
                Tudo certo!
            </div>
            <div class="invalid-feedback">
                Por favor, Digite a Data de Devolução dd-mm-aaaa.
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-md-4 mb-3">
            <label for="validationCustom04">Veiculo</label>
            <select class="form-control"name="locacao.veiculo.id_veiculo" value="${locacao.veiculo.id_veiculo}">
                <c:forEach items="${veiculos}" var="v" >
                    <option value="${v.id_veiculo}">${v.modelo}</option>
                </c:forEach>
            </select>
            <div class="invalid-feedback">
                Por favor, escolha o Modelo do Veiculo.
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <label for="validationCustom05">Nome do Cliente</label>
            <select class="form-control" name="locacao.cliente.id_cliente">
                <c:forEach  items="${clientes}"var="c">
                    <option value="${c.id_cliente}">${c.nome}</option>
                </c:forEach>
            </select><div class="invalid-feedback">
                Por favor, escolha o Nome do Cliente.
            </div>

        </div>
    </div>
    <button class="btn btn-primary" type="submit">Adicionar</button>
</form>

<script>
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
<%@ include file="../template/footer.jsp" %>
