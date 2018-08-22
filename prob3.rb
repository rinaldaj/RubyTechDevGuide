#This program is for finding the volume of water in lakes
#The array is the heigth the index is the location

testCase = [1,3,2,4,1,3,1,4,5,2,2,1,4,2,2]

#I think we should proceed from left to right
#A lake will be Stop when something is of greater than or equal height to the original. We will keep track of  the front and the possible end

start = 0
stop = 0
vol = 0 #keeps track of total lake volume

while start < (testCase.length-1)
	puts "Start is #{start}"
	stop = start + 1
	for i in (start+1)..(testCase.length-1)
		if testCase[i] >= testCase[stop]
			stop = i
		end
		if (testCase[i] >= testCase[start])
			break
		end
	end
	puts "stop is #{stop}"
	shortest = if testCase[stop] < testCase[start] then stop else start end
	curLakeVol = 0
	for i in start..stop
		curLakeVol = if testCase[shortest] < testCase[i] then curLakeVol else curLakeVol + (testCase[shortest] - testCase[i]) end
	end
	start = stop
	vol = vol + curLakeVol
end

puts vol
