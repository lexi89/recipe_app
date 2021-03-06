class RecipesController < ApplicationController
    before_action :set_recipe, only: [:edit, :update, :show, :like]
    before_action :require_user, except: [:show, :edit]
    before_action :require_same_user, only: [:edit, :update]
    
    def index
        @recipes = Recipe.paginate(page: params[:id], per_page: 4)
    end
    
    def show
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def edit
    end
    
    def update
        if @recipe.update(recipe_params)
            flash[:success] = "Your recipe was updated"
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = current_user
        
        
        if @recipe.save
            flash[:success] = "Your recipe was created successfully"
            redirect_to recipes_path
        else
            render :new
        end
    end
    
    def like
        @recipe = Recipe.find(params[:id])
        like =Like.create(like: (params[:like]), chef: Chef.first, recipe: @recipe)
        if like.valid?
            flash[:success] = "Your selection was successful"
        else
            flash[:danger] = "You can't like / dislike more than once per recipe"
        end
        redirect_to :back
    end

    private
        def recipe_params
        params.require(:recipe).permit(:name, :summary, :description, :picture)
        end
        
        def set_recipe
            @recipe = Recipe.find(params[:id])
        end
        
        def require_same_user
            if current_user != @recipe.chef
                flash[:danger] = "You can only edit your own recipes"
                redirect_to recipes_path
            end
        end
    
    

end
