require 'rlua'

EVAL_SCRIPT = <<-LUA
local globals = {}
for k, v in pairs(getfenv()) do globals[k] = v end

%s
local locals = {}
for k, v in pairs(getfenv()) do locals[k] = v end

local mark = {}
local diff = {}
for k, v in pairs(locals) do
  diff[k] = v
  mark[k] = true
end
for k, v in pairs(globals) do
  if mark[k] ~= nil then diff[k] = nil end
end
value = diff
LUA

def format_file(filename)
  s = Lua::State.new
  s.__load_stdlib(:base)
  s.__eval(EVAL_SCRIPT % File.read(filename))
  variables = s.value

  result = "\r\n"
  variables.to_hash.keys.sort.each do |k|
    v = variables[k]
    result << k + ' = '
    if v.is_a?(Lua::Table)
      result << format_table(v)
    else
      result << format_value(v)
    end
    result << "\r\n"
  end
  result
end

def format_table(table, level = 1)
  hash = table.to_hash
  if hash.keys.all? { |v| v.is_a?(Float) }
    list = []
    seq = 1
    is_seq = true
    table.each do |k, v|
      is_seq = false if is_seq && k != seq
      return format_hash(hash, level) if !is_seq && seq == 1

      if is_seq
        list << v
      else
        list << [k, v]
      end
      seq += 1
    end
    format_list(list, level)
  else
    format_hash(hash, level)
  end
end

def format_hash(hash, level)
  result = "{\r\n"
  sorted_keys = hash.keys.sort do |a, b|
    if a.is_a?(Float) && b.is_a?(Float)
      a <=> b
    elsif a.is_a?(Float)
      -1
    elsif b.is_a?(Float)
      1
    else
      a <=> b
    end
  end
  sorted_keys.each do |k|
    v = hash[k]
    result << "\t" * level
    result << "[#{format_value(k)}] = "
    if v.is_a?(Lua::Table)
      result << format_table(v, level + 1)
    else
      result << format_value(v)
    end
    result << ",\r\n"
  end
  result << "\t" * (level - 1) if level > 1
  result << "}"
end

def format_list(list, level)
  result = "{\r\n"
  list.each_with_index do |v, i|
    result << "\t" * level
    if v.is_a?(Array)
      new_k, new_v = v
      result << "[#{format_value(new_k)}] = "
      if new_v.is_a?(Lua::Table)
        result << format_table(new_v, level + 1)
      else
        result << format_value(new_v)
      end
      result << ",\r\n"
    else
      if v.is_a?(Lua::Table)
        result << format_table(v, level + 1)
      else
        result << format_value(v)
      end
      result << ", -- [#{i + 1}]\r\n"
    end
  end
  result << "\t" * (level - 1) if level > 1
  result << "}"
end

def format_value(value)
  case value
  when Float
    if value.to_s.end_with?('.0')
      value.to_i.to_s
    else
      value.to_s
    end
  when String
    escaped = value
      .gsub("\\") { "\\\\" }
      .gsub('"', '\\"')
      .gsub("\t", "\\t")
      .gsub("\r", "\\r")
      .gsub("\n", "\\n")
    "\"#{escaped}\""
  when nil
    'nil'
  else
    value.to_s
  end
end
