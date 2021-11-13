class Admin::LabelNamesController < Admin::BaseController
  def index
    @label_names = LabelName.all
  end

  def new
    @label_name = LabelName.new
  end

  def create
    @label_name = LabelName.new(label_name_params)
    if @label_name.save
      redirect_to new_admin_label_name_path, success: 'Label Nameを作成しました'
    else
      flash.new[:dange] = 'Label Nameを作成できませんでした'
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

  def label_name_params
    params.require(:label_name).permit(:name)
  end
end
