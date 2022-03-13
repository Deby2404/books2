class BooksController < ApplicationController
  def new
   @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book = user.id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def index
    @book = Book.all
    @book = Book.new
  end

  def show
    @book = book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
