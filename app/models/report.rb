class Report < ApplicationRecord
  has_many :comments # dependentオプションがないよと言われている
end
