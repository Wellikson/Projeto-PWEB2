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
import com.mycompany.projeto_pweb2_wellikson.model.dao.VeiculoDao;
import com.mycompany.projeto_pweb2_wellikson.model.entity.Locacao;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author wellikson
 */
@Controller
public class LocacoesController {

    @Inject
    LocacaoDao dao;

    @Inject
    ClienteDao cdao;

    @Inject
    VeiculoDao vdao;

    @Inject
    Result result;

    @Inject
    Validator validator;

    public void form() {
        result.include("veiculos", vdao.buscarVeiculos());
        result.include("clientes", cdao.buscarClientes());
    }

    public List<Locacao> lista() {
        return dao.buscarLocacoes();
    }

    public void salvar(Locacao locacao) {
        validator.validate(locacao);
        validator.onErrorRedirectTo(this).form();
        if (locacao.getId_locacao() == null) {
            locacao.setCliente(cdao.buscarCliente(locacao.getCliente().getId_cliente()));
            locacao.setVeiculo(vdao.buscarVeiculo(locacao.getVeiculo().getId_veiculo()));
            dao.salvar(locacao);
        } else {
            locacao.setCliente(cdao.buscarCliente(locacao.getCliente().getId_cliente()));
            locacao.setVeiculo(vdao.buscarVeiculo(locacao.getVeiculo().getId_veiculo()));
            dao.atualizar(locacao);
        }
        result.redirectTo(this).lista();
    }

    public void editar(int id) {
        Locacao locacao = dao.buscarLocacao(id);
        result.include(locacao);
        result.redirectTo(this).form();
    }

    public void excluir(int id) {
        dao.excluir(id);
        result.redirectTo(this).lista();
    }

}
