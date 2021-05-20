class UsersController < ApplicationController
  # users index
  get "/users" do
    @users = User.all
    erb :"users/index.html"
  end

  # new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # users show
  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"users/show.html"
  end


  # create
  post "/users" do
    user = User.create(params)
    if user.valid?
      flash[:success] = ["You have successfuly created your account"]
      session[:user_id] = user.id
      redirect "/"
    else
      flash[:errors] = user.errors.full_messages
      redirect "/users/new"
    end
  end

  
end
