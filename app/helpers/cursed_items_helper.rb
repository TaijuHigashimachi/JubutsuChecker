module CursedItemsHelper
  def request_to_api(image)
    vision_api_key = ENV['VISION_API_KEY']
    vision_api_url = URI("https://vision.googleapis.com/v1/images:annotate?key=#{vision_api_key}")

    headers = { 'Content-Type' => 'application/json' }
    body = {
      requests: [
        {
          features: [
            {
              maxResults: 10,
              type: 'OBJECT_LOCALIZATION'
            }
          ],
          image: {
            content: image
          }
        }
      ]
    }.to_json

    JSON.parse(Net::HTTP.post(vision_api_url, body, headers).body)['responses'][0]['localizedObjectAnnotations']
  end
end
