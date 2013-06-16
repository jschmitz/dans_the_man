class AddGuestsController < ApplicationController
  include Wicked::Wizard

  steps :guest, :address, :additional_guest, :summary

  def show

    case step
    when :guest
      @guest = Guest.new
    when :address
      @address = Address.new
    when :additional_guest
      @guest = Guest.new
    when :summary
    end

    render_wizard

  end

  def create_guest
    @guest = Guest.new(guest_params)
    if @guest.save
      session[:guest_id] = @guest.id
      redirect_to wizard_path(:address)
    else
      render 'add_guests/guest'
    end
  end

  def create_additional_guest
    if params[:commit] == "Go to Summary"
      redirect_to wizard_path(:summary)            
    else
      @guest = Guest.new(guest_params)
      if @guest.save
        redirect_to wizard_path(:additional_guest) if params[:commit] == "Add More"
        redirect_to wizard_path(:summary)          if params[:commit] == "Add this one then go to Summary"
      else
        render 'add_guests/guest'
      end
    end
  end

  def create_address
    @address = Address.new(address_params)
    if @address.save
      @guest = Guest.find(session[:guest_id]).update_attribute(:address_id, @address.id)
      redirect_to wizard_path(:additional_guest)
    else
      render 'add_guests/address'
    end
  end

  def finish_wizard_path
    guests_path
  end

  private
  def guest_params
    params.require(:guest).permit(:address_id, :guest_id, :first_name, :last_name, :title, :email, :twenty_one, :eighteen)
  end

  def address_params
    params.require(:address).permit(:street_address, :city, :state, :zip_code)
  end

end
