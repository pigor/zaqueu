namespace :collections do
  desc "send all collections overdue"
  task send_all: :environment do
    Collection.by_deadline(Time.zone.now).each{ |collection| collection.notify }
  end

end
