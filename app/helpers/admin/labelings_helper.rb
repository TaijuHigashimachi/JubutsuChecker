module Admin::LabelingsHelper
  def cursed_item_name(id)
    CursedItem.find(id).name
  end

  def label_name(id)
    LabelName.find(id).name
  end
end
