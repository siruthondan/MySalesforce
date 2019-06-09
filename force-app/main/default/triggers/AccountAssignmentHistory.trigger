trigger AccountAssignmentHistory on Account (before insert,before update) {
    List<Assignment_History__c> listAssignment = new List<Assignment_History__c>();
    for(Account Acc: Trigger.new) { 
        if(Trigger.oldMap.get(Acc.Id).BillingPostalCode != Trigger.newMap.get(Acc.Id).BillingPostalCode){
            Id prevOwnerId = Trigger.oldMap.get(Acc.Id).OwnerId;
            Id newOwnerId = Trigger.newMap.get(Acc.Id).OwnerId;
            System.debug(Trigger.oldMap);
            System.debug(Trigger.newMap);
            String oldBillablePostalCode = Trigger.oldMap.get(Acc.Id).BillingPostalCode;
            Id oldBillablePostalCodeId = [Select Id from Territory__c Where Name = :oldBillablePostalCode LIMIT 1].Id;
            String newBillablePostalCode = Trigger.newMap.get(Acc.Id).BillingPostalCode;
            Id newBillablePostalCodeId = [Select Id from Territory__c Where Name = :newBillablePostalCode LIMIT 1].Id;
            Id modifiedBy = Trigger.newMap.get(Acc.Id).LastModifiedById;
            
            
            Assignment_History__c newAssignment = new Assignment_History__c();
            newAssignment.Account__c = Acc.Id;
            newAssignment.Changed_By__c = modifiedBy;
            newAssignment.New_Owner__c = newOwnerId;
            newAssignment.Previous_Owner__c = prevOwnerId;
            newAssignment.New_Territory__c = newBillablePostalCodeId;
            newAssignment.Previous_Territory__c = oldBillablePostalCodeId;
            listAssignment.add(newAssignment);         
            
        }        
    }
    insert ListAssignment;
}