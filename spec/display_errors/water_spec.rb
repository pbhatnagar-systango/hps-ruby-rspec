# encoding: UTF-8
require 'spec_helper'
require_relative '../actionwords'

describe 'Water' do
  include Actionwords

  before(:each) do
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # And I handle everything except the water tank
    i_handle_everything_except_the_water_tank
  end

  it "Message \"Fill water tank\" is displayed after 50 coffees are taken" do
    # Tags: priority:high
    # When I take "50" coffees
    i_take_coffee_number_coffees(50)
    # Then message "Fill tank" should be displayed
    message_message_should_be_displayed("Fill tank")
  end

  it "It is possible to take 10 coffees after the message \"Fill water tank\" is displayed" do
    # Tags: priority:low
    # When I take "60" coffees
    i_take_coffee_number_coffees(60)
    # Then coffee should be served
    coffee_should_be_served
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should not be served
    coffee_should_not_be_served
  end

  it "When the water tank is filled, the message disappears" do
    # Tags: priority:high
    # When I take "55" coffees
    i_take_coffee_number_coffees(55)
    # And I fill the water tank
    i_fill_the_water_tank
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end
end