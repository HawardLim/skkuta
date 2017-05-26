class HomeController < ApplicationController
  def review
    @every_review = Review.all
  end
  def index
  end
  def admin_store
    @news = Store.paginate(:page => params[:page], per_page: 10).order('created_at DESC')
  end
  def admin_reply
    @news = Review.paginate(:page => params[:page], per_page: 10).order('created_at DESC')
  end
  def view_count_up
    @store = Store.find(params[:id])
    @store.increment('click_count')
    @store.save
    redirect_to "/home/spec/#{@store.id}"
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
  def search_all
      #tag search or navbar search
      if params[:tag].nil?
        @tag_search = Tag.find(params[:id])
        @tag = @tag_search.name
      else
        @tag = params[:tag]
      end
      @stores=Store.where("(s_tag LIKE ?)","%#{@tag}%").paginate(:page => params[:page], per_page: 8)
      @search_stores = @stores.order('created_at DESC')
  end
  def write_ad_complete
    @ads = Ad.new
    @ads.ad_title = params[:a_title]
    @ads.ad_content = params[:a_content]
    @ads.ad_store = params[:a_store]
    @ads.store_id = params[:a_store_id]
    @ads.save
     redirect_to "/home/index"
  end 
  
  def write_store_complete
    @stores = Store.new
    @stores.s_name = params[:s_name]
    @stores.s_number = params[:s_number]
    @stores.s_deliverytime = params[:s_deliverytime]
    @stores.s_time = params[:s_time]
    @stores.s_card = params[:s_card]
    @stores.s_min = params[:s_min]
    @stores.s_site = params[:s_site]
    @stores.s_location = params[:s_location]
    @stores.theme = params[:s_theme]
    @stores.s_intro = params[:s_intro]
    @stores.s_type = params[:s_type]
    @stores.s_card_ok = params[:s_card_ok]
    @stores.s_divide_ok = params[:s_divide_ok]
    @stores.s_deliver_ok = params[:s_deliver_ok]
    @stores.s_tag = ""
    @stores.tags.clear
    #scan one_good column and save it to tags with cateory
    @hashtags = params[:s_tag].scan(/#\S+/)
    @hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      @stores.tags << tag
      @stores.s_tag << "#" + tag.name + " "
      tag.count +=1
      tag.save
    end
    file = params[:s_picture]
    uploader = StorepicUploader.new
    uploader.store!(file)
    @stores.s_pic = uploader.middle.url
    file1 = params[:s_menu_picture]
    uploader1 = StorepicUploader.new
    uploader1.store!(file1)
    @stores.s_menu_pic = uploader1.middle.url
    file2 = params[:s_menu_picture2]
    uploader2 = StorepicUploader.new
    uploader2.store!(file2)
    @stores.s_menu_pic2 = uploader2.middle.url
    file3 = params[:s_menu_picture3]
    uploader3 = StorepicUploader.new
    uploader3.store!(file3)
    @stores.s_menu_pic3 = uploader3.middle.url
    file4 = params[:s_menu_picture4]
    uploader4 = StorepicUploader.new
    uploader4.store!(file4)
    @stores.s_menu_pic4 = uploader4.middle.url
    file5 = params[:s_menu_picture5]
    uploader5 = StorepicUploader.new
    uploader5.store!(file5)
    @stores.s_menu_pic5 = uploader5.middle.url
    file6 = params[:s_menu_picture6]
    uploader6 = StorepicUploader.new
    uploader6.store!(file6)
    @stores.s_menu_pic6 = uploader6.middle.url
    @stores.save
    redirect_to "/home/spec/#{@stores.id}"
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
    @stores.s_site = params[:s_site]
    @stores.theme = params[:s_theme]
    @stores.s_location = params[:s_location]
    @stores.s_intro = params[:s_intro]
    @stores.s_type = params[:s_type]
    @stores.s_card_ok = params[:s_card_ok]
    @stores.s_divide_ok = params[:s_divide_ok]
    @stores.s_deliver_ok = params[:s_deliver_ok]
    @stores.s_tag = ""
    @stores.tags.clear
    #scan one_good column and save it to tags with cateory
    @hashtags = params[:s_tag].scan(/#\S+/)
    @hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      @stores.tags << tag
      @stores.s_tag << "#" + tag.name + " "
      tag.count +=1
      tag.save
    end
    if params[:s_picture].nil?
    else
    file = params[:s_picture]
    uploader = StorepicUploader.new
    uploader.store!(file)
    @stores.s_pic = uploader.middle.url
    end
    if params[:s_menu_picture].nil?
    else
    file1 = params[:s_menu_picture]
    uploader1 = StorepicUploader.new
    uploader1.store!(file1)
    @stores.s_menu_pic = uploader1.middle.url
    end
    if params[:s_menu_picture2].nil?
    else
    file2 = params[:s_menu_picture2]
    uploader2 = StorepicUploader.new
    uploader2.store!(file2)
    @stores.s_menu_pic2 = uploader2.middle.url
    end
    if params[:s_menu_picture3].nil?
    else
    file3 = params[:s_menu_picture3]
    uploader3 = StorepicUploader.new
    uploader3.store!(file3)
    @stores.s_menu_pic3 = uploader3.middle.url
    end
    if params[:s_menu_picture4].nil?
    else
    file4 = params[:s_menu_picture4]
    uploader4 = StorepicUploader.new
    uploader4.store!(file4)
    @stores.s_menu_pic4 = uploader4.middle.url
    end
    if params[:s_menu_picture5].nil?
    else
    file5 = params[:s_menu_picture5]
    uploader5 = StorepicUploader.new
    uploader5.store!(file5)
    @stores.s_menu_pic5 = uploader5.middle.url
    end
    if params[:s_menu_picture6].nil?
    else
    file6 = params[:s_menu_picture6]
    uploader6 = StorepicUploader.new
    uploader6.store!(file6)
    @stores.s_menu_pic6 = uploader6.middle.url
    end
    @stores.save
    redirect_to "/home/spec/#{@stores.id}"
  end
  def spec
    @store_spec = Store.find(params[:id])
    @store_spec.increment('view_count')
    @store_tag = @store_spec.tags
    @store_spec.save
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
  def list_pasta
    @stores = Store.where("s_type = '양식'")
  end
  def list_gimbab
    @stores = Store.where("s_type = '분식'")
  end
  def list_western
    @stores = Store.where("s_type = '멕시칸'")
  end
  def list_japan
    @stores = Store.where("s_type = '일식'")
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
  def list_jung
    @stores = Store.where("s_site = '정문'")
  end
  def list_chul
    @stores = Store.where("s_site = '철문'")
  end
  def list_zzok
    @stores = Store.where("s_site = '쪽문'")
  end
  def list_four
    @stores = Store.where("s_site = '사거리'")
  end
  def list_dae
    @stores = Store.where("s_site = '대명거리'")
  end
  def list_sonamu
    @stores = Store.where("s_site = '소나무길'")
  end
  def list_baedal
    @stores = Store.where("s_deliver_ok == 1")
  end
  def list_rotary
    @stores = Store.where("s_site = '로터리'")
  end
  def list_maro
    @stores = Store.where("s_site = '마로니에'")
  end
  def list_india
    @stores = Store.where("s_type = '인도음식'")
  end
  def list_solo
    @stores = Store.where("theme = '혼밥'")
  end
  def list_date
    @stores = Store.where("theme = '데이트'")
  end
  def list_emotion
    @stores = Store.where("theme = '분위기'")
  end
  def list_homebab
    @stores = Store.where("theme = '집밥'")
  end
  def list_efficient
    @stores = Store.where("theme = '가성비'")
  end
  def list_party
    @stores = Store.where("theme = '파티'")
  end
  def list_world
    @stores = Store.where("theme = '세계'")
  end
  def review_write
    @reviews = Review.new
    @reviews.store_id = params[:store_id]
    @stores = Store.find(params[:store_id])
    @reviews.r_text = params[:review_content]
    file = params[:r_picture]
    uploader = StorepicUploader.new
    uploader.store!(file)
    @reviews.r_pic = uploader.middle.url
    @reviews.save
    redirect_to "/home/spec/#{@stores.id}"
  end
  def reply_delete
    @stores = Review.find(params[:id])
    @stores.destroy
    redirect_to "/home/admin_reply"
  end
end
