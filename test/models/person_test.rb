require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  test "should not save person without a first name" do
    person = Person.new
    assert_not person.save, "saved the person without a first name"
  end

  test "should not save person without assigned group" do

  # test "the truth" do
  #   assert true
  # end
end
