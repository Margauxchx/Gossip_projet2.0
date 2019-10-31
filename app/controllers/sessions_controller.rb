class SessionsController < ApplicationController
  
  before_action :authenticate_user, only: [:index]

  def index
    
  end
  
  
  def new
    #id = session_path[:user_id]
    #@user = User.find(id)
    #id = session[:user_id]
    #@user = User.find(id)
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    flash[:success] = "Bienvenue sur notre site."
    redirect_to root_url, notice: "Logged in!"  

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
   
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end

 private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end