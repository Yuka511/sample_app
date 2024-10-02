class ListsController < ApplicationController
  def new
    @list =List.new # Viewへ渡すためのインスタンス変数イン空のModelオブジェクトを生成する。
  end
  
  #以下追加【アプリケーション2章】→【8章にてif式へ書き換え】
  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  #以下【アプリケーション3章】
  def index
    @lists = List.all
  end

  #以下【アプリケーション4章】
  def show
    @list = List.find(params[:id])
  end

  #以下【アプリケーション5章】
  def edit
    @list =List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  #以下【アプリケーション7章】
  def destroy
    list =List.find(params[:id]) #データ（レコード）を1件取得
    list.destroy #データ（レコード）を削除
    redirect_to '/lists' #投稿一覧画面へリダイレクト
  end
  
  private
  def list_params #ストロングパラメータ
    params.require(:list).permit(:title, :body, :image)
  end
end
