json.extract! @activity, :id, :title, :description, :created_at, :updated_at
if @activity.indicator
    json.indicator_id @activity.indicator.id
end