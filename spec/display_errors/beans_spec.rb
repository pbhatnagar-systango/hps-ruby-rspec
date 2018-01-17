# encoding: UTF-8
require 'spec_helper'
require_relative '../actionwords'

describe 'Beans' do
  include Actionwords

  before(:each) do
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # And I handle everything except the beans
    i_handle_everything_except_the_beans
  end

  it "Message \"Fill beans\" is displayed after 38 coffees are taken" do
    # Tags: priority:high
    # When I take "38" coffees
    i_take_coffee_number_coffees(38)
    # Then message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
  end

  it "It is possible to take 40 coffees before there is really no more beans" do
    # Tags: priority:low
    # When I take "40" coffees
    i_take_coffee_number_coffees(40)
    # Then coffee should be served
    coffee_should_be_served
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should not be served
    coffee_should_not_be_served
    # And message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
  end

  it "After adding beans, the message \"Fill beans\" disappears" do
    # Tags: priority:high
    # When I take "40" coffees
    i_take_coffee_number_coffees(40)
    # And I fill the beans tank
    i_fill_the_beans_tank
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end
end