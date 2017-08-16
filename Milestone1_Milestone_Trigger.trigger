trigger Milestone1_Milestone_Trigger on Milestone1_Milestone__c (before insert, before update, before delete,
																 after insert, after update, after delete) {
	if (! ( Milestone1_Settings__c.getOrgDefaults() != null && Milestone1_Settings__c.getOrgDefaults().DISABLE_TRIGGERS__c ) ) {
		if(Trigger.isbefore){
			if(Trigger.isDelete){
				//Milestone1_Milestone_Trigger_Utility.handleMilestoneDeleteTrigger(trigger.oldMap);
			} 
			else if(Trigger.isUpdate){
				//prevent manual reparenting of Milestones
				// Removed this check for now 
				// Milestone1_Milestone_Trigger_Utility.checkMilestoneManualReparent(trigger.oldMap, trigger.newMap);
                Milestone1_Milestone_Trigger_Utility.syncMarketToFiberhood( trigger.new );
			} 
			else {
				//insert
				Milestone1_Milestone_Trigger_Utility.handleMilestoneBeforeTrigger(trigger.new, trigger.newMap);
                //Milestone1_Milestone_Trigger_Utility.syncMarketToFiberhood( trigger.new );
			}
			
			
		} 
		else {
			if(Trigger.isDelete){
				Milestone1_Milestone_Trigger_Utility.updateParents(trigger.oldMap);
			} 
	        else if(Trigger.isUpdate){

	            Milestone1_Milestone_Trigger_Utility.updateParents(trigger.newMap);
	            
	
		            //shift Deadline of successor Milestones if Milestone Deadline is shifted
		            // Handled by ProjectChain now
		            //    Milestone1_Milestone_Trigger_Utility.checkSuccessorDependencies(trigger.oldMap, trigger.newMap);
		            //shift children Milestone dates if Milestone dates are shifted
		            // We aren't using child milestones
		            // Milestone1_Milestone_Trigger_Utility.checkChildDependencies(trigger.oldMap, trigger.newMap);
		            //shift Task dates if Milestone dates are shifted
		            // Handled by Milestone1_Milestone_Trigger_Utility.checkTaskDependencies(trigger.oldMap, trigger.newMap);
	
	        } 
			else {
				Milestone1_Milestone_Trigger_Utility.updateParents(trigger.newMap);
			}
		}
	}
	
}