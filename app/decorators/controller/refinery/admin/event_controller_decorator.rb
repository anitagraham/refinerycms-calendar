Refinery::Calendar::Admin::EventsController.prepend(
  Module.new do
    def permitted_event_params
      super << [images_attributes: [:id, :caption, :image_page_id]]
    end
  end
)
