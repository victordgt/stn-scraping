require 'sinatra'
require 'lib/fpe'

get '/' do
	teste = FPE.new
	teste.fpe_por_estado
end 

