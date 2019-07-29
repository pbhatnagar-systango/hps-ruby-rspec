# encoding: UTF-8
require 'spec_helper'
require_relative 'actionwords'

describe 'Bad usage' do
  include Actionwords

  it "Full grounds does not block coffee" do
    # You keep getting coffee even if the "Empty grounds" message is displayed. That said it's not a fantastic idea, you'll get ground everywhere when you'll decide to empty it.
    # Tags: priority:low
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # And I handle everything except the grounds
    i_handle_everything_except_the_grounds
    # When I take "50" coffees
    i_take_coffee_number_coffees(50)
    # Then message "Empty grounds" should be displayed
    message_message_should_be_displayed("Empty grounds")
    # And coffee should be served
    coffee_should_be_served
  end
end