class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def home
  end
  
  def index
    if params[:category].blank?
    @book = current_user.books
    else
      @category_id = Category.find_by(name: params[:category]).id
      @book = current_user.books.where(:category_id => @category_id)
    end
  end

  def show
  end

  def new
    @book = current_user.books.build
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to root_path
    else 
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

    def book_params
      params.require(:book).permit(:title, :description, :author, :language, :user_id, :category_id)
    end

    def find_book
      @book = Book.find(params[:id])
    end
end
