class CommentsController < ApplicationController
before_action :set_comment, :require_permission, only: [:destroy]

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.new(comment_params)
    @comment.user_id = current_user.id if current_user
    @comment.save
    redirect_to book_path(@book)
  end


    def destroy
      @comment.destroy
      redirect_to book_path(@book)
  end

  private
    def comment_params
      params.require(:comment).permit(:body,:user_id)
    end

    def set_comment
      @book = Book.find(params[:book_id])
      @comment = @book.comments.find(params[:id])
    end

    def require_permission
      if current_user != @comment.user
        flash[:danger] = "You don't have permission"
        redirect_to books_path(@book)
      end
    end
end
