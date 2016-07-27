require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "can be persisted" do
    pig = Book.create(title: "3 little pigs")
    assert pig.persisted?
  end
end
