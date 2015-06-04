class DetailsForDashSerializer

  def initialize(company_id, city_id)
    @company_id = company_id
    @city_id = city_id
  end

  def as_json(options = {})
    {
      unassigned_tasks: collection_serializer(unassigned_deliveries, ::DeliverySerializer),
      drivers: collection_serializer(drivers, ::DriverSerializer)
      # study_objectives: collection_serializer(study_objectives, StudyObjectiveSerializer),
      # graduation_years: SubscribersHelper.date_of_graduation_year_list
    }
  end

    private
      def collection_serializer(resources, serializer)
        ActiveModel::ArraySerializer.new(resources, each_serializer: serializer)
      end

      def unassigned_deliveries
        Delivery.where(company_id: @company_id, city_id: @city_id, status: 0)
      end

      def drivers
        Driver.where(company_id: @company_id, city_id: @city_id)
      end

      # def study_objectives
      #   StudyObjective.scoped
      # end
end
