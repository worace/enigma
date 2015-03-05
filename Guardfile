guard :minitest do
  watch(%r{^test/(.*)\/?(.*)\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})  { |m| "test/#{m[1]}#{m[2]}_test.rb" }
end
