class ArticlesController <ApplicationController
  before_action :authenticate_user!,except: [:show,:index]
  before_action :set_article, except: [:create,:index,:new]
  before_action :authenticate_editor!, only: [:new,:create,:update]
  before_action :authenticate_admin!, only: [:destroy,:publish]
  #GET /articles
  def index
    @articles = Article.paginate(page: params[:page],per_page:3).publicados.ultimos # @ accesible para la vista
  end
  #GET /articles/:id
  def show
    #params es un hash con todos los parametros que se mandan
    @article.update_visits_count
    @comment = Comment.new
  end
  #GET /articles/new
  def new
    @article = Article.new
    @categories = Category.all
  end
  def edit

  end
  #POST /articles
  def create
    @article = current_user.articles.new(article_params)
    @article.category_ids = params[:article][:category_ids]
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  #PUT /articles/:id
  def update

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
    #@article.update_attributes({title})
  end
  #PUT /articles/:id/publish
  def publish
    @article.publish!
    redirect_to @article
  end

  def destroy

    @article.destroy #DELETE DE LA BD
    redirect_to articles_path
  end

  private #De aquí para abajo son métdos privados de la clase
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title,:body,:cover,:category_ids=>[])
  end
  def validate_user
    redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
  end

end
