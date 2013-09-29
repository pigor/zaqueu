module CollectionsHelper
  def deadline_color(collection)
    if collection.deadline < Time.zone.now
      "deadline-red"
    else
      "deadline-green"
    end
  end
end
