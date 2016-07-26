class Book < ActiveRecord::Base
  # validates :ISBN, uniqueness: true
  validates :title, presence: true
end
