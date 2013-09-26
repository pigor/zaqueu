require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(1.minutes, 'Sending collections') { Collection.by_deadline(Time.zone.now).each{|collection| collection.notify} }
