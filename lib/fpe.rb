class FPE
	def recupera_por_estado(estado, ano)
	  util = UtilSTN.new;
		html = util.recupera_pagina_fpe(estado, ano)
		dados = util.parsing_pagina(html, '//td[@class="middlecell" and @align="right"]') 
		
		numeros = []
	
		dados.each do |linha|
		  numero = linha.text
		  numero = numero.gsub!('.','')
		  numero = numero.gsub!(',','.')
			numeros << numero.to_f
		end
		
    util.array_meses(numeros)
	end
	
end