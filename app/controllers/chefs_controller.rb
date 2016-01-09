class ChefsController < ApplicationController
    before_action :set_chef, only: [:edit, :show, :update]
    before_action :require_same_user, only: [:edit, :update]
    

    def new
        @chef = Chef.new
    end
    
    def index
        @chefs = Chef.paginate(page: params[:page], per_page: 3)
    end
    
    def create
        @chef = Chef.new(chef_params)
        if @chef.save
            flash[:success] = "Your account was created"
            session[:chef_id] = @chef.id
            redirect_to recipes_path
        else
            render "new"
        end
    end
    
    def edit
        
    end
    
    def show
        
        
    end
    

    def update
        
        if @chef.update(chef_params)
            flash[:success] = "Your profile has been updated"
            redirect_to recipes_path #TO-DO: change to chef's page
            
        else
            render "edit"
        end
    end

    private
        def chef_params
            params.require(:chef).permit(:chefname, :email, :password)
            
        end
        
        def set_chef
            @chef = Chef.find(params[:id])
        end
        
        def require_same_user
            if current_user != @chef
                flash[:danger] = "You're only allowed to edit your own details"
                redirect_to root_path
            end
        end
            
        
end


