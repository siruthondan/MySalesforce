trigger ThreeSalesRepOneZipCode on Territory__c (before insert) {
    for(Territory__c territory: Trigger.new){
        String ZipCode = territory.Name;
        Integer count = [Select Count() From Territory__c Where Name = :ZipCode];
            if(count == 3){
                territory.addError('A ZipCode can have maximum of three SalesReps');
            }
    }

}