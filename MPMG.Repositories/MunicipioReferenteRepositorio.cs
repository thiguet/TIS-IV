﻿using Dapper;
using MPMG.Repositories.Entidades;
using System;
using System.Data;

namespace MPMG.Repositories
{
    public class MunicipioReferenteRepositorio : RepositorioBase<MunicipioReferente>
    {

        private const string SQL_INSERIR_MUNICIPIO_REFERENTE = @"
            INSERT INTO municipioReferente VALUES (@IdMunicipio, @IdMunicipioReferente, @Ano)";

        private const string SQL_OBTER_MUNICIPIO_REFERENTE = @"
            SELECT B.id_municipio AS Codigo,
                   B.nome_municipio AS Nome,
                   C.id_municipio AS CodigoMunicipioReferente,
                   C.nome_municipio AS NomeMunicipioReferente,
                   A.ano AS Ano
            FROM municipioReferente A
            JOIN municipio B
            ON A.id_municipio = B.id_municipio
            JOIN municipio C
            ON A.id_municipio_referente = C.id_municipio 
            WHERE A.id_municipio = @IdMunicipio
	              AND A.ano = @Ano";

        private const string SQL_OBTER_MUNICIPIO_REFERENTE_POR_NOME = @"
            SELECT B.id_municipio AS Codigo,
                   B.nome_municipio AS Nome,
                   C.id_municipio AS CodigoMunicipioReferente,
                   C.nome_municipio AS NomeMunicipioReferente,
                   A.ano AS Ano
            FROM municipioReferente A
            JOIN municipio B
            ON A.id_municipio = B.id_municipio
            JOIN municipio C
            ON A.id_municipio_referente = C.id_municipio 
            WHERE B.nome_municipio = @NomeMunicipio
	              AND A.ano = @Ano";

        public MunicipioReferente ObterMunicipioReferente(int idMunicipio, int ano)
        {
            DynamicParameters parametros = new DynamicParameters();

            parametros.Add("@IdMunicipio", idMunicipio, DbType.Int32);
            parametros.Add("@Ano", ano.ToString(), DbType.AnsiStringFixedLength);

            return Obter(SQL_OBTER_MUNICIPIO_REFERENTE, parametros);
        }

        public MunicipioReferente ObterMunicipioReferentePorNome(string nomeMunicipio, int ano)
        {
            DynamicParameters parametros = new DynamicParameters();

            parametros.Add("@NomeMunicipio", nomeMunicipio, DbType.AnsiString);
            parametros.Add("@Ano", ano.ToString(), DbType.AnsiStringFixedLength);

            return Obter(SQL_OBTER_MUNICIPIO_REFERENTE_POR_NOME, parametros);
        }

        public MunicipioReferente InserirMunicipioReferente(int idMunicipio, int idMunicipioReferente, int ano)
        {
            DynamicParameters parametros = new DynamicParameters();

            parametros.Add("@IdMunicipio", idMunicipio, DbType.Int32);
            parametros.Add("@IdMunicipioReferente", idMunicipioReferente, DbType.Int32);
            parametros.Add("@Ano", ano.ToString(), DbType.AnsiStringFixedLength);

            Execute(SQL_INSERIR_MUNICIPIO_REFERENTE, parametros);

            return ObterMunicipioReferente(idMunicipio, ano);
        }
    }
}