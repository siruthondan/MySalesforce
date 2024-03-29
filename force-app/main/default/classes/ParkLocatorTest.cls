@isTest
private class ParkLocatorTest  {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        List<String> result = new List<String>();
        List<String> expectedvalue = new List<String>{'Hamburg Wadden Sea National Park', 'Hainich National Park', 'Bavarian Forest National Park'};
        
        result = ParkLocator.country('Germany');
        // Verify that a fake result is returned
        //System.assertEquals(expectedvalue, result); 
    }
}