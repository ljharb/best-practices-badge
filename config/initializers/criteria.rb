# frozen_string_literal: true

require 'yaml'
# Load in entire criteria.yml, which keys off the major/minor groups
FullCriteriaHash =
  YAML.load_file('criteria/criteria.yml').with_indifferent_access.freeze
criteria_hash = {}.with_indifferent_access
FullCriteriaHash.each do |level, level_value|
  criteria_hash[level] = {}.with_indifferent_access
  level_value.each do |major, major_value|
    major_value.each do |minor, criteria|
      criteria.each do |criterion_key, criterion_data|
        criteria_hash[level][criterion_key] = criterion_data
        criteria_hash[level][criterion_key][:major] = major
        criteria_hash[level][criterion_key][:minor] = minor
      end
    end
  end
end

Criteria = CriteriaHash.new(criteria_hash.freeze)
puts Criteria.to_h['0']['description_good']
