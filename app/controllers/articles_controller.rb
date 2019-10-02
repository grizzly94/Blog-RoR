class ArticlesController <ApplicationController
  #GET /articles
  def index
    @articles = Article.all # @ accesible para la vista
  end
  #GET /articles/:id
  def show
    @article = Article.find(params[:id]) #params es un hash con todos los parametros que se mandan

  end
  #GET /articles/new
  def new
    @article = Article.new
  end
  #POST /articles
  def create
    #INSERT INTO
    @article = Article.new(title: params[:article][:title],
                           body: params[:article][:body])
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  #PUT /articles/:id
  def update
    #@article.update_attributes({title})
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy #DELETE DE LA BD
    redirect_to articles_path
   end
end
