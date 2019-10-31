class UsersController < ApplicationController

  def show
    #@gossips = Gossip.where(city_id: @city.id)
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  def new
    @user = User.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    city = City.first
    @user = User.new(first_name: params[:first_name],
    email: params[:email], password: params[:password],city_id: city.id)
    
    if @user.save
     flash[:success] = "Tu es bien inscrit."
     redirect_to "/"
    else
     render "new"
    end
    

    
    
     
    #if @user.save
      #flash[:success] = "Tu es enregistré !"
      #redirect_to "/"
    #else
      #render "new"
    #end
    
    
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  end
  
end

