class PageVisitorsController < ApplicationController
  before_action :set_page_visitor, only: [:show, :edit, :update, :destroy]

  # GET /page_visitors
  # GET /page_visitors.json
  def index
    # @page_visitors = PageVisitor.all.reverse.page params[:page]
    @page_visitors = PageVisitor.order(created_at: :desc).page params[:page]
  end

  # GET /page_visitors/1
  # GET /page_visitors/1.json
  def show
  end

  # GET /page_visitors/new
  def new
    @page_visitor = PageVisitor.new
  end

  # GET /page_visitors/1/edit
  def edit
  end

  # POST /page_visitors
  # POST /page_visitors.json
  def create
    @page_visitor = PageVisitor.new(page_visitor_params)

    respond_to do |format|
      if @page_visitor.save
        format.html { redirect_to @page_visitor, notice: 'Page visitor was successfully created.' }
        format.json { render :show, status: :created, location: @page_visitor }
      else
        format.html { render :new }
        format.json { render json: @page_visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_visitors/1
  # PATCH/PUT /page_visitors/1.json
  def update
    respond_to do |format|
      if @page_visitor.update(page_visitor_params)
        format.html { redirect_to @page_visitor, notice: 'Page visitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_visitor }
      else
        format.html { render :edit }
        format.json { render json: @page_visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_visitors/1
  # DELETE /page_visitors/1.json
  def destroy
    @page_visitor.destroy
    respond_to do |format|
      format.html { redirect_to page_visitors_url, notice: 'Page visitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_visitor
      @page_visitor = PageVisitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_visitor_params
      params.require(:page_visitor).permit(:RemoteIP, :Page, :Referer, :UserAgent, :page)
    end
end
