class UsersController < ApplicationController
  def show
    @user = User.eager_load(
      :feed => { 
        :comments => [:author], 
        :likes => [:fan], 
        :owner => {}
      }).find(params[:id])
      
    render(json: @user.as_json(
      # only: [:id, :username]
      include: {
        feed: {
         include: {
            comments: {
                include: :author
            },
              owner: {},
              likes: {
                 include: :fan
              }
             }
            }
        }
      
    ))
  end
end
