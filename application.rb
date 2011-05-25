require 'sinatra'
require 'lib/util'
require 'lib/fpe'
require 'lib/fpm'
require 'googlecharts'


get '/fpe' do
	teste = FPE.new
	teste.recupera_por_estado('DF', '2007')
end

get '/fpm' do
  teste = FPM.new
  teste.recupera_por_municipio('SP','7107' '2007')  
end  


get '/' do
  teste = FPE.new
  @dados = teste.recupera_por_estado('DF', '2007')
	erb :"index"
end


