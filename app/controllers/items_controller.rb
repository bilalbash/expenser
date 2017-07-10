class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :find_category

  # GET /items
  # GET /items.json
  def index
    if params[:category_id]
      @items = @category.items.includes(:line_items)
    else
      @items = Item.includes(:line_items)
    end

    @items = @items.where('line_items.purchase_month = ?', params[:keyword]) if params[:keyword]

    @items = @items.where('items.name LIKE ? or line_items.category_name LIKE ?', "%#{params[:name]}%", "%#{params[:name]}%") if params[:name]

    User.where(email: current_user.email)[0].update_attributes!(current_month: params[:month]) if current_user if params[:month]

    @items =  @items.left_outer_joins(:line_items).distinct.select('items.*, SUM(line_items.price) AS expense').
        group('items.id')

  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_url(category_id: @item.category_id), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_url(category_id: @item.category_id), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def find_category
      @category = Category.find(params[:category_id]) if params[:category_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :category_id)
    end
end
