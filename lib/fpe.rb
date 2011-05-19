require 'net/http'
require 'uri'
require 'nokogiri'
require 'json'

class FPE

	def fpe_por_estado
		#1: Simple POST
		res = Net::HTTP.post_form(URI.parse('http://www.stn.fazenda.gov.br/estados_municipios/estados.asp'),
			{'P_UF' => 'DF',
			'P_ANO' => '2007',
			'P_MES' => '%',
			'P_FUNDOS' => 'FPE',
			'ORMATO' => 'TELA',
			'SUBMIT.x' => '23', 
			'SUBMIT.y' => '4'})
		html = res.body
		
		doc = Nokogiri::HTML(html)
		dados = doc.xpath('//td[@class="middlecell" and @align="right"]')
		
		numeros = []
	
		dados.each do |linha|
			puts linha.text.to_f
			numeros << linha.text.to_f
		end
		
		puts numeros.to_json
		
		numeros.to_json
	end
end