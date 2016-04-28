class HomeController < ApplicationController
  def index
  end
  
  def user
    @users = User.all
    @page_title = "유저 보기"
  end
  
  def user_diary
    @post=User.find(params[:id]).posts
    @page_title = "친구 글보기"
  end
end
