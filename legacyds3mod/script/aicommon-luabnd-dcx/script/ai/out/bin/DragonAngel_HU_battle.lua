RegisterTableGoal(GOAL_DragonAngel_209000_HU_Battle, "DragonAngelHUBattle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_DragonAngel_209000_HU_Battle, true)
Goal.Initialize = function (arg0, arg1, arg2, arg3)
    return 
end

Goal.Activate = function (arg0, arg1, arg2)
    Init_Pseudo_Global(arg1, arg2)
    arg1:SetStringIndexedNumber("Dist_SideStep", 10)
    arg1:SetStringIndexedNumber("Dist_BackStep", 8)
    local local0 = {}
    local local1 = {}
    local local2 = {}
    Common_Clear_Param(local0, local1, local2)
    arg1:SetNumber(0, 0)
    arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    local local3 = arg1:GetDist(TARGET_ENE_0)
    if InsideRange(arg1, arg2, 180, 75, -99, 5) then
        local0[5] = 20
        local0[6] = 70
        local0[20] = 10
    elseif InsideRange(arg1, arg2, 180, 270, -99, 10) then
        local0[5] = 90
        local0[20] = 10
    elseif InsideDir(arg1, arg2, 180, 270) then
        local0[20] = 100
    elseif 17 <= local3 then
        local0[4] = 50
        local0[10] = 50
    elseif 15 <= local3 then
        local0[2] = 15
        local0[4] = 30
        local0[8] = 25
        local0[10] = 25
    elseif 10 <= local3 then
        local0[1] = 15
        local0[2] = 20
        local0[3] = 20
        local0[7] = 15
        local0[8] = 15
        local0[9] = 15
    elseif 5 <= local3 then
        local0[1] = 30
        local0[7] = 30
        local0[9] = 20
        local0[11] = 20
    else
        local0[4] = 20
        local0[7] = 35
        local0[11] = 45
    end
    local0[4] = SetCoolTime(arg1, arg2, 3005, 8, local0[4], 1)
    local0[5] = SetCoolTime(arg1, arg2, 3007, 15, local0[5], 1)
    local0[6] = SetCoolTime(arg1, arg2, 3008, 30, local0[6], 1)
    local0[8] = SetCoolTime(arg1, arg2, 3010, 10, local0[8], 0)
    local0[8] = SetCoolTime(arg1, arg2, 3011, 10, local0[8], 0)
    local0[8] = SetCoolTime(arg1, arg2, 3012, 10, local0[8], 0)
    local0[9] = SetCoolTime(arg1, arg2, 3010, 10, local0[9], 0)
    local0[9] = SetCoolTime(arg1, arg2, 3011, 10, local0[9], 0)
    local0[9] = SetCoolTime(arg1, arg2, 3012, 10, local0[9], 0)
    local0[10] = SetCoolTime(arg1, arg2, 3010, 10, local0[10], 0)
    local0[10] = SetCoolTime(arg1, arg2, 3011, 10, local0[10], 0)
    local0[10] = SetCoolTime(arg1, arg2, 3012, 10, local0[10], 0)
    local1[1] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act01)
    local1[2] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act02)
    local1[3] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act03)
    local1[4] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act04)
    local1[5] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act05)
    local1[6] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act06)
    local1[7] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act07)
    local1[8] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act08)
    local1[9] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act09)
    local1[10] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act10)
    local1[11] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act11)
    local1[20] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act20)
    local1[21] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act21)
    local1[23] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act23)
    local1[24] = REGIST_FUNC(arg1, arg2, DragonAngelHU_Act24)
    Common_Battle_Activate(arg1, arg2, local0, local1, REGIST_FUNC(arg1, arg2, DragonAngelHU_ActAfter_AdjustSpace), local2)
    return 
end

