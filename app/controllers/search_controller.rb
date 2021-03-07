class SearchController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @how = params[:how]
    if @model == 'user'
      @records = User.search_for(@content,@how)
    elsif @model == 'book'
      @records = Book.search_for(@content,@how)
    end
  end

	
end