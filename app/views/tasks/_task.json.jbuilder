json.extract! task, :id, :chore, :name, :time, :description, :created_at, :updated_at
json.url task_url(task, format: :json)
