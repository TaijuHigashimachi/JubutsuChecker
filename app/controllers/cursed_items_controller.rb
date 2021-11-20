class CursedItemsController < ApplicationController
  include CursedItemsHelper
  include Pagy::Backend

  def top; end

  def index
    @pagy, @cursed_items = pagy(CursedItem.all.order(id: :asc), items: 2)
  end

  def result
    return if params[:upload_image].nil?

    @encoded_image = Base64.strict_encode64(params[:upload_image].read)

    # アップロード画像をVisionAPIに送り、Hashに変換したレスポンスを取得
    vision_api_responses = request_to_api(@encoded_image)

    # レスポンスデータから、検出された物体名（ラベル）を抽出して配列化
    object_name_array = vision_api_responses.map { |a| a['name'] }.uniq

    # データベースに登録されているラベルだけ抽出
    label_names = LabelName.where(name: object_name_array)

    # label_namesに紐付いているcursed_itemsデータを取得
    labelings = Labeling.where(label_name_id: label_names.ids)
    cursed_item_ids = labelings.map(&:cursed_item_id)
    @cursed_items = CursedItem.where(id: cursed_item_ids)

    # 検出された呪物名を配列化（Twitterシェア用）
    @cursed_item_array = @cursed_items.map(&:name)

    # データーベースに登録されているラベルの座標データを抽出（canvas用）
    label_name_array = object_name_array.select { |a| LabelName.find_by(name: a) }
    @cursed_item_annotations = vision_api_responses.select { |a| label_name_array.include?(a['name']) }
  end
end
