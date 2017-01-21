class UsersController < ApplicationController
  before_action :authenticate_request!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  ############
  ##        ##
  ##  TODO  ##
  ##        ##
  ## Rating ##
  ##        ##
  ############
  #          #
  # http://stackoverflow.com/questions/20320913/creating-user-with-rails-api-and-json
  #          #
  #          #

  def upvote 
    voting_user = User.find_by_email(get_email)
    user = User.find(params[:user_id])
    user.upvote_by voting_user 
    redirect_to :back
  end  

  def downvote
    voting_user = User.find_by_email(get_email)
    user = User.find(params[:user_id])
    user.downvote_by voting_user 
    redirect_to :back
  end

  ## GET
  def new
    @email = get_email

    respond_to do |format|
      format.html {
        render component: 'UserForm',
          props: {
            authenticity_token: form_authenticity_token,
            jwt: session['jwt'],
            method: "post",
            name: "new_user",
            action: "/users",
            user: { email: @email }
        }
      }
      format.json { render json: {email: @email} }
    end

    @user = User.new
  end

  ## POST
  def create
    @user = User.new(user_params)
    if User.find_by_email(user_params[:email]) 
      ## Redirect to edit if email has been saved to db
      redirect_to edit_user_path([:email])
    end
    redirect_to galleries_path if @user.save 
  end

  def edit
    @user = User.find_by_email(get_email)

    respond_to do |format| 
      format.html { 
        render component: 'UserForm',
          props: {
            authenticity_token: form_authenticity_token,
            jwt: session['jwt'],
            method: "patch",
            name: "edit_user",
            action: "/users/#{@user.id}",
            user: @user
        }
      }
      format.json { 
        render json: @user
      }
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profilen blev opdateret"

      respond_to do |format| 
        format.html 
e       format.json { 
          User.create(user_params)
          render json: @user 
        }
      end
    else
      respond_to do |format| 
        format.html { redirect_back(fallback_location: edit_user_path(params[:id])) } 
        format.json { render json: flash[:alert]}
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Brugeren er slettet"
  end

  def show 
    @user = User.find(params[:id])

    respond_to do |format| 
      format.html { render component: 'User', props: { 
        user: {
          id: @user.id,
          username: @user.username,
          firstname: @user.firstname,
          lastname: @user.lastname,
          zip: @user.zip,
          address: @user.address,
          avatar: @user.avatar.url,
          thumb: @user.avatar.thumb.url,
          likes: @user.get_upvotes.size,
          dislikes: @user.get_downvotes.size,
      } } }
      format.json { render json: @user }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :id, :email, :address, :username, :firstname, :lastname, :zip, :avatar)
    end
end
