class BooksController < ApplicationController
  #get
  def index
    @books = Book.all
    @book = Book.new
  end

  #post
  def add
    @book = Book.create(book_params)
    redirect_to "/books"
  end

  #get
  def current
    @book = Book.find(params["id"])
    render :book_page
  end

  #patch
  def edit
    @book = Book.find(params["id"])
    @book.update(book_params)

    redirect_to "/books/#{@book.id}"
  end

  #delete
  def delete
    @book = Book.find(params["id"]).destroy

    redirect_to "/books"
  end

  private def book_params
    params.require("book").permit!
  end
end
