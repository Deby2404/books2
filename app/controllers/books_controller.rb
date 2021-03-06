class BooksController < ApplicationController

  before_action :ensure_correct_user, only:[:edit]



  def create
    @user = current_user
    @books = Book.all
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
    flash[:notice]="You have created book successfully."
    redirect_to book_path(@new_book)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if  @user = current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @books = Book.all
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
    redirect_to books_path
    end
  end
end
