/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projeto_pweb2_wellikson.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import com.mycompany.projeto_pweb2_wellikson.model.dao.VeiculoDao;
import com.mycompany.projeto_pweb2_wellikson.model.entity.Veiculo;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author wellikson
 */
@Controller
public class VeiculosController {

    @Inject
    VeiculoDao dao;

    @Inject
    Result result;

    @Inject
    Validator validator;

    public void form() {

    }

    public List<Veiculo> lista() {
        return dao.buscarVeiculos();
    }

    public void salvar(Veiculo veiculo) {
        validator.validate(veiculo);
        validator.onErrorRedirectTo(this).form();
        if (veiculo.getId_veiculo() == null) {
            dao.salvar(veiculo);
        } else {
            dao.atualizar(veiculo);
        }
        result.redirectTo(this).lista();
    }

    public void editar(int id) {
        Veiculo veiculo = dao.buscarVeiculo(id);
        result.include(veiculo);
        result.redirectTo(this).form();
    }

    public void excluir(int id) {
        dao.excluir(id);
        result.redirectTo(this).lista();
    }

}
