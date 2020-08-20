package com.mycompany.projeto_pweb2_wellikson.model.dao;

import com.mycompany.projeto_pweb2_wellikson.model.entity.Cliente;
import java.util.List;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

/**
 *
 * @author wellikson
 */
@Dependent
public class ClienteDao {

    @Inject
    EntityManager em;

    public void salvar(Cliente locacao) {
        em.getTransaction().begin();
        em.persist(locacao);
        em.getTransaction().commit();
    }

    public void excluir(int id) {
        em.getTransaction().begin();
        Cliente locacao = em.find(Cliente.class, id);
        em.remove(locacao);
        em.getTransaction().commit();
    }

    public Cliente buscarCliente(int id) {
        em.getTransaction().begin();
        Cliente c = em.find(Cliente.class, id);
        em.getTransaction().commit();
        return c;

    }

    public void atualizar(Cliente locacao) {
        em.getTransaction().begin();
        em.merge(locacao);
        em.getTransaction().commit();
    }

    public List<Cliente> buscarClientes() {
        Query query = em.createQuery("from Cliente");
        return query.getResultList();

    }

    public Cliente busca(Cliente c) {
        Query query = em.createQuery(" FROM Cliente WHERE id_cliente = ? AND senha = ?");
        query.setParameter(1, c.getId_cliente());
        query.setParameter(2, c.getSenha());
        try {
            return (Cliente) query.getSingleResult();
        } catch (NoResultException e) {
            e.printStackTrace();
            return null;
        }
    }
}
