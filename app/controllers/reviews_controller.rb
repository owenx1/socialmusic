class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all.order(cached_votes_score: :desc)
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @post = Post.find(params[:post_id])
    @user = current_user
    #@user = current_user
    #@review = @post.reviews.new(parent_id: params[:parent_id]) **
    #@review = @post.reviews.new(parent_id: params[:parent_id])
    @review = @user.reviews.new(:post_id => @post.id, parent_id: params[:parent_id])
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    #@review = @post.reviews.new(review_params)
    @review = @user.reviews.new(review_params.merge(post_id: @post.id))
    #@review = @user.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @post, notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    @review = Review.find(params[:id])
    if current_user.voted_up_on? @review
      @review.downvote_by current_user
    elsif current_user.voted_down_on? @review
      @review.upvote_by current_user
    else #not voted
      @review.upvote_by current_user
    end
    respond_to do |format|
     format.js
    end 
  end

  def upvote
    @review = Review.find(params[:id])
    if current_user.voted_up_on? @review
      @review.unvote_by current_user
    else
      @review.upvote_by current_user
    end
    render "vote.js.erb"
  end

  def downvote
    @review = Review.find(params[:id])
    if current_user.voted_down_on? @review
      @review.unvote_by current_user
    else
      @review.downvote_by current_user
    end
    render "vote.js.erb"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:body, :parent_id, :user_id)
    end
end
