#This program is for finding the volume of water in lakes
#The array is the heigth the index is the location

testCase = [1,3,2,4,1,3,1,4,5,2,2,1,4,2,2]

#I think we should proceed from left to right
#A lake will be Stop when something is of greater than or equal height to the original. We will keep track of  the front and the possible end

start = 0 #start is the variable that holds the first Pillar of the lake
stop = 0 #stop holds the last index of the lake
vol = 0 #keeps track of total lake volume

while start < (testCase.length-1)

	stop = start + 1

	#This for loop finds the end of the lake
	for i in (start+1)..(testCase.length-1)

		#stop is only updated if there is a index higher than it
		#This keeps the lake so that it doesn't run off the end of the island
		if testCase[i] >= testCase[stop]
			stop = i
		end
		#The lake ends when we hit something that is greater than or equal to where we started
		if (testCase[i] >= testCase[start])
			break
		end
	end

	shortest = if testCase[stop] < testCase[start] then stop else start end
	curLakeVol = 0
	#This for loop calculates the volume of the current lake
	for i in start..stop
		#Prevents it from adding negative values (occurs when at the begining or at the end)
		curLakeVol = if testCase[shortest] < testCase[i] then curLakeVol else curLakeVol + (testCase[shortest] - testCase[i]) end
	end
	start = stop
	vol = vol + curLakeVol
end

puts vol
