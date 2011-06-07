
class FPM
  
  def initialize
    @meses = ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"]
  end   
  
  def recupera_por_municipio(estado, municipio, ano, json)
    @uf = estado
    @municipio = municipio
    @ano = ano
    @json = json
    
    #PARSING COMPLEXO PARA FPM, POIS NÃO HÁ PADRÃO PARA RECUPERAR NODOS MENSAIS DE REPASSES PARA MUNICÍPIOS
    util = UtilSTN.new
    html = util.recupera_pagina_fpm(estado,municipio, ano)
    pesquisa = util.parsing_pagina(html, '//td[@align="right" and @class="middlecell"]')  
    numeros = [] 
    for i in 0..pesquisa.size
      if i % 4 == 1
        numero = pesquisa[i].text
        numero = numero.gsub!("\t", "")
        numero = numero.gsub!("\n", "")
        numero = numero.gsub!("\r", "")
        numero = numero.gsub!(".", "") 
        numero = numero.gsub!(",", ".")
        numero = numero.to_f    
        numeros << numero
      end
    end  
    
    @numeros = numeros
    
    if @json == 'true'
      @dados = self.to_json
    else
      @dados = self.to_xml
    end 
    
    @dados    
  end
  
  def to_xml
    xml = Builder::XmlMarkup.new
    xml.instruct!
    
    xml.fpe {
      xml.uf @uf
      xml.municipio @municipio
      xml.ano @ano
        
      xml.repasse {
        for i in 0 .. @meses.length - 1 do 
          xml.mes @meses[i]   
          xml.valor @numeros[i]
        end  
      }  
    }  
  end 
  
  def to_json  
    valores = []
    for i in 0 .. @meses.length - 1 do 
      valores << [@numeros[i], @meses[i]]
    end  
    
    dados = {'uf' => @uf, 'municipio' => @municipio, 'ano' => @ano, 'valores' => valores}
    dados.to_json
  end   
  
end