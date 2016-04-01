# encoding: UTF-8
require 'spec_helper'
require_relative '../actionwords'

describe 'Beans' do
  include Actionwords

  before(:each) do
      # As a coffee lover
      # I have to put fresh beans from time to time
      # So I can have coffee when I need it
      # Given the coffee machine is started
      the_coffee_machine_is_started
      # And I handle everything except the beans
      i_handle_everything_except_the_beans
  end

  it "Message \"Fill beans\" is displayed after 38 coffees are taken" do
    # When I take "38" coffees
    i_take_coffee_number_coffees(38)
    # Then message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
  end

  it "It is possible to take 40 coffees before there is really no more beans" do
    # Given I take "40" coffees
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
    # Given I take "40" coffees
    i_take_coffee_number_coffees(40)
    # When I fill the beans tank
    i_fill_the_beans_tank
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end
end