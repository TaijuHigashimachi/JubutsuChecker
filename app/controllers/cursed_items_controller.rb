class CursedItemsController < ApplicationController
  include Pagy::Backend
  include CursedItemsHelper

  def top; end

  def index
    @pagy, @cursed_items = pagy(CursedItem.all, items: 2)
  end

  def result
    if params[:upload_image]
      @encoded_image = Base64.strict_encode64(params[:upload_image].read)

      # アップロード画像をVisionAPIに送り、Hashに変換したレスポンスを取得
      vision_api_responses = request_to_api(@encoded_image)

      # 検出データから、ラベルの名前を抽出して配列化
      object_name_array = vision_api_responses.map { |annotation| annotation["name"] }.uniq

      # 検出データの中で、データベースに登録されているLabelNameのデータだけ抽出
      @label_names = LabelName.where(name: object_name_array)
      
      # データーベースに登録されているLabelNameのAnnotationsデータだけ、検出データから抽出
      label_name_array = object_name_array.select { |object_name| LabelName.find_by(name: object_name) }
      @cursed_item_annotations = vision_api_responses.select do |array|
                                   label_name_array.include?(array["name"])
                                 end
    end
  end
end
