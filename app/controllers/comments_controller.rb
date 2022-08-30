class CommentsController < ApplicationController

  before_action :check_if_logged_in, except: [ :index, :show ]

   # CREATE #################################################
  def new
    @comment = Comment.new
  end

  def create
    # raise "hell"

    # why no comment outside when use raise hell ????????
    @comment = Comment.create(content: params[:content],
                              garment_id: params[:garment_id]
    )

    if @comment.persisted?
      redirect_to garment_path(params[:garment_id])
    else
      render :new #?????
    end


  end


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

  # def comment_params
  #   params.require(:comment)permit(:content, :user_id, :garment_id)
  # end




end # class CommentsController
