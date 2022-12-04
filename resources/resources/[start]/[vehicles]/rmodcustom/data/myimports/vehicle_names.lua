function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	--Generic Liveries
	AddTextEntry("f175", "f175")
	AddTextEntry("w13", "w13")
	AddTextEntry("rb18", "rb18")
	AddTextEntry("rx7rb", "rx7rb")
	AddTextEntry("lpi8004", "lpi8004")
end)
