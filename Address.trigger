trigger Address on Address__c (after insert, after update) {

	if ( Trigger.isAfter && ( Trigger.isInsert || Trigger.isUpdate ) ) {
		AddressManagement.syncBuildingUnitCount( Trigger.new );

	}
}