require 'json'
require 'google_drive'
load 'lib/scrapper.rb'


def insert_spreadsheet
  session = GoogleDrive::Session.from_config("config.json")
  ws = session.spreadsheet_by_key("1pxBEisH5DMyI_YxkFFQnS2xT6lVYnPjF1uopGIh_0YE").worksheets[0]
  row = 1
  mailing_list = get_the_email_of_a_townhal_from_its_webpage(get_all_the_urls_of_val_doise_townhalls)
  # avec boucle each: 
  # mailing_list.each do |x|
  #  cln =1
  #  ws[row, cln] = x[:name]
  #  cln += 1
  #  ws[row, cln] = x[:email]
  #  row += 1
  for i in (1..mailing_list.length-1)
  ws[i, 1] = mailing_list[i][:name]
  ws[i, 2] = mailing_list[i][:email]
  end
    ws.save
    ws.reload
end

def perform
insert_spreadsheet
end

perform

=begin
  

  p ws[2, 1]
  ws[3, 1] = "tes"
  ws[3, 2] = "2"
  ws.save
  ws.reload

=end
