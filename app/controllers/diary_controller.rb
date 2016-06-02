class DiaryController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:show,:edit,:update,:delete,:recent]
  before_action :set_post, only: [ :show, :edit, :update, :delete ]
  before_action :correct_user, only: [ :edit, :update, :delete ]
  
  def index
    @post = current_user.posts
    @page_title = "나의 글보기"
  end

  def recent
    @posts = Post.is_public.order('created_at DESC')
  end



  def new
    @page_title = "글 작성"
  end
  
  def create 
    diary = Post.create(user_id: current_user.id,
                        title: params[:title], 
                        plan: params[:plan], 
                        research: params[:research],
                        act: params[:act],
                        observe_thing: params[:observe_thing],
                        evaluate: params[:evaluate],
                        reflect: params[:reflect],
                        is_private: params[:is_private])
    #flash[:notice] = "글이 작성 되었습니다"
    redirect_to "/diary/show/#{diary.id}"
  end
  
  def show
    if @post.is_private? && current_user != @post.user
      redirect_to root_path and return
    end
    @page_title = "글 보기"
  end

  def edit
    @page_title = "글 수정"
  end
  
  def update
    if @post.user_id == current_user.id
      @post.title = params[:title]
      @post.plan = params[:plan]
      @post.research = params[:research]
      @post.act = params[:act]
      @post.observe_thing = params[:observe_thing]
      @post.evaluate =  params[:evaluate]
      @post.reflect = params[:reflect]
      @post.is_private = params[:is_private]
      @post.save
      #flash[:notice] = "글이 수정 되었습니다"
      redirect_to "/diary/show/#{@post.id}"
    else
      #flash[:error] = "잘못된 접근입니다."
      redirect_to "/diary/show/#{@post.id}"
    end
  end
  
  def delete
    @post.destroy
    #flash[:notice] = "글을 지웠습니다"
    redirect_to :controller => 'diary', :action => 'index'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user
    unless current_user == @post.user
      flash[:error] = "잘못된 접근입니다."
      redirect_to root_path
    end
  end
  
end
