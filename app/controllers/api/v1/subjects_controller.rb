module Api
    module V1
        class SubjectsController < ApplicationController
			def index
				@subjects = Subject.all
				render json: @subjects
			end
		end
    end
end