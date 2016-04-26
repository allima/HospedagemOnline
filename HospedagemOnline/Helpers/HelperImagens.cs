using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HospedagemOnline.Helpers
{
    public static class HelperImagens
    {
        public static MvcHtmlString ExibeImagens(this HtmlHelper hp)
        {
            string str = "<div style =\"width:100%; text-align:center; padding:10px \">" +
                            "<div style=\"width:300px; height:168px; margin:5px; display:inline-block \"> " +
                            "<img src=\"Imagens/1489991-8951-ga.jpg\" /></div>" +
                            "<div style=\"width:300px; height:168px; margin:5px; display:inline-block \"> " +
                            "<img src=\"Imagens/1490012-9680-ga.jpg\" /></div>" +
                            "<div style=\"width:300px; height:168px; margin:5px; display:inline-block \"> " +
                            "<img src=\"Imagens/1490016-1941-ga.jpg\" /></div>" +
                            "</div>";
            return new MvcHtmlString(str);
        }

    }
}