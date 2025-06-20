# frozen_string_literal: true

module Callable
  # Raised when .new fails due to arity / keyword mismatch
  class ConstructionError < ArgumentError; end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    ##
    # Instantiate and immediately invoke #call
    # @param args [Array] positional arguments for initialize
    # @param kwargs [Hash] keyword arguments for initialize
    # @yield [*] optional configuration/result block
    # @return [Object] whatever the instance #call returns
    # @raise  [ConstructionError] when instantiation fails
    def call(*args, **kwargs, &block)
      inst = begin
        # avoids Ruby 2.3–2.6 quirk
        kwargs.empty? ? new(*args, &block) : new(*args, **kwargs, &block)
      rescue ArgumentError => error
        raise ConstructionError,
              "Failed to construct #{name}.new with the supplied arguments: #{error.message}",
              error.backtrace
      end

      if block_given? && inst.method(:call).arity.zero?
        inst.call(&block)
      else
        inst.call
      end
    end
  end
end
