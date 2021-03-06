
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end


#index
  get '/articles' do
    erb :index
  end

#create
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

#new
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

#show
  get '/articles/:id' do
    @article = Article.all.find(params[:id])
    erb :show
  end

#edit
  get "/articles/:id/edit" do
    @article = Article.all.find(params[:id])
    erb :edit
  end

#update
  patch '/article/:id' do
    @article = Article.all.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

#distroy
  delete '/articles/:id' do
    @article = Article.all.find(params[:id])
    Article.delete(@article.id)
    #@article.destroy
    redirect to "/articles"
  end


end
