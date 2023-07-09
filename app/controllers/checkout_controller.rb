class CheckoutController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  include CurrentCart


    def show
      current_user.set_payment_processor :Stripe
        current_user.payment_processor.customer
        @checkout_session = current_user
          .payment_processor.checkout()
          .checkout(
                mode: 'payment',
                line_items: 'price_1MWMTiC7Jfkko8zkmiGiJkn3',
                success_url: checkout_success_url,
          )
    end
  

  def create
 
      @order = Order.new
      @order.user = current_user
      if @current_cart.nil?
      @Current_cart = current_user

      @order.price_cents = @current_cart.total * 100
      # SETTING UP a STRING variable for payment
      if @product.nil?
        redirect_to root_path # juste pour voir où le redirect 
        return
      end
    end
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @product.name,
          description: @product.description,
          amount: @product.price_cents,
          currency: 'EUR',
          quantity: 1
        }],
        success_url: checkout_success_url,
        cancel_url: checkout_cancel_url
      )
      respond_to do |format|
        format.html { redirect_to checkout_success, notice: "thanks foor your order" }
        format.js
        format.json { render :show, status: :created, location: checkout }
        end
  end
  

  def success
      end

  def total
   line_items.inject(0) {|sum, item| sum + item.total}
 end
    

 end

  # current_user.set_payment_processor :Stripe
  # current_user.payment_processor.customer
  # @checkout_session = current_user
    # .payment_processor.checkout()
    # .checkout(
      # mode: 'payment',
      # line_items: 'price_1MWMTiC7Jfkko8zkmiGiJkn3',
      # success_url: checkout_success_url,
    # )
  # end
  # def create
    # 
    # @order = Order.new
    # @order.user = current_user
    # @order.price_cents = current_cart.total * 100
    # if @order.save
      # Stripe::Charge.create(
        # amount: @order.price_cents,
        # currency: "€",
        # source: params[:stripeToken],
        # description: "Payment for product #{@order.product.name}",
        # receipt_email: @order.email
      # )
      # redirect_to @order, notice: 'Order created successfully.'
    # else
      # redirect_to root_url, notice: 'Order creation failed.'
    # end
  # end 