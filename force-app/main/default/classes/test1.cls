public with sharing class test1 {
    public string value { get; set;}
        public void testdirect(){
            system.debug(value);
        }
        public void testinput(){
            value = apexpages.currentPage().getParameters().get('inpval');
            system.debug(value);
        }
}