
s = "abppplee"
d = ["able","ale","apple","bale","kangaroo"]

bigest = ""

d.each do |i|
	regex = i.gsub(/(.)/,"\\1.*")
	if ( /#{regex}/ =~ s && bigest.length)
		bigest = i
	end
end

puts bigest
