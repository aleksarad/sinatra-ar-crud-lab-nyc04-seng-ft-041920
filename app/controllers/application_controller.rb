
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
  end

  ##CREATE
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    # params[:content]
    # params[:title]
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  ##READ
  #displays all articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #display an individual article
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end

  ##UPDATE

  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  ##DELETE
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect to "/articles"
  end

end
