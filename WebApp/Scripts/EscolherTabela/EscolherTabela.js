﻿$(document).ready(function () {     
    ValidarNotas.chamadaAjax({
        url: urlCarregarSGDPs,
        data: { valorSgdp: valorSgdp },
        sucesso: function (response) {
            window.location.href = response.urlRedirecionamento;
        },
        deveEsconderCarregando: true
    });

    $("#visualizar_tabela").on("click", function (event) {
        let valorSgdp = $("#sgdp").val();

        if (valorSgdp) {
            const urlRedirecionarVisualizarTabela = window.urlRedirecionarVisualizarTabela;

            ValidarNotas.chamadaAjax({
                url: urlRedirecionarVisualizarTabela,
                data: { valorSgdp: valorSgdp },
                sucesso: function (response) {
                    console.log(response);
                    window.location.href = response.urlRedirecionamento;
                },
                deveEsconderCarregando: true
            });
        } else {
            alert("Selecione um SGDP");
        }
    });

});