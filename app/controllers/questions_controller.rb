class QuestionsController < ApplicationController
	before_action :set_question, only: %i[show edit update destroy hide]

	def create
    @question = Question.create(question_params)
    redirect_to question_path(@question), notice: 'Новый вопрос создан!'
	end

	def update
		@question.update(question_params)

		redirect_to question_path(@question), notice: 'Обновили вопрос!'		
	end

  def hide
    @question.update(hidden: true)
    redirect_to question_path("/questions"), notice: 'Вопрос скрыт!'
  end

  def destroy
		@question.destroy

		redirect_to questions_path, notice: 'Вопрос удален!'
	end

	def show
	end

	def index
		@question = Question.new
		@questions=Question.all
	end

	def new
		@question = Question.new
	end

  def edit
	end

  private 

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
     params.require(:question).permit(:body, :user_id, :hidden)
  end


end
