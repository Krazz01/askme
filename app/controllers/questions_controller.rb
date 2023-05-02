class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy hide]

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы'
      render :new
    end
  end

  def update
    @question.update(question_params)
    if @question.save
      redirect_to question_path(@question), notice: 'Вопрос обновлен!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы'
      render :new
    end

  end

  def hide
    @question.update(hidden: true)
    redirect_to question_path(root_path), notice: 'Вопрос скрыт!'
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: 'Вопрос удален!'
  end

  def show
  end

  def index
    @question = Question.new
    @questions = Question.all
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
