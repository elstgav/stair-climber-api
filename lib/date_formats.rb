module DateFormats
  YEAR  = /\d{4}/
  MONTH = /\d{1,2}/
  DAY   = /\d{1,2}/
  ISO_DATETIME = /#{'0000-00-00T00:00:00\.000Z'.gsub('0', '\d')}/
  ISO_DATETIME_RANGE = /#{ISO_DATETIME.source}\.\.#{ISO_DATETIME.source}/
end
