class Admin::CursedItemsController < Admin::BaseController
  def index
    @cursed_items = CursedItem.all
  end

  def new
    @cursed_item = CursedItem.new
    3.times { @cursed_item.cursed_item_objective_names.build }
  end

  def create
    @cursed_item = CursedItem.new(cursed_item_params)
    if @cursed_item.save
      redirect_to new_admin_cursed_item_path, success: '呪物を追加しました'
    else
      flash.now[:danger] = '呪物を追加できませんでした'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cursed_item_params
    params.require(:cursed_item).permit(:name, :youtube_id, cursed_item_objective_names_attributes: %i[id cursed_item_id object_name_id])
  end
end
