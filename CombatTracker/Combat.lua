function CombatTracker:StartCombat()
    self.inCombat = true

    self.currentFight = {
        startTime = GetTime(),
        duration = 0,
        damage = 0,
        healing = 0,
        deaths = 0,
        kills = 0,
    }

    self:LogMessage("Combat started")
end

function CombatTracker:EndCombat()
    if not self.inCombat then
        return
    end

    self.inCombat = false

    self.currentFight.duration = GetTime() - self.currentFight.startTime

    table.insert(
        CombatTracker.session.fights,
        self.currentFight
    )

    self:LogCurrentFight()
    self:LogMessage("Combat ended")
end

function CombatTracker:RecordDeath(destGUID)
    local playerGUID = UnitGUID("player")
    if destGUID == playerGUID then
        self.currentFight.deaths = self.currentFight.deaths + 1
    end
end

function CombatTracker:RecordKill(sourceGUID)
    local playerGUID = UnitGUID("player")
    if sourceGUID == playerGUID then
        self.currentFight.kills = self.currentFight.kills + 1
    end
end

function CombatTracker:AddDamage(sourceGUID, amount)
    local playerGUID = UnitGUID("player")
    if sourceGUID == playerGUID and amount then
        self.currentFight.damage = self.currentFight.damage + amount
    end
end

function CombatTracker:AddHealing(sourceGUID, amount)
    local playerGUID = UnitGUID("player")
    if sourceGUID == playerGUID and amount then
        self.currentFight.healing = self.currentFight.healing + amount
    end
end

-- Main handler (parses once, routes to specialists)
function CombatTracker:HandleCombatLogEvent(...)
    if not self.currentFight then
        return
    end

    local _, subevent, _, sourceGUID, _, _, _, destGUID, _, _, _, _, _, _, amount =
        CombatLogGetCurrentEventInfo()

    if subevent == "UNIT_DIED" then
        self:RecordDeath(destGUID)
    elseif subevent == "PARTY_KILL" then
        self:RecordKill(sourceGUID)
    elseif subevent == "SPELL_DAMAGE" then
        self:AddDamage(sourceGUID, amount)
    elseif subevent == "SPELL_HEAL" then
        self:AddHealing(sourceGUID, amount)
    end
end
