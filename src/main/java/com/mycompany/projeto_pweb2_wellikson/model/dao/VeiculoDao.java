/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projeto_pweb2_wellikson.model.dao;

import com.mycompany.projeto_pweb2_wellikson.model.entity.Veiculo;
import java.util.ArrayList;
import java.util.List;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author wellikson
 */
@Dependent
public class VeiculoDao {
    @Inject
    EntityManager em ;
    
    public void salvar(Veiculo veiculo) {
        em.getTransaction().begin();
        em.persist(veiculo);
        em.getTransaction().commit();
    }

    public void excluir(int id) {
        em.getTransaction().begin();
        Veiculo v = em.find(Veiculo.class, id);
        em.remove(v);
        em.getTransaction().commit();
    }

    public Veiculo buscarVeiculo(int id_veiculo) {
        em.getTransaction().begin();
        Veiculo veiculo = new Veiculo();
        Veiculo v = em.getReference(Veiculo.class, id_veiculo);
        veiculo.setId_veiculo(v.getId_veiculo());
        veiculo.setModelo(v.getModelo());
        veiculo.setPlaca(v.getPlaca());
        veiculo.setValordiaria(v.getValordiaria());
        em.getTransaction().commit();
        return veiculo;

    }

    public void atualizar(Veiculo veiculo) {
        em.getTransaction().begin();
        Veiculo v = em.find(Veiculo.class, veiculo.getId_veiculo());
        v.setId_veiculo(veiculo.getId_veiculo());
        v.setModelo(veiculo.getModelo());
        v.setPlaca(veiculo.getPlaca());
        v.setValordiaria(veiculo.getValordiaria());
        em.getTransaction().commit();
    }

    public List<Veiculo> buscarVeiculos() {
        Query query = em.createQuery("from Veiculo");
        return query.getResultList();

    }

}
