trigger UpdateLeadOwner on Lead (before update) {
{
    Set<String> propIds = new Set<String>();
    for (Lead lead : Trigger.new)
    {
        propIds.add(lead.property_name_lookup__c);
    }
    List<Property__c> propList = [SELECT Id, SMB_Rep__c FROM Property__c WHERE Id IN :propIds];
    for (Lead l : Trigger.new)
    {
        for (Property__c p : propList)
        {
            if(l.property_name_lookup__c == p.Id && p.SMB_Rep__c != null && l.RecordTypeID == '012d0000000P7yD' && l.Status != '3-Converted')
            {
                l.OwnerId = p.SMB_Rep__c;
            }
        }
    }
}
}