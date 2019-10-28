﻿$(document).ready(function () {    
    VMasker(document.querySelector("#data-geracao")).maskPattern("99/99/9999");

    validateNumericRequiredFormField("#sgdp");
    validateNumericRequiredFormField("#ano-referente");
    validateDateFormField("#data-geracao");
    setDefaultDate("#data-geracao");
    setReadOnly("#data-geracao");

    // Facilitador. Se não convier, apenas remover
    // Seta o Ano Referente, automaticamente como o ano atual.
    $("#ano-referente").val(moment().format("YYYY"));

    $("#municipios").on("change", function (event) {
        const urlListarMunicipios = window.urlListarMunicipios;
        const municipioSelecionado = $("#municipios").val();

        ValidarNotas.chamadaAjax({
            url: urlListarMunicipios,
            sucesso: function (response) {
                const municipio = response.municipios.filter((m) => { m == municipioSelecionado });

                $('#municipios-anp').html = '';
                $('#municipios-anp').append(response.municipios.map(m => {
                    return "<option>" + m + "</option>";
                }));

                if (!(municipio.length === 1)) {
                    alert("O município selecionado não possui dados na tabela da ANP para o período selecionado. Favor escolher um município.");
                    $("#municipios-anp-div").removeClass("display-none");
                } else {
                    $('#municipios-anp').val(municipio[0]);
                }
            },
            deveEsconderCarregando: true
        });
    });

    $("#cadastrar-tabela").on("click", function (event) {
        const tabelaUsuarioData = {
            "SGDP": $("#sgdp").val(),
            "IdMunicipio": $("#municipios").val(),
            "IdMunicipioReferente": 1, // $("#municipios-anp").val(),
            "AnalistaResponsavel": $("#analista-resp").val(),
            "AnoReferente": $("#ano-referente").val(),
            "DataGeracao": $("#data-geracao").val(),
            "Titulo1": $("#titulo1").val(),
            "Titulo2": $("#titulo2").val(),
            "Titulo3": $("#titulo3").val()
        };
        const urlTabelaUsuario = window.urlCadastrarTabelaUsuario;

        ValidarNotas.chamadaAjax({
            url: urlTabelaUsuario,
            data: tabelaUsuarioData,
            sucesso: function () {
                console.log("sucesso");
            },
            deveEsconderCarregando: true
        });
    });
});