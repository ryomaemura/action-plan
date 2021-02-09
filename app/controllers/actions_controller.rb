class ActionsController < ApplicationController
  require "net/http"

  before_action :require_user_is_login, only: [:new, :edit, :create, :update, :destroy]
  before_action :correct_user, only: [:destroy]

  def index
    @actions = Action.order(id: :desc)
  end

  def show
    @action = Action.find(params[:id])
  end

  def new
    @action = current_user.actions.build
  end

  def edit
    @action = Action.find(params[:id])
  end

  def create
    @action = current_user.actions.build(content: action_params[:content], book_title: params[:book_title], book_image: params[:book_image], book_link: params[:book_link])
    if @action.save
      flash[:success] = "アクションプランを投稿しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "アクションプランの投稿に失敗しました。"
      render :new
    end
  end

  def update
    @action = Action.find(params[:id])
    if @action.update(content: action_params[:content])
      flash[:success] = "アクションプランを更新しました。"
      redirect_to @action
    else
      flash.now[:danger] = "アクションプランの更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @action = Action.find(params[:id])
    if @action.destroy
      flash[:success] = "アクションプランを削除しました。"
      redirect_to root_url
    else
      flash[:danger] = "アクションプランの削除に失敗しました。"
      render @action
    end
  end

  private

  # strong parameter
  def action_params
    params.permit(:content)
  end

  # ログインしてるユーザーの投稿かどうか判定
  def correct_user
    @action = current_user.actions.find_by(id: params[:id])
    unless @action
      redirect_to root_url
    end
  end
end