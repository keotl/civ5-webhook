-- Game hook mod injector
function listener()
  local playerTurns = ""
  for i,a in pairs(Players) do
    if a:IsEverAlive() and a:IsHuman() then
      playerTurns = playerTurns .. "{" ..
              '"id" : ' .. tostring(a:GetID()) .. "," ..
              '"nickName" : ' .. '"' .. a:GetNickName() .. '"' .. "," ..
              '"isTurnComplete" : ' .. tostring(a:HasReceivedNetTurnComplete()) .. "," ..
              '"isOnline" : ' .. tostring(Network.IsPlayerConnected(a:GetID())) .. "," ..
              '"isAlive" : ' .. tostring(a:IsAlive()) ..
              "},"
    end
  end

  print("----JSON----{" ..
          '"gameTurn" : ' .. tostring(Game.GetGameTurn()) ..","  ..
          '"players" : [' .. playerTurns:sub(1, -2) .. "]" ..
          "}----JSON----")
end

print("----GameHook: GameHook listener initialized.")

Events.RemotePlayerTurnEnd.Add(listener)
Events.RemotePlayerTurnStart.Add(listener)
Events.ActivePlayerTurnStart.Add(listener)
Events.ActivePlayerTurnEnd.Add(listener)
Events.MultiplayerGamePlayerDisconnected.Add(listener)
Events.MultiplayerGamePlayerUpdated.Add(listener)
Events.MultiplayerHotJoinCompleted.Add(listener)
