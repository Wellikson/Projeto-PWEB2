/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projeto_pweb2_wellikson.model.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 *
 * @author wellikson
 */
@Entity
@Table(name = "tb_locacao")
public class Locacao implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id_locacao;

    @Column(columnDefinition = "varchar(10)")
    @NotNull(message = "{obrigatorio}")
    @Pattern(regexp = "(\\d{2})-(\\d{2})-(\\d{4})")
    private String dataInicio;

    @Column(columnDefinition = "varchar(10)")
    @NotNull(message = "{obrigatorio}")
    @Pattern(regexp = "(\\d{2})-(\\d{2})-(\\d{4})")
    private String dataFim;

    @JoinColumn(name = "id_cliente")
    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE},
            fetch = FetchType.EAGER)
    Cliente cliente;

    @JoinColumn(name = "id_veiculo")
    @OneToOne()
    Veiculo veiculo;

    public Integer getId_locacao() {
        return id_locacao;
    }

    public void setId_locacao(Integer id_locacao) {
        this.id_locacao = id_locacao;
    }

    public String getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(String dataInicio) {
        this.dataInicio = dataInicio;
    }

    public String getDataFim() {
        return dataFim;
    }

    public void setDataFim(String dataFim) {
        this.dataFim = dataFim;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Veiculo getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(Veiculo veiculo) {
        this.veiculo = veiculo;
    }

    public String clienteNome() {
        return cliente.getNome();
    }

    public String veiculoNome() {
        return veiculo.getModelo();
    }

    public int qtdDias() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        LocalDate localDate1 = LocalDate.parse(dataFim, formatter);
        LocalDate localDate2 = LocalDate.parse(dataInicio, formatter);

        return (int) ChronoUnit.DAYS.between(localDate2, localDate1);
    }

    public double total() {
        double total;
        total = qtdDias() * veiculo.getValordiaria();
        return total;
    }

    public String dados() {
        return "Nº Locação: " + id_locacao + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Data Inicio: " + dataInicio
                + "&nbsp;&nbsp;&nbsp;DataFim: " + dataFim + "<br>Qtd Diarias: " + qtdDias()
                + veiculo.dados() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Valor total: " + total();
    }
}
