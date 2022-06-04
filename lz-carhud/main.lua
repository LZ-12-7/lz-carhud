local cinto = false


CreateThread(function()
    while true do
        local _s = 1000
        local veh = GetVehiclePedIsIn(PlayerPedId())
        if IsPedInAnyVehicle(PlayerPedId()) then
            _s = 100
            SendNUIMessage({
                action = "InVeh";
                fuel   = GetVehicleFuelLevel(veh);
                kmh    = ((GetEntitySpeed(veh)) * 3.6);

            })

        elseif not IsPedInAnyVehicle(PlayerPedId()) then
            SendNUIMessage({
                action = "outVeh";
            })
        end
            
        if IsPedInAnyVehicle(PlayerPedId(), false) and IsPauseMenuActive() then
            SendNUIMessage({action = "outVeh"})
        else
            SendNUIMessage({action = "InVeh"})
        end
        Wait(_s)
    end
end)

SeatBelt = function()
    while true do
        if cinto then 
            DisableControlAction(0, 75, true)
            DisableControlAction(27, 75, true)
        else      
            Wait(1500)
        end
        Wait(0)
    end
end

RegisterCommand('__colocarcinto', function()
    if IsPedInAnyVehicle(PlayerPedId()) then
            cinto = false
        if cinto then
            SendNUIMessage({ action = "cintofalse" })
            cinto = false
            SeatBelt(PlayerPedId())
        else
            SendNUIMessage({ action = "cintotrue" })
            cinto = true
            SeatBelt(PlayerPedId())
        end
    end
end)

RegisterKeyMapping('__colocarcinto', 'Colocar Cinturon', 'keyboard', "G")
