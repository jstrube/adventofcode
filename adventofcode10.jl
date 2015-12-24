inpt = "3113322113"

output = ""
for x = 1:50
	output = ""
	current = inpt[1]
	count = 0
	for i in inpt
		if i == current
			count += 1
		else
			output *= "$count$current"
			count = 1
			current = i
		end
	end
	output *= "$count$current"
	inpt = output
end
println(length(output))
