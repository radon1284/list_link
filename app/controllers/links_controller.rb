class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_link, only: [:show, :edit, :update, :destroy, :vote]

  # GET /links
  # GET /links.json
  def index
    if params[:category].blank?
      @links = Link.all.order("created_at DESC")
    else
      @category_id = Category.find_by(category_name: params[:category]).id
      @links = Link.where(category_id: @category_id).order("created_at DESC")
    end
  end


# if params[:category].blank?
#       @jobs = Job.all.order("created_at DESC")
#     else
#       @category_id = Category.find_by(name: params[:category]).id
#       @jobs = Job.where(category_id: @category_id).order("created_at DESC")
#     end
  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    @link.user = current_user

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    if @link.user == current_user
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
    else
      respond_to do |format|
        format.html { redirect_to @link, notice: 'Link cannot be updated. You must be the creator of this link to updated it!' }
        format.json { render :edit}
      end
    end

  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    if @link.user == current_user
      @link.destroy
      respond_to do |format|
        format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @link, notice: 'Link cannot be deleted. You must be the creator of this link to delete it!' }
        format.json { render :show, status: :ok, location: @link }
      end
    end
  end


  #->Prelang (voting/acts_as_votable)
  # def vote

  #   direction = params[:direction]

  #   # Make sure we've specified a direction
  #   raise "No direction parameter specified to #vote action." unless direction

  #   # Make sure the direction is valid
  #   unless ["like", "bad"].member? direction
  #     raise "Direction '#{direction}' is not a valid direction for vote method."
  #   end

  #   @link.vote_by voter: current_user, vote: direction

  #   redirect_to action: :index
  # end

  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_to links_path
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote_by current_user
    redirect_to links_path
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:link_name, :description, :url, :user_id, :category_id)
    end
end
