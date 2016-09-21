class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.new(comment_params)
    @comment.user_id = current_user.id if current_user
    @comment.save
    redirect_to book_path(@book)
  end

    def destroy
      @book = Book.find(params[:book_id])
      @comment = @book.comments.find(params[:id])
      @comment.destroy
      redirect_to book_path(@book)
  end

  private
    def comment_params
      params.require(:comment).permit(:body,:user_id)
    end
end
