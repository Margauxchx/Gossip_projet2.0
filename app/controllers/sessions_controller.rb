class SessionsController < ApplicationController


  
  def new
    #id = session[:user_id]
    #@user = User.find(id)
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    flash[:success] = "Bienvenue sur notre site."
    redirect_to root_path  

    else
      flash.now[:alert] = 'Email ou mot de passe invalide'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end
