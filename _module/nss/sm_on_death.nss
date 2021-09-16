// DMFI MP Starter Mod
// sm_on_death
// Execution of selected death system

#include "x3_inc_horse"

void main()
{

// Horse-related code from nw_o0_death by Deva Winblood
    object oPlayer = GetLastPlayerDied();
    object oHorse;
    object oInventory;
    string sID;
    int nC;
    string sT;
    string sR;
    int nCH;
    int nST;
    object oItem;
    effect eEffect;
    string sDB="X3SADDLEBAG"+GetTag(GetModule());
    if (GetStringLength(GetLocalString(GetModule(),"X3_SADDLEBAG_DATABASE"))>0) sDB=GetLocalString(GetModule(),"X3_SADDLEBAG_DATABASE");
    if (HorseGetIsMounted(oPlayer))
    { // Dismount and then die
        //SetCommandable(FALSE,oPlayer);
        //ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer);
        DelayCommand(0.3,HORSE_SupportResetUnmountedAppearance(oPlayer));
        DelayCommand(3.0,HORSE_SupportCleanVariables(oPlayer));
        DelayCommand(1.0,HORSE_SupportRemoveACBonus(oPlayer));
        DelayCommand(1.0,HORSE_SupportRemoveHPBonus(oPlayer));
        DelayCommand(1.1,HORSE_SupportRemoveMountedSkillDecreases(oPlayer));
        DelayCommand(1.1,HORSE_SupportAdjustMountedArcheryPenalty(oPlayer));
        DelayCommand(1.2,HORSE_SupportOriginalSpeed(oPlayer));
        if (!GetLocalInt(GetModule(),"X3_HORSE_NO_CORPSES"))
        { // okay to create lootable horse corpses
            sR=GetSkinString(oPlayer,"sX3_HorseResRef");
            sT=GetSkinString(oPlayer,"sX3_HorseMountTag");
            nCH=GetSkinInt(oPlayer,"nX3_HorseAppearance");
            nST=GetSkinInt(oPlayer,"nX3_HorseTail");
            nC=GetLocalInt(oPlayer,"nX3_HorsePortrait");
            if (GetStringLength(sR)>0&&GetStringLeft(sR,GetStringLength(HORSE_PALADIN_PREFIX))!=HORSE_PALADIN_PREFIX)
            { // create horse
                oHorse=HorseCreateHorse(sR,GetLocation(oPlayer),oPlayer,sT,nCH,nST);
                SetLootable(oHorse,TRUE);
                SetPortraitId(oHorse,nC);
                SetLocalInt(oHorse,"bDie",TRUE);
                AssignCommand(oHorse,SetIsDestroyable(FALSE,TRUE,TRUE));
            } // create horse
        } // okay to create lootable horse corpses
        oInventory=GetLocalObject(oPlayer,"oX3_Saddlebags");
        sID=GetLocalString(oPlayer,"sDB_Inv");
        if (GetIsObjectValid(oInventory))
        { // drop horse saddlebags
            if (!GetIsObjectValid(oHorse))
            { // no horse created
                HORSE_SupportTransferInventory(oInventory,OBJECT_INVALID,GetLocation(oPlayer),TRUE);
            } // no horse created
            else
            { // transfer to horse
                HORSE_SupportTransferInventory(oInventory,oHorse,GetLocation(oHorse),TRUE);
                //DelayCommand(2.0,PurgeSkinObject(oHorse));
                //DelayCommand(3.0,KillTheHorse(oHorse));
                //DelayCommand(1.8,PurgeSkinObject(oHorse));
            } // transfer to horse
        } // drop horse saddlebags
        else if (GetStringLength(sID)>0)
        { // database based inventory
            nC=GetCampaignInt(sDB,"nCO_"+sID);
            while(nC>0)
            { // restore inventory
                sR=GetCampaignString(sDB,"sR"+sID+IntToString(nC));
                sT=GetCampaignString(sDB,"sT"+sID+IntToString(nC));
                nST=GetCampaignInt(sDB,"nS"+sID+IntToString(nC));
                nCH=GetCampaignInt(sDB,"nC"+sID+IntToString(nC));
                DeleteCampaignVariable(sDB,"sR"+sID+IntToString(nC));
                DeleteCampaignVariable(sDB,"sT"+sID+IntToString(nC));
                DeleteCampaignVariable(sDB,"nS"+sID+IntToString(nC));
                DeleteCampaignVariable(sDB,"nC"+sID+IntToString(nC));
                if (!GetIsObjectValid(oHorse))
                { // no lootable corpse
                    oItem=CreateObject(OBJECT_TYPE_ITEM,sR,GetLocation(oPlayer),FALSE,sT);
                } // no lootable corpse
                else
                { // lootable corpse
                    oItem=CreateItemOnObject(sR,oHorse,nST,sT);
                } // lootable corpse
                if (GetItemStackSize(oItem)!=nST) SetItemStackSize(oItem,nST);
                if (nCH>0) SetItemCharges(oItem,nCH);
                nC--;
            } // restore inventory
            DeleteCampaignVariable(sDB,"nCO_"+sID);
            //DelayCommand(2.0,PurgeSkinObject(oHorse));
            if (GetIsObjectValid(oHorse)&&GetLocalInt(oHorse,"bDie")) DelayCommand(3.0,KillTheHorse(oHorse));
            //DelayCommand(2.5,PurgeSkinObject(oHorse));
        } // database based inventory
        else if (GetIsObjectValid(oHorse))
        { // no inventory
            //DelayCommand(1.0,PurgeSkinObject(oHorse));
            DelayCommand(2.0,KillTheHorse(oHorse));
            //DelayCommand(1.8,PurgeSkinObject(oHorse));
        } // no inventory
        //eEffect=EffectDeath();
        //DelayCommand(1.6,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oPlayer));
        //DelayCommand(1.7,SetCommandable(TRUE,oPlayer));
        //return;
    } // Dismount and then die

// Now go to the main death system choices

int deathchoice = GetLocalInt(GetModule(), "death_system");

if (deathchoice == 1) // Parthenon Easy Death System
   ExecuteScript ("tz_ed_ondeath", oPlayer);

if (deathchoice == 2) // HABD system, by default set to no respawn option
   ExecuteScript ("habd_onpcdeath", oPlayer);

if (deathchoice == 3 || deathchoice == 4) // standard death system with unlimited or penalty respawn
   ExecuteScript("nw_o0_death", oPlayer);

}

