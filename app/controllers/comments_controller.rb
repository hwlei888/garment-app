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
      render 'garments/show' 
    end # if


  end # create


  # READ #################################################
  def index
  end

  def show
  end


  # UPDATE #################################################
  def edit
  end

  def update
  end


  # DESTROY #################################################
  def destroy
  end

  private

  # always from the form, doorman, filter
  def comment_params
    params.require(:comment).permit(:content, :garment_id)
  end




end # class CommentsController
