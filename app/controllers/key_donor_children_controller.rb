class KeyDonorChildrenController < ApplicationController
  before_action :set_key_donor_child, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /key_donor_children
  # GET /key_donor_children.json
  def index
    @key_donor_children = KeyDonorChild.all
  end

  # GET /key_donor_children/1
  # GET /key_donor_children/1.json
  def show
  end

  # GET /key_donor_children/new
  def new
    @key_donor_child = KeyDonorChild.new
  end

  # GET /key_donor_children/1/edit
  def edit
  end

  # POST /key_donor_children
  # POST /key_donor_children.json
  def create
    @key_donor_child = KeyDonorChild.new(key_donor_child_params)

    respond_to do |format|
      if @key_donor_child.save
        format.html { redirect_to @key_donor_child, notice: 'Key donor child was successfully created.' }
        format.json { render :show, status: :created, location: @key_donor_child }
      else
        format.html { render :new }
        format.json { render json: @key_donor_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_donor_children/1
  # PATCH/PUT /key_donor_children/1.json
  def update
    respond_to do |format|
      if @key_donor_child.update(key_donor_child_params)
        format.html { redirect_to @key_donor_child, notice: 'Key donor child was successfully updated.' }
        format.json { render :show, status: :ok, location: @key_donor_child }
      else
        format.html { render :edit }
        format.json { render json: @key_donor_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_donor_children/1
  # DELETE /key_donor_children/1.json
  def destroy
    @key_donor_child.destroy
    respond_to do |format|
      format.html { redirect_to key_donor_children_url, notice: 'Key donor child was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_donor_child
      @key_donor_child = KeyDonorChild.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_donor_child_params
      params.fetch(:key_donor_child, {})
    end
end
