class CandidatesController < ApplicationController

  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
 
  layout 'candidate', only: [:new]
  layout 'admin', only: [:index,:show]

  def index
    @candidates = Candidate.all.order('created_at desc')
  end
 
  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to '/'}
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  

  private
     def set_candidate
      @candidate = Candidate.find(params[:id])
    end

     def candidate_params
      params.require(:candidate).permit(:first_name,:last_name,:email,:contact_number,:state,:city,:street,:qualification,:document,:experience,:job_title)
    end
end
