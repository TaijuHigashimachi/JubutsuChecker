class CursedItemsController < ApplicationController
  include Pagy::Backend
  include CursedItemsHelper

  def top; end

  def index
    @pagy, @cursed_items = pagy(CursedItem.all, items: 2)
  end

  def result
    return if params[:upload_image].nil?

    @encoded_image = Base64.strict_encode64(params[:upload_image].read)

    # アップロード画像をVisionAPIに送り、Hashに変換したレスポンスを取得
    vision_api_responses = request_to_api(@encoded_image)

    # 検出データから、ラベルの名前を抽出して配列化
    object_name_array = vision_api_responses.map { |annotation| annotation['name'] }.uniq

    # 検出データの中で、データベースに登録されているLabelNameのデータだけ抽出
    label_names = LabelName.where(name: object_name_array)

    # label_namesに紐付いているcursed_itemデータを取得
    labelings = Labeling.where(label_name_id: label_names.ids)
    cursed_item_ids = labelings.map(&:cursed_item_id)
    @cursed_items = CursedItem.where(id: cursed_item_ids)

    # Twitterシェア用に、検出された呪物名を配列化
    @cursed_item_array = @cursed_items.map(&:name)

    # データーベースに登録されているLabelNameのAnnotationsデータだけ、検出データから抽出
    label_name_array = object_name_array.select { |object_name| LabelName.find_by(name: object_name) }
    @cursed_item_annotations = vision_api_responses.select { |array| label_name_array.include?(array['name']) }
  end
end
