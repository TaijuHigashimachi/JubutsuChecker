class CursedItemsController < ApplicationController
  include Pagy::Backend
  require "google/cloud/vision"
  require 'net/https'

  def top; end

  def index
    @pagy, @cursed_items = pagy(CursedItem.all, items: 2)
  end

  def result
    if params[:upload_image]
      @encoded_image = Base64.strict_encode64(params[:upload_image].read)

      vision_api_url = URI("https://vision.googleapis.com/v1/images:annotate?key=AIzaSyBzFRr3ebRmhyDwmg2lmMi8rAKXig94Hfo")
      headers = { "Content-Type" => "application/json" }
      body = {
        requests: [
          {
            features: [
              {
                maxResults: 10,
                type: "OBJECT_LOCALIZATION"
              }
            ],
            image: {
              content: @encoded_image
            }
          }
        ]
      }.to_json

      # Vision APIにリクエストを飛ばし、レスポンスをHashに変換
      vision_api_responses = JSON.parse(Net::HTTP.post(vision_api_url, body, headers).body)

      # 検出データから、ラベルの名前を抽出して配列化
      object_name_array = vision_api_responses["responses"][0]["localizedObjectAnnotations"].map { |annotation| annotation["name"]}.uniq

      # 検出データの中で、データベースに登録されているLabelNameのデータだけ抽出
      @label_names = LabelName.where(name: object_name_array)
    end
  end
end
