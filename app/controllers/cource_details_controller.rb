class CourceDetailsController < ApplicationController
  # GET /cource_details
  # GET /cource_details.json
   
  # before_filter :check_users
     #skip_before_action :authenticate_user!, only: :index, if: Proc.new { :is_public? }
  layout 'application'
  before_filter :except => [:index,:signout] do
    flash[:notice] = 'You dont have enough permissions to be enter other action'  if !current_user.valid_password?('staff')
     redirect_to cource_details_path if !current_user.valid_password?('staff')
  end

  def index
     @cource_details = CourceDetail.all
   # User.find(current_user.id).valid_password?('password123')
    # raise User.find(current_user.id).valid_password?('12345').inspect
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cource_details }
    end
  end

  # GET /cource_details/1
  # GET /cource_details/1.json
  def show
    @cource_detail = CourceDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cource_detail }
    end
  end

  # GET /cource_details/new
  # GET /cource_details/new.json
  def new
    @cource_detail = CourceDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cource_detail }
    end
  end

  # GET /cource_details/1/edit
  def edit
    @cource_detail = CourceDetail.find(params[:id])
  end

  # POST /cource_details
  # POST /cource_details.json
  def create
    @cource_detail = CourceDetail.new(params[:cource_detail])
    status = @cource_detail.save
    @syllabus= Syllabus.new(params[:syllabus].merge(:cource_detail_id => @cource_detail.id))
    status = @syllabus.save
    @chapter = Chapter.new(params[:chapter].merge(:syllabus_id=>@syllabus.id))
    status = @chapter.save
    
    respond_to do |format|
      if status
        format.html { redirect_to @cource_detail, notice: 'Cource detail was successfully created.' }
        format.json { render json: @cource_detail, status: :created, location: @cource_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @cource_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cource_details/1
  # PUT /cource_details/1.json
  def update
    @cource_detail = CourceDetail.find(params[:id])

    respond_to do |format|
      if @cource_detail.update_attributes(params[:cource_detail])
        format.html { redirect_to @cource_detail, notice: 'Cource detail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cource_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cource_details/1
  # DELETE /cource_details/1.json
  def destroy
    @cource_detail = CourceDetail.find(params[:id])
    @cource_detail.destroy

    respond_to do |format|
      format.html { redirect_to cource_details_url }
      format.json { head :ok }
    end
  end


  def add_syllabus
    @ind = params[:ind].to_i
    render :layout=>false
  end

  def add_subject
     @ind = params[:ind].to_i
     render :layout=>false
  end

   def signout
    status=current_user.update_attributes(:status=>false)
    resource_name=:user
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    #set_flash_message :notice, :signed_out if signed_out && is_navigational_format?

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request

      redirect_to(root_url)
    end
end