function DragonAngelHU_Act01(arg0, arg1, arg2)
    local local0 = 3000
    local local1 = 10 - arg0:GetMapHitRadius(TARGET_SELF)
    local local2 = 0
    local local3 = 0
    local local4 = arg0:GetRandam_Int(1, 100)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    if local4 <= 60 then
        arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, local0, TARGET_ENE_0, local1, local2, local3)
    elseif local4 <= 80 then
        arg0:SetNumber(0, 1)
        local local5 = arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, local0, TARGET_ENE_0, 11 - arg0:GetMapHitRadius(TARGET_SELF) + 10, local2, local3)
        local5:TimingSetNumber(0, 0, AI_TIMING_SET__UPDATE_SUCCESS)
        arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, local1)
    else
        arg0:SetNumber(0, 1)
        local local5 = arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, local0, TARGET_ENE_0, 11.6 - arg0:GetMapHitRadius(TARGET_SELF) + 10, local2, local3)
        local5:TimingSetNumber(0, 0, AI_TIMING_SET__UPDATE_SUCCESS)
        arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, local1)
    end
    local4 = arg0:GetNumber(0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act02(arg0, arg1, arg2)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3002, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act03(arg0, arg1, arg2)
    local local0 = 3003
    local local1 = 10 - arg0:GetMapHitRadius(TARGET_SELF)
    local local2 = 0
    local local3 = 0
    local local4 = arg0:GetRandam_Int(1, 100)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    if local4 <= 60 then
        arg1:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, local0, TARGET_ENE_0, local1, local2, local3)
    elseif local4 <= 80 then
        arg0:SetNumber(0, 1)
        local local5 = arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, local0, TARGET_ENE_0, 11 - arg0:GetMapHitRadius(TARGET_SELF) + 10, local2, local3)
        local5:TimingSetNumber(0, 0, AI_TIMING_SET__UPDATE_SUCCESS)
        arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, local1)
    else
        arg0:SetNumber(0, 1)
        local local5 = arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, local0, TARGET_ENE_0, 11.6 - arg0:GetMapHitRadius(TARGET_SELF) + 10, local2, local3)
        local5:TimingSetNumber(0, 0, AI_TIMING_SET__UPDATE_SUCCESS)
        arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, local1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act04(arg0, arg1, arg2)
    Approach_Act_Flex(arg0, arg1, 23.5 - arg0:GetMapHitRadius(TARGET_SELF), -999, -998, 0, 0, 5, 5)
    --arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3005, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 1.5, 45)
    arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3010, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 1.5, 45)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act05(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3007, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act06(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3008, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act07(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3009, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act08(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3010, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act09(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3011, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act10(arg0, arg1, arg2)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3012, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act11(arg0, arg1, arg2)
    local local0 = 3004
    local local1 = 10 - arg0:GetMapHitRadius(TARGET_SELF)
    local local2 = 0
    local local3 = 0
    local local4 = arg0:GetRandam_Int(1, 100)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    if local4 <= 50 then
        arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, local0, TARGET_ENE_0, local1, local2, local3)
    elseif local4 <= 70 then
        arg0:SetNumber(0, 1)
        local local5 = arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, local0, TARGET_ENE_0, 11 - arg0:GetMapHitRadius(TARGET_SELF) + 10, local2, local3)
        local5:TimingSetNumber(0, 0, AI_TIMING_SET__UPDATE_SUCCESS)
        arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, local1)
    else
        arg0:SetNumber(0, 1)
        local local5 = arg1:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, local0, TARGET_ENE_0, 11.6 - arg0:GetMapHitRadius(TARGET_SELF) + 10, local2, local3)
        local5:TimingSetNumber(0, 0, AI_TIMING_SET__UPDATE_SUCCESS)
        arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, local1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act20(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_COMMON_Turn, 3, TARGET_ENE_0, 45)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act21(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_COMMON_ApproachTarget, arg0:GetRandam_Float(3, 4), TARGET_ENE_0, 8, TARGET_SELF, false, -1)
    arg1:AddSubGoal(GOAL_COMMON_SpinStep, 2.5, arg0:GetRadam_Int(6002, 6003), TARGET_ENE_0, 0, AI_DIR_TYPE_B, arg0:GetStringIndexedNumber("Dist_SideStep"))
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act23(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_COMMON_SpinStep, 2.5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, arg0:GetStringIndexedNumber("Dist_BackStep"))
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_Act24(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_COMMON_SpinStep, 2.5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, arg0:GetStringIndexedNumber("Dist_BackStep"))
    arg1:AddSubGoal(GOAL_COMMON_SpinStep, 2.5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, arg0:GetStringIndexedNumber("Dist_BackStep"))
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function DragonAngelHU_ActAfter_AdjustSpace(arg0, arg1, arg2)
    return 
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (arg0, arg1, arg2)
    return 
end

Goal.Interrupt = function (arg0, arg1, arg2)
    if arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) and arg1:GetSpecialEffectActivateInterruptType(0) == 5025 and arg1:GetNumber(0) == 0 then
        arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5025)
        return DragonAngelHU_ExAttack(arg1, arg2)
    else
        return false
    end
end

function DragonAngelHU_ExAttack(arg0, arg1)
    if InsideRange(arg0, arg1, 180, 270, -99, 10) then
        if arg0:GetRandam_Int(1, 100) <= 100 then
            arg1:ClearSubGoal()
            local local0 = arg0:GetRandam_Int(1, 100)
            if local0 <= 50 then
                arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
            elseif local0 <= 0 then
                arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
            else
                --arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
                arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3010, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
            end
            return true
        else
            return false
        end
    elseif InsideRange(arg0, arg1, 0, 90, -99, 10) then
        if arg0:GetRandam_Int(1, 100) <= 80 then
            arg1:ClearSubGoal()
            local local0 = arg0:GetRandam_Int(1, 100)
            if local0 <= 20 then
                arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
            elseif local0 <= 65 then
                arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
            else
                --arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
                arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3010, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
            end
            return true
        else
            return false
        end
    elseif InsideRange(arg0, arg1, 0, 180, 10, 18) then
        if arg0:GetRandam_Int(1, 100) <= 80 then
            arg1:ClearSubGoal()
            local local0 = arg0:GetRandam_Int(1, 100)
            if local0 <= 0 then
                arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
            elseif local0 <= 0 then
                arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3013, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
            else
                --arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
                arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3010, TARGET_ENE_0, 10 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
            end
            return true
        else
            return false
        end
    else
        return false
    end
end

return 
