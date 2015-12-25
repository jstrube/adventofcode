names = ["Sprinkles", "PeanutButter", "Frosting", "Sugar"]
capacity = [5, -1, 0, -1]
durability = [-1, 3, -1, 0]
flavor = [0, 0, 4, 0]
texture = [0, 0, 0, 2]
calories = [5, 1, 6, 8]

maxscore = 0
for parts in partitions(100, 4)
	for perms in permutations(parts)
		if dot(perms, calories) != 500
			continue
		end
		score = max(0,dot(perms, capacity))*max(0,dot(perms, durability))*max(0,dot(perms, flavor))*max(0,dot(perms, texture))
		if score > maxscore
			maxscore = score
		end
	end
end
println(maxscore)
