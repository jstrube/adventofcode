inpt = """
Rudolph can fly 22 km/s for 8 seconds, but then must rest for 165 seconds.
Cupid can fly 8 km/s for 17 seconds, but then must rest for 114 seconds.
Prancer can fly 18 km/s for 6 seconds, but then must rest for 103 seconds.
Donner can fly 25 km/s for 6 seconds, but then must rest for 145 seconds.
Dasher can fly 11 km/s for 12 seconds, but then must rest for 125 seconds.
Comet can fly 21 km/s for 6 seconds, but then must rest for 121 seconds.
Blitzen can fly 18 km/s for 3 seconds, but then must rest for 50 seconds.
Vixen can fly 20 km/s for 4 seconds, but then must rest for 75 seconds.
Dancer can fly 7 km/s for 20 seconds, but then must rest for 119 seconds."""

testinpt = """
Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds."""

type Reindeer
	name::ASCIIString
	speed::Int64
	duration::Int64
	rest::Int64
	state::ASCIIString # state can be f(ly) or r(est)
end

herd = Reindeer[]
for line in split(inpt, "\n")
	items = split(line)
	n = items[1]
	s = parse(Int, items[4])
	d = parse(Int, items[7])
	r = parse(Int, items[end-1])
	push!(herd, Reindeer(n, s, d, r, repeat("r", r)))
end

competition = Dict([x.name=>[0,0] for x in herd]) # keep track of both distance and score

# part one doesn't care who was in the lead when
function competitionState(competition, time)
	for r in herd
		unit = r.duration + r.rest
		distance = div(time, unit) * r.speed*r.duration
		if time % unit < r.duration
			distance += (time % unit)*r.speed
		else
			distance += r.speed*r.duration
		end
		competition[r.name][1] = distance
	end
	return competition
end

# part two keeps track of the state after each second
function timeStep(competition)
	for r in herd
		distance = 0
		if r.state[1] == 'f'
			if length(r.state) == r.duration
				r.state = "r"
			else
				r.state *= "f"
				distance += r.speed
			end
		elseif r.state[1] == 'r'
			if length(r.state) == r.rest
				r.state = "f"
				distance += r.speed
			else
				r.state *= "r"
			end
		end
		competition[r.name][1] += distance
	end
	# bonus, share points
	best = ("Donner", 0)
	for (c, d) in competition
		if d[1] > best[2]
			best = (c, d[1])
		end
	end
	for (c, d) in competition
		if d[1] == best[2]
			competition[c][2] += 1
		end
	end
	return competition
end

#println(competitionState(competition, 2503))

for i in 1:2503
	timeStep(competition)
end
println(competition)
