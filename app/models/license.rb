

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

  # def self.find_by_license(license)
  #   license = License.find_by(DAQ: license)
  #   return nil unless license
  #   license
  # end

  # def self.find_by_body(body)
  #   license = License.find_by(body: body)
  #   return nil unless license
  #   license
  # end

  def self.search(search)
    where("DAQ LIKE ? OR body LIKE ?", "#{search}", "#{search}")
  end


  def parse_body
    delimiters = [
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
    columns = ["intro", "DL"].concat(delimiters[0...-1]).map! { |col| col.to_sym }
    modified_body = self.body.clone
    delimiters.each { |replacement| modified_body.gsub!(replacement, "$$") }
    parsed_array = modified_body.split("$$").map { |entry| entry.strip }
    [*0..22].each do |num|
      self[columns[num]] = parsed_array[num]
    end
  end
end
