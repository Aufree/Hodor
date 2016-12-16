#!/usr/bin/env ruby

PROJECT_PATH = "./Hodor"
STRINGS_PATH = "./zh-Hans.lproj/Localizable.strings"

def klang_strings
  keys = []
  Dir.entries(".").each do |path|
    mfiles = File.join(path, "*.m")
    Dir.glob(mfiles) do |item|
      File.read(item).scan(/kLang\(@"([^"]*)/).each do |key|
        keys.push(key[0])
      end
    end
  end

  keys.uniq()
end

def decode_str_file(line)
  match = /^\s*((?:"(?:[^"\\]|\\.)+")|(?:[^"\s=]+))\s*=\s*"((?:[^"\\]|\\.)*)"/.match(line)
  if match
    key = match[1]
    key = key[1..-2] if key[0] == '"' and key[-1] == '"'
    key.gsub!('\\"', '"')
    value = match[2]
    value.gsub!('\\"', '"')
    return key, value
  else
    return nil
  end
end

def str_to_hash(file)
  str_list = Hash.new

  File.open(file, "r") do |f|
    f.each_line do |line|
      arr = decode_str_file(line)
      if arr
        str_list[arr[0]] = arr[1]
      end
    end

    str_list
  end
end

def update_strings_file
  content = File.read(STRINGS_PATH) + "\n"

  klang_strings.each do |str|
    unless str_to_hash(STRINGS_PATH).keys.include? str
      new_str = '"' + str + '" = "";'
      content += new_str
    end
  end

  File.write(STRINGS_PATH, content)

  p "Update strings successfully ✨ ✨ ✨"
end

update_strings_file()
