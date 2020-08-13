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
<h2>Cadastrar Veículo</h2>
<form class="needs-validation" novalidate action="${linkTo[VeiculosController].salvar}" method="POST">
    <input type="hidden" name="veiculo.id_veiculo" value="${veiculo.id_veiculo}"/><br/>
    <div class="form-row">
        <div class="col-md-4 mb-3">
            <label for="validationCustom01">Modelo Veiculo</label>
            <input type="text" class="form-control" id="validationCustom01" 
                   placeholder="Modelo Veiculo" name="veiculo.modelo" value="${veiculo.modelo}"autofocus required>
            <div class="valid-feedback">
                Tudo certo!
            </div>
            <div class="invalid-feedback">
                Por favor, informe o Modelo Veiculo.
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <label for="validationCustom02">Nº Placa</label>
            <input type="text" class="form-control" id="validationCustom02" 
                   placeholder="Nº Placa" name="veiculo.placa" value="${veiculo.placa}" required>
            <div class="valid-feedback">
                Tudo certo!
            </div>
            <div class="invalid-feedback">
                Por favor, informe o Nº Placa.
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-md-2 mb-3">
            <label for="validationCustom03">Valor Diaria</label>
            <input type="text" class="form-control" id="validationCustom03" 
                   placeholder="Valor Diaria" name="veiculo.valordiaria" value="${veiculo.valordiaria}"required>
            <div class="invalid-feedback">
                Por favor, informe o Valor Diaria.
            </div>
            <div class="valid-feedback">
                Tudo certo!
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
