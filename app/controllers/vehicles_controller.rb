require "selenium-webdriver"

class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show edit update destroy ]

  # GET /vehicles or /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
    driver = Selenium::WebDriver.for :chrome
    driver.manage.timeouts.implicit_wait = 10 # Set implicit wait time

        # Navigate to Instagram login page
    driver.navigate.to "https://www.instagram.com/accounts/login/"

    # Wait for the page to load
    wait = Selenium::WebDriver::Wait.new(timeout: 20)
    wait.until { driver.find_element(css: "input[name='username']") }

    # Fill in login credentials and submit
    username_input = driver.find_element(css: "input[name='username']")
    password_input = driver.find_element(css: "input[name='password']")
    login_button = driver.find_element(css: "button[type='submit']")

    username_input.send_keys "iabdulhannan6411"
    password_input.send_keys "HaNNan5555@4"
    login_button.click

    wait.until { driver.find_element(css: "._ac8f") }
    driver.find_element(css: "._ac8f").click

    wait.until { driver.find_element(css: "._a9--._ap36._a9_1") }
    driver.find_element(css: "._a9--._ap36._a9_1").click


    driver.navigate.to "https://www.instagram.com/explore/tags/gucci/"

    wait.until { driver.find_element(:css, "article._aao7") }

    article = driver.find_element(:css, "article._aao7")
    wait.until { article.find_element(tag_name: 'a') }

    top_posts = article.find_elements(tag_name: 'a')

    wait.until { article.find_elements(tag_name: 'img') }

    top_post_images = article.find_elements(tag_name: 'img')

    images = []
    top_post_images.each do |img|
      puts "hello for images"
      images.push(img.attribute("src"))
    end

    link_of_array = []
    all_comments_data = [];
    top_posts.each do |post|
      link_of_array.push(post.attribute("href")+"liked_by/")
      post.click
      wait.until { driver.find_element(css: '._a9z6._a9za') }
      puts 'brand_info'
      brand_profile_link = driver.find_element(css: '._a9z6._a9za').find_element(tag_name: 'a').attribute("href")
      brand_profile_name = driver.find_element(css: '._a9z6._a9za').find_element(tag_name: 'a').text

      puts '-----------comments-----------'

      # sleep(0.5) # half a second0

      begin
        wait.until { driver.find_element(css: '.x9f619.xjbqb8w.x78zum5.x168nmei.x13lgxp2.x5pf9jr.xo71vjh.xdj266r.xat24cr.x1n2onr6.x1plvlek.xryxfnj.x1c4vz4f.x2lah0s.xdt5ytf.xqjyukv.x1qjc9v5.x1oa3qoh.xl56j7k') }

        while driver.find_element(css: '.x9f619.xjbqb8w.x78zum5.x168nmei.x13lgxp2.x5pf9jr.xo71vjh.xdj266r.xat24cr.x1n2onr6.x1plvlek.xryxfnj.x1c4vz4f.x2lah0s.xdt5ytf.xqjyukv.x1qjc9v5.x1oa3qoh.xl56j7k').displayed?
          driver.find_element(css: '.x9f619.xjbqb8w.x78zum5.x168nmei.x13lgxp2.x5pf9jr.xo71vjh.xdj266r.xat24cr.x1n2onr6.x1plvlek.xryxfnj.x1c4vz4f.x2lah0s.xdt5ytf.xqjyukv.x1qjc9v5.x1oa3qoh.xl56j7k').click
        end
      rescue Selenium::WebDriver::Error::TimeoutError, Selenium::WebDriver::Error::NoSuchElementError, Selenium::WebDriver::Error::StaleElementReferenceError
        # Handle timeout exception
        puts "exception"
      end

      comments_array = []
      begin
        wait.until { driver.find_element(css: '.x9f619.xjbqb8w.x78zum5.x168nmei.x13lgxp2.x5pf9jr.xo71vjh.x1yztbdb.x1uhb9sk.x1plvlek.xryxfnj.x1c4vz4f.x2lah0s.xdt5ytf.xqjyukv.x1qjc9v5.x1oa3qoh.x1nhvcw1') }
      
        if driver.find_element(css: '.x9f619.xjbqb8w.x78zum5.x168nmei.x13lgxp2.x5pf9jr.xo71vjh.x1yztbdb.x1uhb9sk.x1plvlek.xryxfnj.x1c4vz4f.x2lah0s.xdt5ytf.xqjyukv.x1qjc9v5.x1oa3qoh.x1nhvcw1').displayed?
          wait.until { driver.find_element(css: '.x9f619.xjbqb8w.x78zum5.x168nmei.x13lgxp2.x5pf9jr.xo71vjh.x1yztbdb.x1uhb9sk.x1plvlek.xryxfnj.x1c4vz4f.x2lah0s.xdt5ytf.xqjyukv.x1qjc9v5.x1oa3qoh.x1nhvcw1').find_element(tag_name: 'a') }
          
          wait.until { driver.find_elements(css: '.x9f619.xjbqb8w.x78zum5.x168nmei.x13lgxp2.x5pf9jr.xo71vjh.x1yztbdb.x1uhb9sk.x1plvlek.xryxfnj.x1c4vz4f.x2lah0s.xdt5ytf.xqjyukv.x1qjc9v5.x1oa3qoh.x1nhvcw1') }
          comments = driver.find_elements(css: '.x9f619.xjbqb8w.x78zum5.x168nmei.x13lgxp2.x5pf9jr.xo71vjh.x1yztbdb.x1uhb9sk.x1plvlek.xryxfnj.x1c4vz4f.x2lah0s.xdt5ytf.xqjyukv.x1qjc9v5.x1oa3qoh.x1nhvcw1')
          comments.each do |comment|
            wait.until { comment.find_element(tag_name: 'a') }
            user_profile_link = comment.find_element(tag_name: 'a').attribute("href")
            user_name = comment.find_element(tag_name: 'a').text
            user_comment = comment.find_element(css: '._ap3a._aaco._aacu._aacx._aad7._aade').text
            comments_array.push( ['commenter_profile_link' => user_profile_link, 'commenter_name' => user_name, 'comment' => user_comment] )
            # wait.until { comment.find_elements(tag_name: 'a') }
            # comment.find_elements(tag_name: 'a').each do |profile|
            #   puts profile.attribute("href")
            # end
          end
        end
      rescue Selenium::WebDriver::Error::TimeoutError, Selenium::WebDriver::Error::NoSuchElementError, Selenium::WebDriver::Error::StaleElementReferenceError
        # Handle timeout exception
        puts "exception"
      end

      all_comments_data.push([ post.attribute("href") => ['brand_profile_link' => brand_profile_link, 'brand_name' => brand_profile_name, 'comments_text' => comments_array]])

      driver.find_element(css: '.x160vmok.x10l6tqk.x1eu8d0j.x1vjfegm').click
    end

    all_likes_array = []
    # puts "--------------liked_by profile-------------"
    # link_of_array.each do |post|
    #   puts "new post----------"+post+"----------------"
    #   driver.navigate.to ""+post
    #   wait.until { driver.find_element(css: '.x1rg5ohu').find_element(tag_name: 'a').attribute("href") }

    #   puts driver.find_element(css: '.x1rg5ohu').find_element(tag_name: 'a').attribute("href")

    #   wait.until { driver.find_elements(css: '.x1rg5ohu') }
    #   all_likes = driver.find_elements(css: '.x1rg5ohu')
    #   all_likers_profiles = [];
    #   all_likes.each do |like|
    #     # wait.until { like.find_elements(tag_name: 'a') }
    #     # wait.until { like.find_elements(tag_name: 'a') }

    #     like.find_elements(tag_name: 'a').each do |something|

    #       puts something.attribute("href")
    #       all_likers_profiles.push(something.attribute("href"))
    #     end
    #   end

    #   all_likes_array.push (['post_link' => post, 'likers_profiles' => all_likers_profiles])

    #   driver.navigate.to "https://www.instagram.com/explore/tags/gucci/"

    #   wait.until { driver.find_element(:css, "article._aao7") }
    # end

    respond_to do |format|
      format.html
      format.csv do
        filename = ['Insta Scrape', Date.today.to_s].join(' ')
        send_data [{'comments' => all_comments_data, 'likes' => all_likes_array}], filename:, content_type: 'text/csv'
      end
    end
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully created." }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully updated." }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: "Vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def scrape
    # respond_to do |format|
    #   format.html
    #   format.csv do
    #     filename = ['Posts', Date.today.to_s].join(' ')
    #     send_data ['aaaaaaaaaa','sssssss','11111111111'], filename:, content_type: 'text/csv'
    #   end
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      # @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:title, :stock_type, :exterior_color, :interior_color, :transmission, :drivetrain, :price, :miles)
    end
end
