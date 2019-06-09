public class AnimalLocator{
	public static String getAnimalNameById(Integer i){
		Http http = new Http();
		HttpRequest req = new HttpRequest();
		String endPoint = 'https://th-apex-http-callout.herokuapp.com/animals/'+i;
		req.setMethod('GET');
		req.setEndpoint(endPoint);
		HttpResponse resp = http.send(req);
        Map<String,Object> obj = new Map<String,Object>();
		if(resp.getStatusCode() == 200){
			Map<String,Object> results = (Map<String,Object>)JSON.deserializeUntyped(resp.getBody());			
             obj = (Map<String,Object>)results.get('animal');          
		}
			return(String) obj.get('name');
	}
}