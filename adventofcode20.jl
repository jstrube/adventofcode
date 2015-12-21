### from RosettaCode
### http://rosettacode.org/wiki/Factors_of_an_integer#Julia
function factors(n)
    f = [one(n)]
    for (p,e) in factor(n)
        f = reduce(vcat, f, [f*p^j for j in 1:e])
    end
    return length(f) == 1 ? [one(n), n] : sort!(f)
end

for x in 2:24
	println(x, " ", 10*sum(factors(x)))
end

count = 100000
x = 0
while x < 34000000
	count += 1
	x = 10*sum(factors(count))
	if count % 10000 == 0
		println(count, " ", x)
	end
end
println(count, " ", x)


### second way
### allocate M houses and add a loop over elves adding presents to each house

# allocate the houses
houses = 11*ones(Int64, 3400000)
for elf in 2:length(houses)
	houses[elf:elf:min(50*elf, 3400000)] += 11*elf
end

for (idx, h) in enumerate(houses)
	if h > 34000000
		println(idx)
		break
	end
end
