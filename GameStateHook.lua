-- Game hook mod injector
function arrayToString(arrayOfStrings)
    res = ""
    for i = 1, table.maxn(arrayOfStrings) do
        res = res .. '"' .. arrayOfStrings[i] .. '",'
    end
    return '[' .. res:sub(1, -2) .. ']'
end

function listener()
  local playerTurns = ""
  for i,a in pairs(Players) do
    if a:IsEverAlive() and a:IsHuman() then
      local allies = {}
      local enemies = {}
      for j,b in pairs(Players) do
          if (a:IsAllies(b)) then
              table.insert(allies, b:GetNickName())
          end
          if (Teams[a:GetTeam()]:IsAtWar(b:GetTeam())) then
              table.insert(enemies, tostring(b:GetID()))
          end
      end
      playerTurns = playerTurns .. "{" ..
          '"id" : ' .. tostring(a:GetID()) .. "," ..
          '"nickName" : ' .. '"' .. a:GetNickName() .. '"' .. "," ..
          '"civilization" : ' .. '"' .. a:GetCivilizationShortDescription() .. '"' .. "," ..
          '"isTurnComplete" : ' .. tostring(a:HasReceivedNetTurnComplete()) .. "," ..
          '"isOnline" : ' .. tostring(Network.IsPlayerConnected(a:GetID())) .. "," ..
          '"isAlive" : ' .. tostring(a:IsAlive()) .. "," ..
          '"currentEra" : ' .. a:GetCurrentEra() .. "," ..
          '"numWonders" : ' .. a:GetNumWorldWonders() .. "," ..
          '"enemies" : ' .. arrayToString(enemies) .. "," ..
          '"allies" : ' .. arrayToString(allies) ..
          "},"
    end
  end
  local gameState = ""
  gameState = gameState .. "{" .. '"isUnitedNationActive" : ' .. tostring(Game.IsUnitedNationsActive())  .. "}"
  
  print("----JSON----{" .. '"gameTurn" : ' .. tostring(Game.GetGameTurn()) ..","  .. '"players" : [' .. playerTurns:sub(1, -2) .. "]," .. '"game": ' .. gameState .. "}----JSON----")
end

print("----GameHook: GameHook listener initialized.")

Events.RemotePlayerTurnEnd.Add(listener)
Events.RemotePlayerTurnStart.Add(listener)
Events.ActivePlayerTurnStart.Add(listener)
Events.ActivePlayerTurnEnd.Add(listener)
Events.MultiplayerGamePlayerDisconnected.Add(listener)
Events.MultiplayerGamePlayerUpdated.Add(listener)
Events.MultiplayerHotJoinCompleted.Add(listener)
Events.WarStateChanged.Add(listener);
Events.SerialEventEraChanged.Add(listener);
Events.WonderStateChanged.Add(listener);
