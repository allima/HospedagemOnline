//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HospedagemOnline.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cidade
    {
        public Cidade()
        {
            this.Estabelecimento = new HashSet<Estabelecimento>();
        }
    
        public int IdCidade { get; set; }
        public string Nome { get; set; }
        public string UF { get; set; }
    
        public virtual ICollection<Estabelecimento> Estabelecimento { get; set; }
    }
}
