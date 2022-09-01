class CommentsController < ApplicationController

  before_action :check_if_logged_in, except: [ :index, :show ]

   # CREATE #################################################
  def new
    @comment = Comment.new
  end

  def create
    # raise "hell"

    @comment = Comment.create comment_params

    @comment.user_id = @current_user.id
    @comment.save

    if @comment.persisted?
        redirect_to garment_path(params[:comment][:garment_id])
    else
      @garment = Garment.find params[:comment][:garment_id]
      render 'garments/show' # only it is not working, use render
    end # if


  end # create


  # READ #################################################
  def index
  end

  def show
  end


  # UPDATE #################################################
  def edit
    # if want to do the edit on the same page without changing url, it will need jquery. Like building a input and hide it, when click edit it will show up.
  end

  def update
  end


  # DESTROY #################################################
  def destroy
    # raise "hell"
    # @garment = Comment.find(params[:id]).garment
    comment = Comment.destroy params[:id] # will also return that destroyed comment
    
    redirect_to garment_path(comment.garment) 
    #redirect to that url, if render to show, the url would be the destroyed comment url

  end

  private

  # always from the form, doorman, filter
  def comment_params
    params.require(:comment).permit(:content, :garment_id)
  end




end # class CommentsController
