

# == Schema Information
#
# Table name: licenses
#
#  id         :integer          not null, primary key
#  body       :string           not null
#  intro      :string
#  DL         :string
#  DLD        :string
#  DBA        :string
#  DCS        :string
#  DCT        :string
#  DBD        :string
#  DBB        :string
#  DBC        :string
#  DAY        :string
#  DAU        :string
#  DAG        :string
#  DAI        :string
#  DAJ        :string
#  DAK        :string
#  DAQ        :string
#  DCF        :string
#  DCG        :string
#  DCH        :string
#  DAZ        :string
#  DCU        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class License < ActiveRecord::Base
  validates :body, presence: true
  validates :body, uniqueness: true

  after_initialize :parse_body

  DELIMITERS = [
    "DLD",
    "DCB",
    "DCD",
    "DBA",
    "DCS",
    "DCT",
    "DBD",
    "DBB",
    "DBC",
    "DAY",
    "DAU",
    "DAG",
    "DAI",
    "DAJ",
    "DAK",
    "DAQ",
    "DCF",
    "DCG",
    "DCH",
    "DAZ",
    "DCU",
    "DL"]

  DISPLAY = ["Start",
    "DL",
    "DLD",
    "Class",
    "Endorsements",
    "Expiration",
    "Surname",
    "First Name",
    "Issue Date",
    "Date of Birth",
    "Sex",
    "Eye Color",
    "Height",
    "Street",
    "City",
    "State",
    "Zip Code",
    "License Number",
    "Document Discriminator",
    "Country",
    "DCH",
    "Hair Color",
    "Name Suffix"]

  COLUMNS = [:intro,
    :DL,
    :DLD,
    :DCB,
    :DCD,
    :DBA,
    :DCS,
    :DCT,
    :DBD,
    :DBB,
    :DBC,
    :DAY,
    :DAU,
    :DAG,
    :DAI,
    :DAJ,
    :DAK,
    :DAQ,
    :DCF,
    :DCG,
    :DCH,
    :DAZ,
    :DCU]



  def self.search(search)
    where("DAQ LIKE ? OR body LIKE ?", "#{search}", "#{search}")
  end


  def parse_body
    modified_body = self.body.clone
    DELIMITERS.each { |replacement| modified_body.gsub!(replacement, "$$") }
    parsed_array = modified_body.split("$$").map { |entry| entry.strip }
    [*0..22].each do |num|
      self[COLUMNS[num]] = parsed_array[num]
    end
  end
end
