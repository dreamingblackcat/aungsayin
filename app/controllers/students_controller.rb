class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  before_action :authorize_user, only: [:edit, :update]
  before_action :authorize_super_admin, only: [:destroy]
  # GET /students
  # GET /students.json
  def index
    @students = Student.page(params[:page])
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @students = Student.search(@search).page(params[:page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.permit(:search).require(:student).permit(:roll_no, :name_en, :name_my, :exam_status, :distinctions, :major, :year)
    end

    def authorize_user
      redirect_to :back, error: "You can't perform this action" unless current_user.present?
    end

    def authorize_super_admin
      redirect_to :back, error: "You can't perform this action" unless current_user.present?
    end
end
