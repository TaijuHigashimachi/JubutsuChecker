class Admin::ObjectNamesController < Admin::BaseController
  def index
    @object_names = ObjectName.all
  end

  def new
    @object_name = ObjectName.new
  end

  def create
    @object_name = ObjectName.new(object_name_params)
    if @object_name.save
      redirect_to new_admin_object_name_path, success: 'Object Nameを作成しました'
    else
      flash.new[:dange] = 'Object Nameを作成できませんでした'
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

  def object_name_params
    params.require(:object_name).permit(:name)
  end
end
