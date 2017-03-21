require 'test_helper'

class FileLoadTest < ActiveSupport::TestCase
  test "filename checks:  required, file exists" do
    fl = FileLoad.new
    assert_not(fl.save, "blank filename saved")
    assert(fl.errors[:filename].join(", ").match?(/blank/), "blank-file error did not include 'blank'")

    fl.filename= 'notafile'
    assert_not(fl.save, "notafile saved")
    assert(fl.errors[:filename].join(", ").match?(/not found/), "error did not include 'not found'")

    fl.filename = 'test/fixtures/files/food-vendors.csv'
    assert(fl.valid?, "valid file failed:  #{fl.errors.full_messages}")
  end

  test "loading valid file" do
    expected_results = {
      row_count: 3,
      rows: [
      {village: "Pali", code: "770125A3", name: "Bada Fasal", food_type: "Vegetables"},
      {village: "Ranwar", code: "552121B", name: "Paneer City", food_type: "Cheese"},
      {village: "Chuim", code: "994758C", name: "Jeera Central", food_type: "Spices"}
      ]
    }
    
    fl = FileLoad.new(filename: 'test/fixtures/files/food-vendors.csv')
    assert(fl.save, "save failed:  ")
    assert_equal(expected_results, fl.results, "results differed")
  end
end
