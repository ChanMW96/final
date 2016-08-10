class HomeController < ApplicationController
  def index
  	@projects = Project.all.limit(4)
  end
end
