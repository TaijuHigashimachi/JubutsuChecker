class Admin::LabelingsController < Admin::BaseController
  before_action :set_labeling, only: %i[edit update destroy]

  def index
    @labelings = Labeling.all
  end

  def new
    @labeling = Labeling.new
  end

  def create
    @labeling = Labeling.new(labeling_params)
    if @labeling.save
      redirect_to new_admin_labeling_path, success: 'Labelingを作成しました'
    else
      flash.now[:danger] = 'Labelingを作成できませんでした'
      render :new
    end
  end

  def edit; end

  def update
    if @labeling.update(labeling_params)
      redirect_to edit_admin_labeling_path(@labeling), success: '編集しました'
    else
      render :edit, danger: '編集に失敗しました'
    end
  end

  def destroy
    @labeling.destroy!
    redirect_to admin_labelings_path, success: '削除しました'
  end

  private

  def labeling_params
    params.require(:labeling).permit(:cursed_item_id, :label_name_id)
  end

  def set_labeling
    @labeling = Labeling.find(params[:id])
  end
end
