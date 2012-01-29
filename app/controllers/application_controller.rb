class ApplicationController < ActionController::Base
  protect_from_forgery
end

class ParseFunction
   def parse
      raise "parse must be overridden"
   end
end

class StringParseFunction < ParseFunction
   attr_accessor :hashkey
   def initialize(hashkey)
      @hashkey = hashkey
   end
   def parse(hash)
      value = hash.fetch(@hashkey)
      raise "#{hashkey} is empty" if value.empty?
      return value
   end
end

class NumberParseFunction < ParseFunction
   attr_accessor :hashkey
   def initialize(hashkey)
      @hashkey = hashkey
   end
   def parse(hash)
      value = Integer(hash.fetch(@hashkey))
      return value
   end
end

class ArrayParseFunction < ParseFunction
   attr_accessor :hashkey
   def initialize(hashkey)
      @hashkey = hashkey
   end
   def parse(hash)
      value = hash.fetch(@hashkey).split(',')
      return nil if value.empty?
      return value
   end
end

class MultipleParseFunction < ParseFunction
   attr_accessor :key_start
   def initialize(key_start)
      @key_start = key_start
   end
   def parse(hash)
      #raise key_start
      return nil unless (hash.has_key?(key_start+'1') and (not hash.fetch(key_start+'1').empty?))
      ans = [hash.fetch(key_start+'1')]
      i = 2
      while hash.has_key?(key_start+i.to_s) do
         val = hash.fetch(key_start+i.to_s)
         ans << val unless val.empty?
         i = i + 1
      end
      return ans
   end
end

def parse(input_hash, parse_spec)
   ans = Hash.new
   parse_spec.each do |field, parse_ob|
    unless parse_ob.nil?
      doc = parse_ob.parse(input_hash)
      ans[field] = doc unless doc.nil?
    end
   end
   return ans
end

