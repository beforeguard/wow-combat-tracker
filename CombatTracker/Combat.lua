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

function CombatTracker:HandleCombatLogEvent(...)
    if not self.currentFight then
        return
    end

    local _, subevent, _, sourceGUID, _, _, _, destGUID, _, _, _, _, _, _, amount =
        CombatLogGetCurrentEventInfo()

    local playerGUID = UnitGUID("player")

    if subevent == "UNIT_DIED" then
        if destGUID == playerGUID then
            self.currentFight.deaths = self.currentFight.deaths + 1
        end
        return
    end

    if subevent == "PARTY_KILL" then
        if sourceGUID == playerGUID then
            self.currentFight.kills = self.currentFight.kills + 1
        end
        return
    end

    if sourceGUID ~= playerGUID or not amount then
        return
    end

    local statByEvent = {
        SPELL_DAMAGE = "damage",
        SPELL_HEAL = "healing",
    }

    local stat = statByEvent[subevent]
    if stat then
        self.currentFight[stat] = self.currentFight[stat] + amount
    end
end
