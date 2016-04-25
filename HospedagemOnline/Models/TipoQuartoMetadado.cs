using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HospedagemOnline.Models
{

    [MetadataType(typeof(TipoQuartoMetadado))]
   // public partial class TipoQuarto { }

    public class TipoQuartoMetadado
    {
        [Required(ErrorMessage = "A Descricao é obrigatório")]
        [StringLength(50, ErrorMessage = "A Descricao deve possuir no máximo 50 caracteres")]
        public string Descricao { get; set; }

        [Required(ErrorMessage = "O Valor da Diraria é obrigatório")]
        [Range(0, 5000, ErrorMessage = "O Valor da Diraria deve possuir no máximo 30 caracteres")]
        public double ValorDiraria { get; set; }

    }
}