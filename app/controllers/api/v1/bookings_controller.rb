class Api::V1::BookingsController < Api::V1::BaseController
  def index
    @bookings = Booking.all.select { |booking| booking.user == User.find(params[:user_id]) }
    render json: { games: @bookings.map(&:product), bookings: @bookings }
  end

  def create
    @product_id = params[:product_id]
    @product = Product.find(@product_id)
    @user_id = params[:user_id]
    if User.find(@user_id).bookings.map(&:product).include?(@product)
      render json: { message: "already exist" }
    else
      @new_booking = Booking.new(date_params)
      @new_booking.product = Product.find(@product_id)
      @new_booking.user = User.find(@user_id)
      @new_booking.save
      render json: { message: "success" }
    end
  end

  def destroy
    @product_id = params[:product_id]
    @user_id = params[:user_id]
    if User.find(@user_id).bookings.map(&:product_id).include?(@product_id)
      User.find(@user_id).bookings.each { |booking| booking.destroy if booking.product_id == @product_id }
      render json: { message: "success" }
    else
      render json: { message: "not find" }
    end
  end

  private

  def date_params
    params.require(:date).permit(:time_from, :time_to)
  end
end
