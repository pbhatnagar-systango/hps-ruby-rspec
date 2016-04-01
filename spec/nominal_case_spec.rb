# encoding: UTF-8
require 'spec_helper'
require_relative 'actionwords'

describe 'Nominal case' do
  include Actionwords

  it "Simple use" do
    # Well, sometimes, you just get a coffee.
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should be served
    coffee_should_be_served
  end

  context "Messages are based on language" do
    def messages_are_based_on_language(lang, ready_message)
      # Well, sometimes, you just get a coffee.
      # When I start the coffee machine "<lang>"
      i_start_the_coffee_machine(lang)
      # Then message "<ready_message>" should be displayed
      message_message_should_be_displayed(ready_message)
    end

    it "English" do
      messages_are_based_on_language('en', 'Ready')
    end

    it "French" do
      messages_are_based_on_language('fr', 'Pret')
    end
  end

  it "No messages are displayed when machine is shut down" do
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I shutdown the coffee machine
    i_shutdown_the_coffee_machine
    # Then message "" should be displayed
    message_message_should_be_displayed("")
  end
end