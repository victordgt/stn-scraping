require 'json'
require 'builder'

class FPE
  
  def initialize
    @meses = ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"]
  end  
  
	def recupera_por_estado(uf, ano, json)
	  @uf = uf
	  @ano = ano
	  @json = json
	  
	  util = UtilSTN.new;
		html = util.recupera_pagina_fpe(@uf, @ano)
		dados = util.parsing_pagina(html, '//td[@class="middlecell" and @align="right"]') 
		
		numeros = []
	
		dados.each do |linha|
		  numero = linha.text
		  numero = numero.gsub!('.','')
		  numero = numero.gsub!(',','.')
			numeros << numero.to_f
		end
		@numeros = numeros
		
		if json == 'true'
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
    
    dados = {'uf' => @uf, 'ano' => @ano,  'valores' => valores}
    dados.to_json
  end	
end