require 'test/unit'
require '../lib/util'
require 'json'
require 'json/ext'


 
class TestUtil < Test::Unit::TestCase
  
  #RECUPERA UMA PÁGINA E TESTA SE EXISTE NA PAGINA UM VALOR ESPECIFICO
  def test_recuperar_pagina_fpm
    util = UtilSTN.new
    pagina = util.recupera_pagina_fpm('SP', '7107', '2007')  
    assert_equal(true, pagina.index('8.001.271,74')  > 0)
  end 
  
  #RECUPERA UMA PÁGINA E TESTA SE EXISTE NA PAGINA UM VALOR ESPECIFICO
  def test_recuperar_pagina_fpe
    util = UtilSTN.new
    pagina = util.recupera_pagina_fpe('SP', '2007')  
    assert_equal(true, pagina.index('25.614.115,17') > 0)
  end   
  
  
  #RECUPERA UMA PÁGINA E VERIFICA UMA EXPRESSAO XPATH PARA RECUPERAR VALORES MENSAIS DE REPASSES PARA UM ESTADO
  def test_parsing_pagina_fpe
    util = UtilSTN.new
    pagina = util.recupera_pagina_fpe('SP', '2007')  
    
    dados = util.parsing_pagina(pagina, '//td[@class="middlecell" and @align="right"]')
    assert_equal('25.614.115,17', dados[0].text)
    assert_equal(12, dados.size)
  end   
end