require 'minitest/autorun'
require 'byebug'
require 'ruboty'
require 'ruboty/redis'
require 'fakeredis'
require './init'

Dotenv.load

module Riety
  module Test
    def setup
      super
      @bot = ::Ruboty::Robot.new
      @from = 'alice'
      @to = '#general'
      @bot.brain.data[:customers] = [@from]
    end

    ::Minitest::Test.send(:prepend, self)
  end
end
