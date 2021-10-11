class LanguagesController < ApplicationController

  before_action :set_language, only: %i[ show edit update destroy ]

  def index
    @languages = Language.all
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)

    if @language.save
       flash[:success] = "New language created."
       redirect_to languages_path
    else
      flash.now[:danger] = "Unable to create new language."
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @language.update(language_params)
        format.html { redirect_to @language, notice: "Language was successfully updated." }
        format.json { render :show, status: :ok, location: @language }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @projects = @language.projects.order(updated_at: :desc)
    @posts = @language.posts.order(updated_at: :desc)

    # Lets say for example that language id = 1
    # Then we want all the projects where its language_id is 1
    # ProjectLanguages.where(language_id: 1).map(|project_language| project_language.project)
  end

  def destroy
    @language.destroy
    respond_to do |format|
      format.html { redirect_to languages_url, notice: "Language was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def language_params
      params.require(:language).permit(:title)
    end

    def project_params
      params.require(:project).permit(:title, :description, :user_id, language_ids:[])
    end

    def post_params
      params.require(:post).permit(:title, :user_id, language_ids:[])
    end
  
end
