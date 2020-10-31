class DatosController < ApplicationController

  FIXNUM_MAX = (2**(0.size * 8 -2) -1)

  def lnds_create
    @datos = []
    codigo = Random.rand(FIXNUM_MAX)
    10.times {
      dato = Dato.new(codigo:codigo, nombre: "dato #{codigo}", cuando: DateTime.now)
      dato.save
      @datos << dato
      codigo += 1
    }
    render json: @datos
  end
  
  def lnds_json_list
    k = Random.rand(FIXNUM_MAX)
    @datos = Dato.where(:codigo.gte => k).limit(10)
    render json: @datos
  end
  
  def lnds_list
    k = Random.rand(FIXNUM_MAX)
    @datos = Dato.where(:codigo.gte => k).limit(10)
    render :template => 'datos/index'
  end

  # GET /datos
  # GET /datos.json
  def index
    @datos = Dato.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @datos }
    end
  end

  # GET /datos/1
  # GET /datos/1.json
  def show
    @dato = Dato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dato }
    end
  end

  # GET /datos/new
  # GET /datos/new.json
  def new
    @dato = Dato.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dato }
    end
  end

  # GET /datos/1/edit
  def edit
    @dato = Dato.find(params[:id])
  end

  # POST /datos
  # POST /datos.json
  def create
    @dato = Dato.new(params[:dato])

    respond_to do |format|
      if @dato.save
        format.html { redirect_to @dato, notice: 'Dato was successfully created.' }
        format.json { render json: @dato, status: :created, location: @dato }
      else
        format.html { render action: "new" }
        format.json { render json: @dato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /datos/1
  # PUT /datos/1.json
  def update
    @dato = Dato.find(params[:id])

    respond_to do |format|
      if @dato.update_attributes(params[:dato])
        format.html { redirect_to @dato, notice: 'Dato was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datos/1
  # DELETE /datos/1.json
  def destroy
    @dato = Dato.find(params[:id])
    @dato.destroy

    respond_to do |format|
      format.html { redirect_to datos_url }
      format.json { head :no_content }
    end
  end
end
