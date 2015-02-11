require 'pry'
class BookMetadataController < ApplicationController

  def metadata
binding.pry
    @metadata = { :title => "My Title", :author => "John Doe", :pubdata => "2021" }
    respond_to do |format|
      format.json
    end
  end
end