class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :cart_not_found
  before_action :set_cart, only: %i[ show edit update destroy ] 
  

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end 

  # GET /carts/1 or /carts/1.json
  
    def show
      if Cart.exists?(params[:id])
        @cart = Cart.find(params[:id])
      else
        redirect_to root_path, notice: "Cart doesn't exist"
      end
    
    
    
    
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
        format.js { render :create }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  private

  def cart_not_found 
    logger.error "invalid cart #{params[:id]}"
    redirect_to root_path, notice: "Cart doesn't exist"
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      if Cart.exists?(params[:id])
         @cart = Cart.find(params[:id])
      else
        redirect_to root_path, notice: "Cart doesn't exist"
      end
    end
  



    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end
end
