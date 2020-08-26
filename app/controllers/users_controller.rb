class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
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

  def list_registries

    
    @registries = []
    
    response = RestClient.get 'https://proyectofinal.planodelta.digital/api/usuarios/'+params[:id]+'/formularios'
    json = JSON.parse response
    
    if !json.nil?
      json.map do |registro|
        puts registro["id"]
        registry = Registry.new(id: "#{registro["id"]}", name: "#{registro["name"]}", educationLevel: "#{registro["educationLevel"]}", latitude: "#{registro["latitude"]}", longitude: "#{registro["longitude"]}")
        if !registro["foto"].nil?
          picture = Picture.new(id:  "#{registro["foto"]["id"]}", base64Picture: "#{registro["foto"]["fotoBase64"]}", registry: registry)
        end
        @registries << registry
        
        # User.create(id: "#{usuario["id"]}", userName: "#{usuario["nombreUsuario"]}", password: "#{usuario["password"]}", admin: "#{usuario["admin"]}")
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:userName, :password, :admin)
    end
end
