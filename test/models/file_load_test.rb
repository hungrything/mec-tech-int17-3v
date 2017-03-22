require 'test_helper'

class FileLoadTest < ActiveSupport::TestCase
  test "filename checks:  required, file exists" do
    fl = FileLoad.new
    assert_not(fl.save, "blank filename saved")
    assert(fl.errors[:filename].join(", ").match(/blank/), "blank-file error did not include 'blank'")

    fl.filename= 'notafile'
    assert_not(fl.save, "notafile saved")
    assert(fl.errors[:filename].join(", ").match(/not found/), "error did not include 'not found'")

    fl.filename = 'test/fixtures/files/food-vendors.csv'
    assert(fl.valid?, "valid file failed:  #{fl.errors.full_messages}")
  end

  test "loading food vendor valid file" do
    expected_results = {
      row_count: 3,
      rows: [
      {village: "Pali", code: "770125A3", name: "Bada Fasal", service_type: "Vegetables"},
      {village: "Ranwar", code: "552121B", name: "Paneer City", service_type: "Cheese"},
      {village: "Chuim", code: "994758C", name: "Jeera Central", service_type: "Spices"}
      ]
    }
    
    fl = FoodVendorFileLoad.new(filename: 'test/fixtures/files/food-vendors.csv')
    assert(fl.save, "save failed:  ")
    assert_equal(expected_results, fl.results, "results differed")
  end

  test "loading service vendor valid file" do
    expected_results = {
      row_count: 4,
      rows: [
      {village: "Pali", code: "77-2435", name: "Bandra Server Farm", service_type: "TECH HOSTING"},
      {village: "Ranwar", code: "66-1324", name: "Network Experts", service_type: "TECH ADMIN"},
      {village: "Pali", code: "88-5768", name: "Party Central", service_type: "EVENT HOSTING"},
      {village: "Chuim", code: "99-8079", name: "Bombay Clouds", service_type: "TECH HOSTING"}
      ]
    }
    
    fl = ServiceVendorFileLoad.new(filename: 'test/fixtures/files/service-vendors.csv')
    assert(fl.save, "save failed:  ")
    assert_equal(expected_results, fl.results, "results differed")
  end
end
