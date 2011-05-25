
class FPM
  def recupera_por_municipio(estado, municipio, ano)
    #PARSING COMPLEXO PARA FPM, POIS NÃO HÁ PADRÃO PARA RECUPERAR NODOS MENSAIS DE REPASSES PARA MUNICÍPIOS
    util = UtilSTN.new
    html = util.recupera_pagina_fpm(estado,municipio, ano)
    dados = util.parsing_pagina(html, '//td[@align="right" and @class="middlecell"]')  
    numeros = [] 
    for i in 0..dados.size
      if i % 4 == 1
        numero = dados[i].text
        numero = numero.gsub!("\t", "")
        numero = numero.gsub!("\n", "")
        numero = numero.gsub!("\r", "")
        numero = numero.gsub!(".", "") 
        numero = numero.gsub!(",", ".")
        numero = numero.to_f    
        numeros << numero
      end
    end  
    util.array_meses(numeros) 
  end
  
end