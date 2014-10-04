class ReservationsController < ApplicationController

  def welcome
  end

  def index
    @reservations = Reservation.all.order(start_at: :asc)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.member_id = current_user.member.id
    # FIXME: figure out how to decide section_type
    @reservation.section_type = "undefined"

    if @reservation.save
      redirect_to reservations_path, :notice => '新增預約成功！'
    else
      render :new
    end
  end


  private

  def reservation_params
    params.require(:reservation).permit(:start_at,
                                        :end_at)
  end
  
end
