class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def add
    @book = Book.create(book_params)
    redirect_to "/books"
  end

  def current
    @book = Book.find(params["id"])
    render :book_page
  end

  def edit
    @book = Book.find(params["id"])
    @book.update(book_params)

    redirect_to "/books/#{@book.id}"
  end

  def delete
    @book = Book.find(params["id"]).destroy
    
    redirect_to "/books"
  end


  private def book_params
    params.require("book").permit!
  end
end
