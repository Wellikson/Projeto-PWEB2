/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projeto_pweb2_wellikson.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import com.mycompany.projeto_pweb2_wellikson.model.dao.ClienteDao;
import com.mycompany.projeto_pweb2_wellikson.model.dao.LocacaoDao;
import com.mycompany.projeto_pweb2_wellikson.model.entity.Cliente;
import java.util.List;
import javax.inject.Inject;

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

    public void form() {
    }

    public void dados() {

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
        result.include("locacao", ldao.buscarLocacao(cliente.getLocacoes().get(0).getId_locacao()));
        result.redirectTo(this).dados();
    }

}
