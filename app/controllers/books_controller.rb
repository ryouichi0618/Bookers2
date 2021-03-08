class BooksController < ApplicationController


  before_action :correct_book,only: [:edit]

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render action: :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @comment = BookComment.new
    @user = User.find_by(id: @book.user_id)
    @new_book = Book.new
   
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render action: :edit
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path
  end

  def correct_book
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
