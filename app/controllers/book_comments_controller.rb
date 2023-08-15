class BookCommentsController < ApplicationController
  
  before_action :authenticate_user!

    def create
        book = Book.find(params[:book_id]) #コメントする投稿id
        comment = current_user.book_comments.new(book_comment_params)
        comment.book_id = book.id #どの投稿にコメントするか
        comment.save
        redirect_to request.referer
    end

    def destroy
        BookComment.find(params[:id]).destroy
        redirect_to book_path(params[:book_id])
    end

    private

    def book_comment_params
        params.require(:book_comment).permit(:comment)
    end
end
