class Admin::LabelingsController < Admin::BaseController
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

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def labeling_params
    params.require(:labeling).permit(:cursed_item_id, :label_name_id)
  end
end
