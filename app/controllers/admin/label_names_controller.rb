class Admin::LabelNamesController < Admin::BaseController
  before_action :set_label_name, only: %i[edit update destroy]

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
      flash.now[:dange] = 'Label Nameを作成できませんでした'
      render :new
    end
  end

  def edit; end

  def update
    if @label_name.update(label_name_params)
      redirect_to edit_admin_label_name_path(@label_name), success: '編集しました'
    else
      render :edit, danger: '編集に失敗しました'
    end
  end

  def destroy
    @label_name.destroy!
    redirect_to admin_label_names_path, success: '削除しました'
  end

  private

  def label_name_params
    params.require(:label_name).permit(:name)
  end

  def set_label_name
    @label_name = LabelName.find(params[:id])
  end
end
