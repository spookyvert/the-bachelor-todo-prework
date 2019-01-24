require 'pry'
def get_first_name_of_season_winner(data, season)
  winner = data[season][0]["name"].split[0]
end

def get_contestant_name(data, occupation)
  name = ""
  data.each do |season, cont_data_all|
    cont_data_all.each do |cont_data_one|
      cont_data_one.each do |info, detail|
        if detail == occupation
          name = cont_data_one["name"]
        end
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  same_hometown = 0
  data.each do |season, cont_data_all|
    cont_data_all.each do |cont_data_one|
      if cont_data_one.value?(hometown)
        same_hometown += 1
      end
    end
  end
  same_hometown
end

def get_occupation(data, hometown)
  occupation = []
  data.each do |season, cont_data_all|
    cont_data_all.each do |cont_data_one|
      if cont_data_one.value?(hometown)
        occupation.push(cont_data_one["occupation"])
      end
    end
  end
  occupation[0]
end

def get_average_age_for_season(data, season)

  age = 0
  count = 0
  data[season].each do |cont_data_one|
    number = cont_data_one["age"].to_f
    age = age + number
    count += 1
  end
  (age / count).round()
end