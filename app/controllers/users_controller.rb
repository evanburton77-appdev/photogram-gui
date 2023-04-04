class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    url_username = params.fetch("username")
    matching_usernames = User.where({ :username => url_username })
    @the_user = matching_usernames.first

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show.html.erb" })
    end
  end

  def create
    user = User.new
    user.username = params.fetch("username")
    user.save
    redirect_to("/users/" + user.username.to_s)
  end

  def update
    new_username = params.fetch("new_username")
    old_username = params.fetch("old_username")
    user = User.where({ :username => old_username }).first
    user.username = new_username
    user.save
    redirect_to("/users/" + user.username.to_s)
  end
end
