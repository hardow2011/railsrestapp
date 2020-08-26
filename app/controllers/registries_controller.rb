class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]

  # GET /registries
  # GET /registries.json
  def index
    @registries = Registry.all
  end

  # GET /registries/1
  # GET /registries/1.json
  def show
  end

  # GET /registries/new
  def new
    @registry = Registry.new

    @users = []

    response = RestClient.get 'https://proyectofinal.planodelta.digital/api/usuarios'
    json = JSON.parse response
    
    if !json.nil?
      json.map do |usuario|
        puts usuario["id"]
        @users << User.new(id: "#{usuario["id"]}", userName: "#{usuario["nombreUsuario"]}", password: "#{usuario["password"]}", admin: "#{usuario["admin"]}")
      end
    end

  end

  # GET /registries/1/edit
  def edit
  end

  # POST /registries
  # POST /registries.json
  def create
    @registry = Registry.new(registry_params)

    RestClient.post 'https://proyectofinal.planodelta.digital/api/usuarios', @registry.to_json, {content_type: :json, accept: :json}

    redirect_to action: "new"
  end

  # PATCH/PUT /registries/1
  # PATCH/PUT /registries/1.json
  def update
    respond_to do |format|
      if @registry.update(registry_params)
        format.html { redirect_to @registry, notice: 'Registry was successfully updated.' }
        format.json { render :show, status: :ok, location: @registry }
      else
        format.html { render :edit }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registries/1
  # DELETE /registries/1.json
  def destroy
    @registry.destroy
    respond_to do |format|
      format.html { redirect_to registries_url, notice: 'Registry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry
      @registry = Registry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registry_params
      params.require(:registry).permit(:name, :educationLevel, :latitude, :longitude, :user_id)
    end
end
