module CollectionsHelper
  def deadline_color(collection)
    if collection.deadline < Time.zone.now
      "deadline-red"
    else
      "deadline-green"
    end
  end

  def repetition_label(repetition)
    repetition_options.invert[repetition.to_sym]
  end

  def repetition_options
    {
      "Nunca" => nil,
      "Todo dia" => :every_day,
      "Toda semana" => :every_week,
      "Todo mês" => :every_month,
      "Todo ano" => :every_year
    }
  end
end
