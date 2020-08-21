<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title> Sistema de Locações </title>
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style>
            body{
                background-color:gainsboro
            }
            form{
                margin-left:20%;
            }
            h2{

                text-align:center;
            }



        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-sm  bg-dark navbar-dark fixed-top">
            <div class="collapse navbar-collapse" id="navbarsExample10">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link navbar-brand" href="${pageContext.request.contextPath}">Home<span class="sr-only">(atual)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown10" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Veiculos</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown10">
                            <a class="dropdown-item" href="${linkTo[VeiculosController].lista}">Ver Veiculos</a>
                            <a class="dropdown-item" href="${linkTo[VeiculosController].form}">Adicionar Veiculos</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown09" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Locação</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown09">
                            <a class="dropdown-item " href="${linkTo[LocacoesController].lista}">Ver Locacoes</a>
                            <a class="dropdown-item " href="${linkTo[ClientesController].login}">Adicionar Locação</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown10" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Clientes</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown10">
                            <a class="dropdown-item" href="${linkTo[ClientesController].lista}">Ver Clientes</a>
                            <a class="dropdown-item" href="${linkTo[ClientesController].form}">Adicionar Cliente</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="">
                <ul class="navbar-nav">
                    <c:if test="${clientelogado.logado}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown10" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${clientelogado.nome}</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown10">
                                <a class="dropdown-item" href="${linkTo[LocacoesController].sair}">Sair</a>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>
        <br><br><br>
        <h2>Login do Cliente</h2><br>
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
                               placeholder="Digite sua Senha" name="cliente.senha" 
                               value="${cliente.senha}"  required>
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