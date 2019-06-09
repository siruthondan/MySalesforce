@isTest
public class DailyLeadProcessorTest{
	@testSetup
	static void setup(){
		List<Lead> newLeads = new List<Lead>();
		for(Integer i = 0; i < 200; i++){
            newLeads.add(new Lead(FirstName = 'New'+i,LastName = 'Last'+i,Company = 'Hello My Company'));
		}
		insert newLeads;
	}
	
	static testmethod void testschedulable(){
		Test.StartTest();
		DailyLeadProcessor daily = new DailyLeadProcessor();
		String sch = '00 00 07 10 6 ?';
		System.schedule('Daily Job for Leads',sch,daily);
		Test.StopTest();
	}
}