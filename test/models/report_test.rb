# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report1 = reports(:report_one)
  end

  test 'editable?' do
    alice = users(:alice)
    bob = users(:bob)
    assert @report1.editable?(alice)
    assert_not @report1.editable?(bob)
  end

  test 'created_on' do
    assert_equal @report1.created_on, @report1.created_at.to_date
  end
end
