#!/usr/bin/env ruby
require 'json'
require 'fileutils'

def run(singles_dir_path, dest_dir_path, batch_size = 100)
  puts "Extractiong: #{singles_dir_path} to #{dest_dir_path} batch size: #{batch_size}"
  FileUtils.rm_rf Dir.glob("#{dest_dir_path}/*")
  Dir["#{singles_dir_path}/*.json"].each_slice(batch_size).with_index  do | batch, i |
    json_files = batch.map do |item|
      json = File.read(item)
      next if json == ""
      JSON.parse(json)
    end

    File.open("#{dest_dir_path}/batch-#{i}.json", "w") {|file| file.write(json_files.to_json) }
  end
end

batch_size = (ARGV[2]) ? ARGV[2].to_i : 100
run(ARGV[0], ARGV[1], batch_size)