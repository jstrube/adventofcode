inpt = """
1
2
3
7
11
13
17
19
23
31
37
41
43
47
53
59
61
67
71
73
79
83
89
97
101
103
107
109
113"""

packs = Int64[]
for item in split(inpt)
	push!(packs, parse(Int, item))
end
# only need to look for the smallest subset that sums to 520 mass (total/3) and leaves two other subsets that sum to total/3
i = 3
found = false
total = div(sum(packs), 4)
println(total)
while true
	# the input is sorted, so the smallest quantum entanglement is going to be found first
	for best in combinations(packs, i)
		if sum(best) == total
			remainder = setdiff(packs, best)
			for parts in partitions(remainder, 3)
				# now try all possibilities of the remaining combinations
				# if they don't all 3 add up to total, we're not done
				found = true
				for p in parts
					if sum(p) != total
						found = false
						break
					end
				end
				found && break
			end
		end
		if found
			println(best, " ", sum(best), " ", prod(best))
			break
		end
	end
	found && break
	i += 1
end
