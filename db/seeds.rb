
# OpenMapApi/Geocoded to generate coordiantes

# geocode_url = "https://api.opentripmap.com/0.1/en/places/geoname?name=#{city}&apikey=#{opentripmap_api_key}"
# serialized_data = URI.parse(geocode_url).open.read
# result = JSON.parse(serialized_data)

# latitude = result["lat"]
# longitude = result["lon"]

# OpenMapApi/Raduius to IDs for each activity
# Retrieve ID
# OpenMapApi/Object Properties

# Activity.new = (location:, type:, name: , details: , rating: , image_url: , website_url: , daytime:)

# budapest paris berlin prague rome
# cathedrals markets secret+bars cheap+eats bars pubs cafes

require "open-uri"
require "json"

google_api_key = ENV['GOOGLE_API']

cities =
  %w[

    london budapest paris
  ]

categories =
  %w[
    museums parks sights restaurants walking+tours bars cafes cheap+eats
  ]

puts "Clearing databsae..."
Trip.destroy_all
Activity.destroy_all
Category.destroy_all

puts "Populating activity_types..."

categories.each do |category|
  formatted_category = category.gsub(/\+/, " ").titleize
  category = Category.new(name: formatted_category)
  category.save!
end

puts "Populating activties..."

cities.each do |city|
  puts "Next city..."
  categories.each do |category|
    puts "Next category...."
    text_search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{city}+best+#{category}&language=en&key=#{google_api_key}"
    serialized_data = URI.parse(text_search_url).open.read
    results = JSON.parse(serialized_data)

    all_results = results["results"]
    first_twelve_results = all_results[0..11]

    first_twelve_results.each do |result|
      puts "Next activity..."
      place_id = result["place_id"]
      location_url = "https://maps.googleapis.com/maps/api/place/details/json?fields=name%2Cformatted_address%2Cinternational_phone_number%2Cgeometry%2Copening_hours%2Cphotos%2Crating%2Cwebsite%2Ceditorial_summary&place_id=#{place_id}&key=#{google_api_key}"
      serialized_data = URI.parse(location_url).open.read
      results = JSON.parse(serialized_data)["result"]

      name = results["name"]
      address = results.fetch("formatted_address", "No address available, please check their website")
      details = results.dig("editorial_summary", "overview") || "No details available, please visit their website"
      opening_hours = results.dig("opening_hours", "weekday_text") || "Opening hours unavailable, please visit their website"
      rating = results.fetch("rating", 0)
      website = results.fetch("website", "Website unavailable")
      phone_number = results.fetch("international_phone_number", "Phone number unavailable")

      activity = Activity.new(
        location: city.capitalize,
        activity_type: category.capitalize,
        name: name,
        details: details,
        rating: rating,
        website_url: website,
        address: address,
        phone_number: phone_number,
        opening_hours: opening_hours
      )

      if category == ("secret+bars" || "restaurants" || "bars" || "pubs")
        activity.daytime = false
      else
        activity.daytime = true
      end

      # photos = results["photos"]

      # unless photos && photos.empty?

      #   if photos.count < 5
      #     length = photos.count
      #     first_five = photos[0...length]
      #   else
      #     first_five = photos[0..4]
      #   end
      #   photo_id = 0

      #   puts "Adding photos..."

      #   first_five.each do |photo|
      #     photo_reference = photo["photo_reference"]
      #     photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=800&photo_reference=#{photo_reference}&key=#{google_api_key}"
      #     begin file = URI.open(photo_url)
      #       activity.photos.attach(io: file, filename: "#{results[name]}#{photo_id += 1}", content_type: "image/jpg")
      #     rescue OpenURI::HTTPError
      #     end
      #     puts "attached? #{activity.photos.attached?}"
      #   end
      # end
      activity.save!
    end
  end
end

puts "Finished!"
