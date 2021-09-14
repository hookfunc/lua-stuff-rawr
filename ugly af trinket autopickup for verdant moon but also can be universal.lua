while wait(1) do -- why (yes enjoy memory leaks iguess)
for i,v in pairs(workspace.AmbientAreas:GetDescendants()) do -- get every thing in ambientareas
    if v:IsA("ClickDetector") and v.Name == "ClickDetector"  then -- see if its a clickdetector
            fireclickdetector(v, 10) -- click on them with a max range of 10
      end 
  end
end
