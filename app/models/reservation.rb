class Reservation < ActiveRecord::Base
  belongs_to :book
  validates :book_id, numericality: true, presence: true
  validates :name, presence: true
end
