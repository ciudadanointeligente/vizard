class RealProblemsController < ApplicationController
  before_action :set_real_problem, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @real_problems = RealProblem.all
    respond_with(@real_problems)
  end

  def show
    respond_with(@real_problem)
  end

  def new
    @real_problem = RealProblem.new
    respond_with(@real_problem)
  end

  def edit
  end

  def create
    @real_problem = RealProblem.new(real_problem_params)
    @real_problem.save
    respond_with(@real_problem)
  end

  def update
    @real_problem.update(real_problem_params)
    respond_with(@real_problem)
  end

  def destroy
    @real_problem.destroy
    respond_with(@real_problem)
  end

  private
    def set_real_problem
      @real_problem = RealProblem.find(params[:id])
    end

    def real_problem_params
      params.require(:real_problem).permit(:title, :description)
    end
end
