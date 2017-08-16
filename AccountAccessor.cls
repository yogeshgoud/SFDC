/*
(c) Appirio 2013

Last Modified  Eric Sexton  2013 June 12

*/


public with sharing class AccountAccessor {

    public static Account getConstructionVendorByFiberhood(string fiberhoodId) {
    	Fiberhood__c fh = null;
    	if ( fiberhoodId == null ) {
    		return null;
    	}
    	for ( Fiberhood__c tmp :  [ Select Id, Name, Construction_Vendor__r.id, Construction_Vendor__r.Name, Construction_Vendor__r.Market__c 
                            From Fiberhood__c where id =:fiberhoodId limit 1 ] ) {
    		fh = tmp;
    	}
                    
        if ( fh == null ) {
        	return null;
        }
        return fh.Construction_Vendor__r;
        
    } 

    public static Account getConstructionVendorById(string vendorId) {
    	Account vendor = null;

    	for ( Account tmp : [ Select Id, Name, Market__c From Account where id = :vendorId ] ) {
    		vendor = tmp;
    	}
    	return vendor;
    }
}