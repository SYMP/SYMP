class HomeController < ApplicationController
 	skip_before_filter :authenticate, :only => [:new, :create, :index]
end
