class BooksController < ApplicationController


  def index
    @user = current_user
    # 新規投稿機能
    @book = Book.new
    # 一覧機能
    @books = Book.all
    # @user = User.find(params[:id])
    
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def show
    # 新規投稿機能
    # @book_user = Book.find_by(id: params[:id])
  
    # @book = Book.find_by(id:　params[:id])
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
    @new_book = Book.new
   
    # 詳細の為user_idからユーザー情報を取得する
    # @book_user = Book.find_by(id:　params[:id])
    # @user = User.find_by(id: @book_user.user_id)
    # @bookにユーザー情報を入れ、そのユーザー情報のidを@userに入れる。
    # 今回は投稿に紐付いているユーザー名を表示なので投稿の情報からuser_idをひっぱり、それからuser情報をひっぱる。

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    book =  Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end




  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
