global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
	global Integer recordsProcessed = 0;
	global Database.QueryLocator start(Database.BatchableContext bc){
		return Database.getQueryLocator('SELECT Id, NumberOfEmployees FROM Lead WHERE LeadSource = \'Dreamforce\'');
	}
	
	global void execute(Database.BatchableContext bc, List<Lead> leadList){	
		List<Lead> leadEmpUpd = new List<Lead>();
		for(Lead upd : leadList){
			upd.NumberOfEmployees = 50;
			leadEmpUpd.add(upd);
			
			recordsProcessed = recordsProcessed + 1;
		}
		update leadEmpUpd;
	}
	
	global void finish(Database.BatchableContext bc){
		AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :bc.getJobId()];
		System.debug(job);
        System.debug(recordsProcessed);
	}
	
}