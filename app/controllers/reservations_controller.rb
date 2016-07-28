class ReservationsController < ApplicationController
  #get
  def book
    @book = Book.find(params["id"])
    @reservations = Reservation.all.select{|i| i.book_id == @book.id}
    render :book_reservation
  end
  #get
  def all
    @reservations = Reservation.all
    @reservation = Reservation.new

    render :all_reservations
  end

  #post
  def add
    @reservation = Reservation.create(reservation_params)
    @reservation.update(due_on: Time.now + 14.days)
    redirect_to "/reservations"
  end

  #get
  def details
    # @book = Book.find(params["id"])
    # @reservations = Reservation.all.select{|i| i.book_id == @book.id}
    # @current_reservation = @reservations[-1]

    @reservation = Reservation.find(params["id"])
    @book = @reservation.book

    render :current_reservation
  end

  #patch
  def return
    #code
  end
end

private def reservation_params
  params.require("reservation").permit(:name, :book_id, :due_on)
end
