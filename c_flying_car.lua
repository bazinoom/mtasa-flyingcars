isFlying = false
Cars = {}
bindKey("lshift","down",
function()
	if (isPedInVehicle(localPlayer) and Cars[getElementModel(getPedOccupiedVehicle(localPlayer))]) then
		if isWorldSpecialPropertyEnabled("aircars") then
			setWorldSpecialPropertyEnabled ( "aircars", false )
			if isFlying then
				removeEventHandler("onClientRender", root, checkFlight)
			end
			isFlying = false
		else
			setWorldSpecialPropertyEnabled ( "aircars", true )
			if not isFlying then
				addEventHandler("onClientRender", root, checkFlight)
			end
			isFlying = true
		end
	end
end)
	
function checkFlight()
	if (not isPedInVehicle(localPlayer)) or (not Cars[getElementModel(getPedOccupiedVehicle(localPlayer))]) or isPedDead(localPlayer) then
		setWorldSpecialPropertyEnabled ( "aircars", false )
		if isFlying then
			removeEventHandler("onClientRender", root, checkFlight)
		end
		isFlying = false
	end
end