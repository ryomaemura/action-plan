class BooksController < ApplicationController
  before_action :require_user_is_login, only: [:new, :search]

  def new
  end

  def search
    @books = get_json_from_url(url_from_keyword(params[:keyword]))
    render :new
  end

  private

  # URLからJSONデータを取得
  def get_json_from_url(url)
    JSON.parse(Net::HTTP.get(URI.parse(URI.encode(url))))
  end

  # キーワードからURLを作成
  def url_from_keyword(keyword)
    "https://www.googleapis.com/books/v1/volumes?q=#{keyword}&country=JP&maxResults=20"
  end
end
