json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :in, :to, :weekday
  json.url schedule_url(schedule, format: :json)
end
