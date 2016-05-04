class DiaryController < ApplicationController
  before_action:authenticate_user!, only: [:new,:create,:show,:edit,:update,:destroy,:recent]
  
  def index
    @post = current_user.posts
    @page_title = "나의 글보기"
  end

  def recent
    @psot = Post.public.order('created_at DESC')
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
                        reflect: params[:reflect])
    #flash[:notice] = "글이 작성 되었습니다"
    redirect_to "/diary/show/#{diary.id}"
  end
  
  def show
    @post = Post.find(params[:id])
    @page_title = "글 보기"
  end

  def edit
    @post = Post.find(params[:id])
    @page_title = "글 수정"
  end
  
  def update
    a = Post.find(params[:id])
    if a.user_id == current_user.id
      a.title = params[:title]
      a.plan = params[:plan]
      a.research = params[:research]
      a.act = params[:act]
      a.observe_thing = params[:observe_thing]
      a.evaluate =  params[:evaluate]
      a.reflect = params[:reflect]
      a.save
      #flash[:notice] = "글이 수정 되었습니다"
      redirect_to "/diary/show/#{a.id}"
    else
      #flash[:error] = "잘못된 접근입니다."
      redirect_to "/diary/show/#{a.id}"
    end
  end
  
  def delete
    a=Post.find(params[:id])
    if a.user_id == current_user.id
      a.destroy
      #flash[:notice] = "글을 지웠습니다"
      redirect_to '/'
    else
      flash[:error] = "잘못된 접근입니다."
      redirect_to "/diary/show/#{a.id}"
    end
  end
  
end
