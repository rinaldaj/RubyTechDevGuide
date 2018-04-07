
def decompress(s)
	if (! (/\[/ =~ s))
		return s
	end
	pos =0
	numClose = 0
	max = 0
	for i in 0..s.length
		max = i
		if s[i] == "["
			numClose = numClose + 1
			if pos == 0
				pos = i
			end
		end
		if s[i] == "]"
			numClose = numClose - 1
			if numClose == 0
				break
			end
		end
	end	
	chunk = s[0..max]
	rest = s[max+1..(s.length-1)]
	reps = /[0-9]+\[/.match(chunk)[0].gsub(/\[/,"").to_i
	seq = decompress(s[pos+1..(max-1)])
	box = ""
	for i in 1..reps
		box = box + seq
	end
	return (chunk[0..pos])[/[^0-9\[]/].to_s + box + decompress(rest)
	
	
end

puts decompress("3[abc]4[ab]c")

