module CompaniesHelper
  def companies_for_select
    companies = []
    Company.find_each do |company|
      companies << [company.name, company.id]
    end
    companies
  end
end
