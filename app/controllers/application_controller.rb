require 'action_text'
class ApplicationController < ActionController::Base
	helpers ActionText::Engine.helpers
end
