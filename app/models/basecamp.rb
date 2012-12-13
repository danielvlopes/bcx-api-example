require 'uri'
require 'net/https'
require 'json'

class Basecamp

  class Launchpad

    attr_accessor :http, :headers, :uri

    def self.authorization(token)
      @uri = URI("https://launchpad.37signals.com")
      @http = Net::HTTP.new(@uri.host, @uri.port)
      @http.use_ssl = true
      @headers = { 'Authorization' => "Bearer #{token}" }
      JSON.parse(@http.get("/authorization.json", @headers).body)      
    end
  end

  def initialize(base_url, token)
    @base_url, @token = base_url, token    
    uri = URI(@base_url)
    @http = Net::HTTP.new(uri.host, uri.port)
    @http.use_ssl = true
    @headers = { 'Authorization' => "Bearer #{token}" }
  end

  def projects
    JSON.parse(@http.get("/projects.json", @headers).body)      
  end

end