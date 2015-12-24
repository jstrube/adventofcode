inpt = """AlphaCentauri to Snowdin = 66
AlphaCentauri to Tambi = 28
AlphaCentauri to Faerun = 60
AlphaCentauri to Norrath = 34
AlphaCentauri to Straylight = 34
AlphaCentauri to Tristram = 3
AlphaCentauri to Arbre = 108
Snowdin to Tambi = 22
Snowdin to Faerun = 12
Snowdin to Norrath = 91
Snowdin to Straylight = 121
Snowdin to Tristram = 111
Snowdin to Arbre = 71
Tambi to Faerun = 39
Tambi to Norrath = 113
Tambi to Straylight = 130
Tambi to Tristram = 35
Tambi to Arbre = 40
Faerun to Norrath = 63
Faerun to Straylight = 21
Faerun to Tristram = 57
Faerun to Arbre = 83
Norrath to Straylight = 9
Norrath to Tristram = 50
Norrath to Arbre = 60
Straylight to Tristram = 27
Straylight to Arbre = 81
Tristram to Arbre = 90"""
places = Vector{ASCIIString}()
for line in split(inpt, '\n')
	p1 = split(line)[1]
	p2 = split(line)[3]
	if !(p1 in places)
		push!(places, p1)
	end
	if !(p2 in places)
		push!(places, p2)
	end
end

distances = zeros(Int64, (length(places), length(places)))
println(inpt)
println(places)
for line in split(inpt, '\n')
	place1 = split(line)[1]
	place2 = split(line)[3]
	dist = parse(Int, split(line)[end])
	println(place1, place2, dist)
	i = findfirst(places, place1)
	j = findfirst(places, place2)
	distances[i,j] = dist
	distances[j,i] = dist
end
println(distances)

shortest = (0, places)
for p in permutations(places)
	sum = 0
	for city in 2:length(p)
		i = findfirst(places, p[city])
		j = findfirst(places, p[city-1])
		sum += distances[i, j]
	end
	if sum > shortest[1]
		shortest = (sum, p)
	end
end

println(shortest)
