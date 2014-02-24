# for practicing require: require '/home/erin/Documents/LearnRubytheHardWay/ex17.rb'

filename = ARGV[0]
lines = ARGV[1].to_i
script = $0 
user_inputs = []

def confirm_overwrite(script, filename)
	puts "This is the #{script} script."
	puts "We're going to erase #{filename} and write new text to it
	."
	puts "If you don't want that, hit CTRL-C (^C)."
	puts "If you do want that, hit RETURN."
	print "? "
	STDIN.gets
end 

def readfile(filename)
	File.open(filename, 'r') do |file|
		puts "Here is what your file contains now: "
		puts file.read()
	end
end

def get_user_input(lines, user_inputs)
	puts "Now I'm going to ask your for #{lines} lines."
	lines.times do |i|
		print "line #{i+1}: "
		user_inputs[i] = STDIN.gets.chomp()
	end
end

def write_to_file(filename, user_inputs)
	puts "I'm going to write these to the file."
	File.open(filename, 'w+') do |file|
		user_inputs.each do |element|
			file.write(element + "\n")
		end
	end
end



confirm_overwrite(script, filename)

readfile(filename)

get_user_input(lines, user_inputs)

write_to_file(filename, user_inputs)

readfile(filename)

#for practicing 'require' : copyfile(filename, 'changefile.txt')

# TODO:
# - ask for yes/no instead of "return/ctrl-c"
# - what happens when the file doesn't exist? do the opposite
#   - error?
#   - new file
# - allow unlimited new lines
#   - finish by entering two blank lines