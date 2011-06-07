require 'sinatra'
require 'lib/util'
require 'lib/fpe'
require 'lib/fpm'
require 'json'
require 'builder'

get '/fpe/get' do
	fpe = FPE.new
	uf = params[:uf]
	ano = params[:ano]
	json = params[:json]
	
	change_content_type(json)
	
	fpe.recupera_por_estado(uf, ano, json)
end

get '/fpm/get' do
  fpm = FPM.new
  uf = params[:uf]
  municipio = params[:municipio]
  ano = params[:ano]  
  json = params[:json]
  
  change_content_type(json)
  fpm.recupera_por_municipio(uf, municipio, ano, json)  
end  


get '/' do
	erb :"index"
end


def change_content_type(json)
  if json == 'true'
    content_type :json
  else 
    content_type :xml
  end   
end

