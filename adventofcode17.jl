inpt = """11
30
47
31
32
36
3
1
5
3
32
36
15
11
46
26
28
1
19
3"""
buckets = Int64[parse(Int, i) for i in split(inpt)]

nFit = 0
fridge = 150

# solution stolen from the subreddit
# the point is that computing all permutations takes too long
# all we do here is compute the distinct combinations of n sub-elements of the input array
# where 1<= n <= length(input)
for i in 1:length(buckets)
	for j in combinations(buckets, i)
		if sum(j) == fridge
			nFit += 1
		end
	end
	if nFit > 0
		break
	end
end

println(nFit)
