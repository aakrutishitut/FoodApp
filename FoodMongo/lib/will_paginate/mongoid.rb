def total_pages
  (total_entries / per_page.to_f).ceil
end