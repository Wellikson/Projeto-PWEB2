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
                    <li class="nav-item dropdown">
                        <c:if test="${clientelogado.logado}">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown10" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${clientelogado.nome}</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown10">
                                <a class="dropdown-item" href="${linkTo[LocacoesController].sair}">Sair</a>
                            </div>
                        </li>
                    </c:if>
                    </li>
                </ul>
            </div>
        </nav>


        <br/>
        <div id="conteudo" class="container-fluid " style="margin-top:37px; " >
            <fmt:setBundle basename="messages"/>
            <c:if test="${!empty msg}">
                <p class="message text-success">${msg}</p>
            </c:if>
            <c:if test="${!empty errors}">
                <div class="error text-danger">
                    <ul>
                        <c:forEach items="${errors}" var="e">
                            <li>${e.category}-${e.message}</li>
                            </c:forEach>
                    </ul>
                </div>
            </c:if>
