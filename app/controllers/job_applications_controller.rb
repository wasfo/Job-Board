class JobApplicationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_job_application, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token
  # GET /job_applications or /job_applications.json
  def index
    if admin?
      @job_applications = JobApplication.all

    else
      @job_applications = current_user.job_applications.all
    end
    @job_posts_titles = @job_applications.map { |application| application.job_post.title }
  end

  # POST /mark_as_seen
  #
  def mark_as_seen

    job_application_id = params[:job_application_id]
    ja = JobApplication.find(job_application_id)
    ja.seen = true
    ja.save

  end

  # GET /job_applications/1 or /job_applications/1.json
  def show
  end

  # GET /job_applications/new
  def new
    @job_application = JobApplication.new
    @job_post_id = params[:var1]
    @job_post_title = params[:var2]
  end

  # GET /job_applications/1/edit

  # POST /job_applications or /job_applications.json
  def create
    @job_application = JobApplication.new(job_application_params)
    respond_to do |format|
      if @job_application.save
        format.html { redirect_to job_application_url(@job_application), notice: "Job application was successfully created." }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_applications/1 or /job_applications/1.json
  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html { redirect_to job_application_url(@job_application), notice: "Job application was successfully updated." }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1 or /job_applications/1.json
  def destroy
    @job_application.destroy
    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: "Job application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def job_application_params
    params.require(:job_application).permit(:seen, :name, :email, :phone, :coverletter, :job_post_id, :user_id)
  end
end
