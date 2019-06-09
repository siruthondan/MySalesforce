global class DailyLeadProcessor implements Schedulable {	
	global void execute(SchedulableContext ctx){
		List<Lead> filterLeads = [SELECT Id,LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
		List<Lead> toUpdate = new List<Lead>();
		for(Lead updLeads : filterLeads){
			updLeads.LeadSource = 'Dreamforce';
			toUpdate.add(updLeads);
		}
		update toUpdate;
	}
}