require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "can get all books" do
    response = get :index
    assert_response :success
    # assert_includes response.body, "3 little pigs"
  end

  test "can get book details" do
    response = get(:current, id: Book.last.id)
    assert_response :success
  end

  test "can create new book" do
    response = post(:add, {book: {title: "hi"}})
    assert_response :redirect
  end

  test "can get book details 2" do
    response = get :index, {id: Book.last.id}
    assert_response :success
  end

  test "can edit book details" do
    @book = Book.last
    response = patch :edit, {id: @book.id, book: {title: "fluffy"}}
    @book.reload

    assert_equal "fluffy", @book.title
    assert_response :redirect
  end

  test "can delete a book" do
    @book = Book.last

    response = delete :delete, {id:@book.id}
    assert_response :redirect

    assert_raises ActiveRecord::RecordNotFound do
      @pet.reload
    end

  end
end
