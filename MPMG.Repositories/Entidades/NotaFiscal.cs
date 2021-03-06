﻿using System;

namespace MPMG.Repositories.Entidades
{
    public class NotaFiscal
    {
        public int NrNotaFiscal { get; set; }
        public int SGDP { get; set; }
        public double ValorTotal { get; set; }
        public DateTime DataEmissao { get; set; }
        public double PrecoMaximo { get; set; }
        public double PrecoMedio { get; set; }
        public DateTime DataConsultaANP { get; set; }
        public string Veiculo { get; set; }
        public string PlacaVeiculo { get; set; }
        public double PrecoUnitario { get; set; }
        public int NumeroFolha { get; set; }
        public int Departamento { get; set; }
    }
}
