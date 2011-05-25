require 'net/http'
require 'uri'
require 'nokogiri'

class UtilSTN
  def recupera_pagina_fpe(estado, ano)
    #REQUISICAO POST PARA PAGINA DE TRANSFERENCIAS CONSTITUCIONAIS DOS ESTADOS
    res = Net::HTTP.post_form(URI.parse('http://www.stn.fazenda.gov.br/estados_municipios/estados.asp'),
      {'P_UF' => estado,
      'P_ANO' => ano,
      'P_MES' => '%',
      'P_FUNDOS' => 'FPE',
      'ORMATO' => 'TELA',
      'SUBMIT.x' => '23', 
      'SUBMIT.y' => '4'})
    res.body    
  end

  def recupera_pagina_fpm(estado, municipio, ano)
    #REQUISICAO POST PARA PAGINA DE TRANSFERENCIAS CONSTITUCIONAIS DOS ESTADOS
    res = Net::HTTP.post_form(URI.parse('http://www.stn.fazenda.gov.br/estados_municipios/municipios.asp'),
      {
      'P_UF' => estado,  
      'ente' => municipio,
      'P_ANO' => ano,
      'P_MES' => '%',
      'P_FUNDOS' => 'FPM',
      'ORMATO' => 'TELA',
      'SUBMIT.x' => '36', 
      'SUBMIT.y' => '3'})     
    res.body    
  end  
  
  
  def parsing_pagina(html, caminho)
    #PARSING DE PAGINA DO TESOURO 
    doc = Nokogiri::HTML(html)
    doc.xpath(caminho)   
  end
  
  
  def array_meses(numeros)
    dados = 
    {
     :JAN => numeros[0],
     :FEV => numeros[1],
     :MAR => numeros[2],
     :ABR => numeros[3],
     :MAI => numeros[4],
     :JUN => numeros[5],
     :JUL => numeros[6],
     :AGO => numeros[7],
     :SET => numeros[8],
     :OUT => numeros[9],
     :NOV => numeros[10],
     :DEZ => numeros[11]
    }    
  end
   
end