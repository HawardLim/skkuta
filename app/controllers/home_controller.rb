class HomeController < ApplicationController
  def review
    @every_review = Review.all
  end
  
  def write
    @review = Review.new(title: params[:title], content: params[:content], user: current_user)
    @review.save
    redirect_to "/home/index"
  end
  def store_delete
    @stores = Store.find(params[:id])
    @stores.destroy
    redirect_to "/home/index"
  end
  def update
    @one_review = Review.find(params[:id])
  end
  
  def destroy
    @one_review = Post.find(params[:id])
    @one_review.destroy
    redirect_to '/home/index'
  end
  
  def update_act
    @one_review = Review.find(params[:id])
    @one_review.title = params[:head]
    @one_review.content = params[:body]
    @one_review.save
    redirect_to '/home/index'
  end
  
  def write_store_complete
    @stores = Store.new
    @stores.s_name = params[:s_name]
    @stores.s_number = params[:s_number]
    @stores.s_deliverytime = params[:s_deliverytime]
    @stores.s_time = params[:s_time]
    @stores.s_card = params[:s_card]
    @stores.s_min = params[:s_min]
    @stores.s_location = params[:s_location]
    @stores.s_intro = params[:s_intro]
    @stores.s_type = params[:s_type]
    @stores.s_card_ok = params[:s_card_ok]
    @stores.s_divide_ok = params[:s_divide_ok]
    @stores.s_deliver_ok = params[:s_deliver_ok]
    file = params[:s_picture]
    uploader = StorepicUploader.new
    uploader.store!(file)
    @stores.s_pic = uploader.url
    file1 = params[:s_menu_picture]
    uploader1 = StorepicUploader.new
    uploader1.store!(file1)
    @stores.s_menu_pic = uploader.url
    @stores.save
    redirect_to "/home/index"
  end
  def spec_edit
    @store = Store.find(params[:id])
  end 
  def edit_store_complete
    @stores = Store.find(params[:id])
    @stores.s_name = params[:s_name]
    @stores.s_number = params[:s_number]
    @stores.s_deliverytime = params[:s_deliverytime]
    @stores.s_time = params[:s_time]
    @stores.s_card = params[:s_card]
    @stores.s_min = params[:s_min]
    @stores.s_location = params[:s_location]
    @stores.s_intro = params[:s_intro]
    @stores.s_type = params[:s_type]
    @stores.s_card_ok = params[:s_card_ok]
    @stores.s_divide_ok = params[:s_divide_ok]
    @stores.s_deliver_ok = params[:s_deliver_ok]
    file = params[:s_picture]
    uploader = StorepicUploader.new
    uploader.store!(file)
    @stores.s_pic = uploader.url
    file1 = params[:s_menu_picture]
    uploader1 = StorepicUploader.new
    uploader1.store!(file1)
    @stores.s_menu_pic = uploader.url
    @stores.save
    redirect_to "/home/index"
  end
  def spec
    @store_spec = Store.find(params[:id])
  end
  def list_china
    @stores = Store.where("s_type = '중식'")
  end
  def list_2nd
    @stores = Store.where("s_type = '뒷풀이'")
  end
  def list_korea
    @stores = Store.where("s_type = '한식'")
  end
  def list_gimbab
    @stores = Store.where("s_type = '분식'")
  end
  def list_western
    @stores = Store.where("s_type = '양식'")
  end
  def list_japan
    @stores = Store.where("s_type = '일본식'")
  end
  def list_burger
    @stores = Store.where("s_type = '햄버거'")
  end
  def list_pizza
    @stores = Store.where("s_type = '피자'")
  end
  def list_chicken
    @stores = Store.where("s_type = '치킨'")
  end
  def review_write
    @reviews = Review.new
    @reviews.store_id = params[:store_id]
    @stores = Store.find(params[:store_id])
    @reviews.r_text = params[:review_content]
    file = params[:r_picture]
    uploader = StorepicUploader.new
    uploader.store!(file)
    @reviews.r_pic = uploader.url
    @reviews.save
    redirect_to "/home/spec/#{@stores.id}"
  end
  
end
