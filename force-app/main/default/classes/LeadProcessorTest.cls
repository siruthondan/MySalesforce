@isTest 
private class LeadProcessorTest{
	@testSetup
	static void DataSetup(){
		List<Lead> newLeads = new List<Lead>();
		for(Integer i=0; i<=199; i++){
			newLeads.add(new Lead(FirstName = 'FName'+i,LastName = 'LName'+i, Company = 'Company'+i, LeadSource = 'Dreamforce'));		
		}
		insert newLeads;		
	}
	
	static testmethod void test(){
		
		Test.StartTest();
			LeadProcessor newJob = new LeadProcessor();
			Id batchId = Database.executeBatch(newJob);
		Test.StopTest();
		System.AssertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
	} 
}