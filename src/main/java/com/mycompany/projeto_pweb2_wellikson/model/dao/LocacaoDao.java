/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projeto_pweb2_wellikson.model.dao;

import com.mycompany.projeto_pweb2_wellikson.model.entity.Locacao;
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
public class LocacaoDao {
    
    @Inject
    EntityManager em ;
    
    public void salvar(Locacao locacao) {
        em.getTransaction().begin();
        em.persist(locacao);
        em.getTransaction().commit();
    }

    public void excluir(int id) {
        em.getTransaction().begin();
        Locacao locacao = em.find(Locacao.class, id);
        em.remove(locacao);
        em.getTransaction().commit();
    }

    public Locacao buscarLocacao(int id) {
        em.getTransaction().begin();
        Locacao l = em.find(Locacao.class, id);
        em.getTransaction().commit();
        return l;

    }

    public void atualizar(Locacao locacao) {
        em.getTransaction().begin();
        em.merge(locacao);
        em.getTransaction().commit();
    }

    public List<Locacao> buscarLocacoes() {
        Query query = em.createQuery("from Locacao");
        return query.getResultList();

    }

    
}
