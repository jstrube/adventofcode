function checkPW(word)
	if word[end] in ['i','l','o']
		# println(bytestring(word), " contains ilo")
		return false
	end
	sequence = false
	doubletCount = 0
	current = ""
	for w in 1:length(word)-1
		if word[w] in ['i','l','o']
			# println(bytestring(word), " contains ilo")
			return false
		end
		# println(w, " ", word[w], " ", word[w+1], " ", bytestring(word))
		if word[w] == word[w+1]
			if current != word[w]
				doubletCount += 1
				current = word[w]
			end
		else
			current = ""
		end
		if w < length(word)-1 && word[w]+2 == word[w+1]+1 == word[w+2]
			sequence = true
		end
	end
	if doubletCount < 2
		# println(bytestring(word), " contains not enough duplicates: ", doubletCount)
		return false
	end
	if !sequence
		# println(bytestring(word), " contains no sequence")
		return false
	end
	return true
end

function makeNew(pw)
	last = length(pw)
	pw[last] += 1
	while last > 1 && pw[last] > 'z'
		pw[last] = 'a'
		last -= 1
		pw[last] += 1
	end
	if bytestring(pw) == join(['z' for i in 1:length(pw)])
		return false
	end
	return true
end

passwd = b"vzbxxzzz"
while !checkPW(passwd)
	# println(bytestring(passwd))
	if !makeNew(passwd)
		break
	end
end
println(bytestring(passwd))
