class ApplicationController < ActionController::Base

	def hello_sample
		render plain: "hello sample app!"
	end

end
