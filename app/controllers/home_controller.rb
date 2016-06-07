class HomeController < ApplicationController
  def index
  end

  def today
    @posts = Post.where("created_at >= ?", Time.zone.now.beginning_of_day).where(:is_private => false).order("created_at DESC")
    @page_title = "오늘의 글보기"
  end

  def recent
    @posts = Post.where(:is_private => false).order("created_at DESC").limit(10)
    @page_title = "최신글보기"
  end
  def user
    @users = User.all
    @page_title = "유저 보기"
  end
  
  def user_diary
    @post=User.find(params[:id]).posts.is_public
    @page_title = "친구 글보기"
  end
end
