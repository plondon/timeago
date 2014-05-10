require 'date'

class TimeAgo

  def self.right_now
    time = Time.new
  	time.strftime("%I:%M:%S %p")
  end

  def maximal_time()

  end

  def language(lang)
    case lang == "german"
      when "just now" then "gerade jetzt"
      when "#{distance} ago" then "vor #{distance}"
      when "#{distance} from now" then "in #{distance}"
      when "seconds" then "sekunden"
      when "minutes" then "minuten"
      when "hours" then "stunden"
      when "yesterday" then "gestern"
    end
  end

  def self.readable(time)

    rightnow = Time.new
    backthen = time

    delta_setting = (rightnow.to_i - backthen.to_i).floor / 60

    distance = distance_of_time_in_words(delta_setting)
    return "#{distance} ago"
    if rightnow.to_i == backthen.to_i
      "just now"
    elsif delta_minutes.abs <= (8724*60)
      distance = distance_of_time_in_words(delta_minutes)
      if distance <= (8724*60)
        return "#{distance} from now"
      elsif distance == "yesterday"
        return "yesterday"
      # elsif
      #   return "#{distance} ago"
      else
        return "on #{DateTime.now.to_formatted_s(date_format)}"
      end
    end
  end

def self.distance_of_time_in_words(minutes)
    case
    when minutes < 0.4
      "a few seconds"
    when minutes < 0.6
      "half a minute"
    when minutes < 1
      "less than a minute"
    when minutes < 2
      "one minute"
    when minutes < 45
      "#{minutes} minutes"
    when minutes < 59
      "less than one hour"
    when minutes < 120
      "one hour"
    when minutes < 1080
      "#{(minutes / 60).round} hours"
    when minutes < 2880
      "yesterday"
    when minutes < 8640
      "#{(minutes / 1440).round} days"
    when minutes < 10080
      "one week"
    when minutes < 40320
      "#{(minutes / 8640).round} weeks"
    when minutes < 43200
      "one month"
    when minutes < 525580
      "#{(minutes / 43200).round} months"
    when minutes < 525600
      "one year"
    when minutes < 2628000
      "#{(minutes / 525600).round} years"
    else
      "#{minutes} minutes"
    end
end
end
