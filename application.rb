require 'sinatra'
require 'lib/fpe'
require 'googlecharts'

get '/fpe' do
	teste = FPE.new
	teste.fpe_por_estado
end 


get '/' do
  teste = FPE.new
  @dados = teste.fpe_por_estado  
	erb :"index"
end


