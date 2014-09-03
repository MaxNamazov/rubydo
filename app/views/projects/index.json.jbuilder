json.array!(@projects) do |project|
  json.extract! project, :id, :name
  json.tasks project.tasks do |task|
    json.extract! task, :id, :name, :position, :completed
  end
  json.url project_url(project, format: :json)
end
