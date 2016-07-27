class ReservationsController < ApplicationController
  #get
  def book
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
    redirect_to "/reservations"
  end
  #get
  def details
    #code
  end
  #patch
  def return
    #code
  end
end

private def reservation_params
  params.require("reservation").permit(:name, :book_id, :due_on)
end
