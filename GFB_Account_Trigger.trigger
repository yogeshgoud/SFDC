/* 
* Class Name  : GFB_Account_Trigger 
* Description : Handling all AccountFunctionality
* Created By  : Chiranth Aradhya
* Created On  : 11/18/2015
*
* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Modification log:
* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Developer                                  Date                                    Description
* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*                            
*
* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

trigger GFB_Account_Trigger on Account (Before Insert, Before Update) {

  if(Trigger.isUpdate && Trigger.isBefore){
      GFB_Account_TriggerHandler_Class.Account_BeforeUpdate(Trigger.new,Trigger.oldmap);    
  }
  
  if(Trigger.isInsert && Trigger.isBefore){
      GFB_Account_TriggerHandler_Class.Account_BeforeInsert(Trigger.new);    
  }
  new GFB_Account_TriggerHandler_Class().handleTrigger();
}