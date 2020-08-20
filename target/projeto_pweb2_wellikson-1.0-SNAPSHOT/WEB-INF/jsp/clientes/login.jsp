<%-- 
    Document   : form
    Created on : 24 de abr de 2020, 15:31:45
    Author     : wellikson
--%>

<%@ include file="../template/header.jsp" %> 
<h2>Login do Cliente</h2>
<form class="needs-validation" novalidate action="${linkTo[ClientesController].validarlogin}" style="margin-left: 42%" method="POST" >
    <div>
        <div class="form-row">
            <div class="form-group ">
                <label for="validationTooltip01">Id Do Cliente</label>
                <input type="text" class="form-control" id="validationTooltip01" 
                       placeholder="Digite seu Id" name="cliente.id_cliente" value="${cliente.id_cliente}" required >
                <div class="valid-feedback">
                    Tudo certo!
                </div>
                <div class="invalid-feedback">
                    Por favor, Digite Seu ID.
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group ">
                <label for="validationTooltip02">Senha</label>
                <input type="password" class="form-control" id="validationTooltip02" 
                       name="cliente.senha"  value="${cliente.senha}"  required>
                <div class="invalid-feedback">
                    Digite sua senha
                </div>
                <div class="valid-feedback">
                    Tudo certo!
                </div>
            </div>
        </div>
    </div>
                
    <button class="btn btn-primary " style="margin-left: 8%"  type="submit">ENTRAR</button>
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