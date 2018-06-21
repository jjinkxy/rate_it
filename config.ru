# frozen_string_literal: true

require 'rails'
require 'rubygems'
require 'bundler'

Bundler.require :default, :test

Combustion.initialize! :all
run Combustion::Application
