class BillingController < ApplicationController
  def index; end

  def new
    respond_to :js
  end

  def create
    respond_to do |format|
      unless current_user.stripe_id
        customer = Stripe::Customer.create email: current_user.email
        current_user.update_attributes stripe_id: customer.id
      end

      card_token = params[:stripeToken]
      format.html {redirect_to billing_path, error: t(".fails")} unless card_token

      customer = Stripe::Customer.new current_user.stripe_id
      customer.source = card_token
      if customer.save
        flash[:success] = t "success"
      else
        flash[:danger] = t "fails"
      end
      format.html {redirect_to success_path}
    end
  end
	
  def success; end

  def payment
    customer = Stripe::Customer.new current_user.stripe_id
    hiring = current_user.hirings.last
    vehicle = hiring.vehicle
    if hiring
      if Stripe::Charge.create payment_params(customer, hiring, vehicle)
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".fails"
      end
    else
      flash[:danger] = t ".hiring_not_exist"
    end
    redirect_to root_path
  end

  private

  def payment_params customer, hiring, vehicle
    {
      customer: customer.id,
      amount: (hiring.time * vehicle.price) / Settings.exchange,
      description: t(".payments"),
      currency: :usd
    }
  end
end
