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
  def edit
    @article = Article.find(params[:id])
  end

  #POST /articles
  def create
    #INSERT INTO
    #@article = Article.new(title: params[:article][:title],
    #                       body: params[:article][:body])
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  #PUT /articles/:id
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
    #@article.update_attributes({title})
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy #DELETE DE LA BD
    redirect_to articles_path
  end

  private #De aquí para abajo son métdos privados de la clase

  def article_params
    params.require(:article).permit(:title,:body)
  end

end
