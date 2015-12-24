inpt = """
jio a, +18
inc a
tpl a
inc a
tpl a
tpl a
tpl a
inc a
tpl a
inc a
tpl a
inc a
inc a
tpl a
tpl a
tpl a
inc a
jmp +22
tpl a
inc a
tpl a
inc a
inc a
tpl a
inc a
tpl a
inc a
inc a
tpl a
tpl a
inc a
inc a
tpl a
inc a
inc a
tpl a
inc a
inc a
tpl a
jio a, +8
inc b
jie a, +4
tpl a
inc a
jmp +2
hlf a
jmp -7 """

a = 1
b = 0
instructs = split(inpt, '\n')
i = 1
while true
	items = split(instructs[i])
	if items[1] == "inc"
		eval(parse(items[2]*" += 1"))
	elseif items[1] == "tpl"
		eval(parse(items[2]*" *= 3"))
	elseif items[1] == "hlf"
		eval(parse(items[2]*" = div("*items[2]*", 2)"))
	elseif items[1] == "jmp"
		j = parse(Int, items[2])
		if i+j > length(instructs)
			break
		end
		i += j
		continue
	elseif items[1] == "jie"
		j = parse(Int, items[3])
		if eval(parse(" iseven("*items[2][1:end-1]*")"))
			if i+j > length(instructs)
				break
			end
			i += j
			continue
		end
	elseif items[1] == "jio"
		j = parse(Int, items[3])
		if eval(parse(items[2][1:end-1]*" == 1"))
			if i+j > length(instructs)
				break
			end
			i += j
			continue
		end
	end
	i += 1
end
println("a = $a\tb = $b")
