﻿using System;

namespace MPMG.Interfaces.DTO
{
    public class TabelaUsuario
    {
        public int SGDP { get; set; }
        public DateTime DataGeracao { get; set; }
        public int AnoReferente { get; set; }
        public string Titulo1 { get; set; }
        public string Titulo2 { get; set; }
        public string Titulo3 { get; set; }
        public string AnalistaResponsavel { get; set; }

    }
}