module DateRange
  extend ActiveSupport::Concern

  private

  def date_range
    @date_range ||= begin
      date_range = params[:date_range]

      if date_range.present?
        from, till = date_range.split('..').map(&:to_datetime)
        (from..till)
      else
        date_range_from_params
      end
    end
  end

  def date_range_from_params
    year  = params[:year]
    week  = params[:week]
    month = params[:month]
    day   = params[:day]

    case
    when day.present?
      date = Date.new(year.to_i, month.to_i, day.to_i)
      (date.beginning_of_day..date.end_of_day)

    when month.present?
      date = Date.new(year.to_i, month.to_i)
      (date.beginning_of_month..date.end_of_month)

    when week.present?
      date = Date.commercial(year.to_i, week.to_i)
      (date.beginning_of_week..date.end_of_week)

    when year.present?
      date = Date.new(year.to_i)
      (date.beginning_of_year..date.end_of_year)
    end
  end
end
