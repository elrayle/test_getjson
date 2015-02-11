require 'httparty'
require 'pry'
# require 'app/controllers/book_metadata_controller'
class FetchMetadata

  include HTTParty
  default_timeout 1 # hard timeout after 1 second


  class << self

    ###  This allows me to get the url and path of BookMetadataController#metadata

    # include Rails.application.routes
    include Rails.application.routes.url_helpers
    def default_url_options
      ActionMailer::Base.default_url_options
    end
  end

  def self.do_fetch( id )

    url  = FetchMetadata.metadata_url(:id => id, :host => "localhost:3000")
    jurl = FetchMetadata.metadata_url(:id => id, :host => "localhost:3000")+".json"
    path = FetchMetadata.metadata_path(:id => id)

    # x = Rails.application.routes.url_helpers.send("metadata/#{ids.first}.json")

binding.pry
puts "pausing"

    ###  Trying to use Dispatch to call BookMetadata#metadata
    ###     - Don't know where env is supposed to come from so tried without including env

    # x = BookMetadataController.action(:metadata).call
    # x = BookMetadataController.action(:metadata).call(env)

# binding.pry
# puts "pausing"


    ###  Trying to use Dispatch with a more direct call to Dispatch

    # url = ActionDispatch::Routing::UriFor.url_for(controller: 'books_controller',
    #               action:     'metadata',
    #               trailing_slash: true ) + "#{id}.json"

binding.pry
puts "pausing"


    ###  Trying HTTParty gem which ultimately uses Net::HTTP

    # response = HTTParty.get(jurl, { :timeout => 2 })    # call when not including HTTParty
    response = self.get(jurl,{ :timeout => 5 })     # call with self when include HTTParty at top of class

binding.pry
puts "pausing"


    ###  Trying Net::HTTP calls
    ###     - times out

    # url = URI.parse(url)
    # req = Net::HTTP::Get.new(url.to_s)
    # req.add_field('Accept','application/json')
    # res = Net::HTTP.start(url.host, url.port) {|http|
    #   http.request(req)
    # }
    # puts res.body


    ###  Trying a single line call to Net::HTTP
    ###     - times out

    # res = Net::HTTP.get(path, { 'Accept' => 'application/json' } )

# binding.pry
# puts "pausing"


    ###  Trying Curl
    ###     - times out

    # http = Curl.get(url) do |curl|
    #   curl.headers['Accept'] = 'application/json'
    #   curl.headers['Content-Type'] = 'application/json'
    #   curl.headers['Api-Version'] = '2.2'
    #   curl.follow_location = true
    #   curl.max_redirects = 1
    #   curl.connect_timeout = 1
    #   curl.useragent = "curb"
    #   curl.on_redirect do |easy|
    #     # puts http.header_str
    #     # easy.headers['Accept'] = 'text/ttl'
    #     # easy.headers['Content-Type'] = 'text/ttl'
    #     # easy.headers['Api-Version'] = '2.2'
    #     puts "set header again for redirect"
    #   end
    # end
    # result = http.body_str

# binding.pry
# puts "pausing"

    ###  Trying call to get
    ###     - get method doesn't exist in controller

    # get "metadata/#{ids.first}", {}, { "Accept" => "application/json" }

# binding.pry
# puts "pausing"

  end
end