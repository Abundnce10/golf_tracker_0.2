class StatesController < ApplicationController
  # GET /states
  # GET /states.json
  def index
    @states = State.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @states }
    end
  end


  # GET /states/1
  # GET /states/1.json
  def show
    @state = State.find(params[:id])
    @courses = @state.courses.order("name ASC")
=begin
    @courses_city_zip = []
    @courses.each do |course|
      city = City.find(course.city_id)
      z = Zipcode.find(course.zipcode_id)
      address = Address.find(course.address_id)
      state = State.find(course.state_id)

      @courses_city_zip.push([course.id, course.name, address.street, city.name, state.abbreviation, z.zipcode])
    end

    return @courses_city_zip
=end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @state }
    end
  end


  # GET /states/new
  # GET /states/new.json
  def new
    @state = State.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @state }
    end
  end

  # GET /states/1/edit
  def edit
    @state = State.find(params[:id])
  end

  # POST /states
  # POST /states.json
  def create
    @state = State.new(params[:state])

    respond_to do |format|
      if @state.save
        format.html { redirect_to @state, notice: 'State was successfully created.' }
        format.json { render json: @state, status: :created, location: @state }
      else
        format.html { render action: "new" }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /states/1
  # PUT /states/1.json
  def update
    @state = State.find(params[:id])

    respond_to do |format|
      if @state.update_attributes(params[:state])
        format.html { redirect_to @state, notice: 'State was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
    @state = State.find(params[:id])
    @state.destroy

    respond_to do |format|
      format.html { redirect_to states_url }
      format.json { head :no_content }
    end
  end
end
