/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projeto_pweb2_wellikson.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.validator.SimpleMessage;
import com.mycompany.projeto_pweb2_wellikson.model.dao.ClienteDao;
import com.mycompany.projeto_pweb2_wellikson.model.dao.LocacaoDao;
import com.mycompany.projeto_pweb2_wellikson.model.entity.Cliente;
import com.mycompany.projeto_pweb2_wellikson.model.entity.ClienteLogado;
import java.util.List;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author wellikson
 */
@Controller
public class ClientesController {

    @Inject
    ClienteDao dao;

    @Inject
    Result result;

    @Inject
    LocacaoDao ldao;

    @Inject
    Validator validator;

    @Inject
    ClienteLogado clientelogado;

    public void form() {
    }

    public void dados() {

    }

    public void login() {
        if (clientelogado.isLogado()) {
            result.redirectTo(LocacoesController.class).form();
        }
    }

    public void validarlogin(Cliente cliente) {
        Cliente c = dao.busca(cliente);

        if (c != null) {
            clientelogado.login(c);
            @Named("ClienteLog")
            Cliente c1 = dao.buscarCliente(c.getId_cliente());
//            result.include("clienteLog", c1);
            result.redirectTo(LocacoesController.class).form();
        } else {
            validator.add(new SimpleMessage("login_invalido",
                    "Login ou senha incorretos"));
            validator.onErrorRedirectTo(this).login();
        }
//        validator.addIf(!dao.carrega(cliente),
//                new I18nMessage("Cliente", "cadastro"));
//        validator.validate(dao.autenticar(cliente));       
//        validator.onErrorRedirectTo(this).login();
//        Cliente c1 = dao.buscarCliente(cliente.getId_cliente());
//        result.include("clienteLog", c1);
//        clientelogado.login(c1);
//        result.redirectTo(LocacoesController.class).form();

    }

    public List<Cliente> lista() {
        return dao.buscarClientes();
    }

    public void salvar(Cliente cliente) {
        validator.validate(cliente);
        validator.onErrorRedirectTo(this).form();
        if (cliente.getId_cliente() == null) {
            dao.salvar(cliente);
        } else {
            dao.atualizar(cliente);
        }
        result.redirectTo(this).lista();
    }

    public void editar(int id) {
        Cliente cliente = dao.buscarCliente(id);
        result.include(cliente);
        result.redirectTo(this).form();
    }

    public void excluir(int id) {
        dao.excluir(id);
        result.redirectTo(this).lista();
    }

    public void enviardados(int id) {
        Cliente cliente = dao.buscarCliente(id);
        result.include(cliente);
        result.redirectTo(this).dados();
    }

}
