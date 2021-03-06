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
    if go_to_summary?(params[:commit])
      redirect_to create_redirect_for(params[:commit])
    else
      guest = Guest.new(guest_params)
      if current_user.guests << guest
        redirect_to create_redirect_for(params[:commit])
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
    params.require(:guest).permit(:address_id, :guest_id, :first_name, :last_name, :title, :email, :twenty_one, :eighteen, :user_id)
  end

  def address_params
    params.require(:address).permit(:street_address, :city, :state, :zip_code)
  end

  def go_to_summary?(message)
    params[:commit] == "Go to Summary"
  end

  def one_and_done?(message)
    message == "Add this one then go to Summary"
  end

  def add_more?(message)
    message == "Add More"
  end

  def create_redirect_for(message)
   return wizard_path(:additional_guest) if add_more?(message)
   return wizard_path(:summary)          if one_and_done?(message)
   return wizard_path(:summary)          if go_to_summary?(message)
  end
end
