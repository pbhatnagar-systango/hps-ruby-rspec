# encoding: UTF-8
require 'spec_helper'
require_relative '../actionwords'

describe 'Grounds' do
  include Actionwords

  before(:each) do
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # And I handle everything except the grounds
    i_handle_everything_except_the_grounds
  end

  it "Message \"Empty grounds\" is displayed after 30 coffees are taken" do
    # Tags: priority:high
    # When I take "30" coffees
    i_take_coffee_number_coffees(30)
    # Then message "Empty grounds" should be displayed
    message_message_should_be_displayed("Empty grounds")
  end

  it "When the grounds are emptied, message is removed" do
    # Tags: priority:medium
    # When I take "30" coffees
    i_take_coffee_number_coffees(30)
    # And I empty the coffee grounds
    i_empty_the_coffee_grounds
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end
end