class Admin::CursedItemsController < Admin::BaseController
  before_action :set_cursed_item, only: %i[edit update destroy]

  def index
    @cursed_items = CursedItem.all
  end

  def new
    @cursed_item = CursedItem.new
    @cursed_item.labelings.build
  end

  def create
    @cursed_item = CursedItem.new(cursed_item_params)
    if @cursed_item.save!
      redirect_to new_admin_cursed_item_path, success: '呪物を追加しました'
    else
      flash.now[:danger] = '呪物を追加できませんでした'
      render :new
    end
  end

  def edit; end

  def update
    if @cursed_item.update(cursed_item_params)
      redirect_to edit_admin_cursed_item_path(@cursed_item), success: '編集しました'
    else
      render :edit, danger: '編集できませんでした'
    end
  end

  def destroy
    @cursed_item.destroy!
    redirect_to admin_root_path, success: '削除しました'
  end

  private

  def cursed_item_params
    params.require(:cursed_item).permit(
      :name,
      :youtube_id,
      labelings_attributes:
        %i[id cursed_item_id label_name_id]
    )
  end

  def set_cursed_item
    @cursed_item = CursedItem.find(params[:id])
  end
end
