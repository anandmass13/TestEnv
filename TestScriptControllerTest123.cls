public class TestScriptController{
    public Test_Script__c objTestScript {get; set;}
    Id idTestInfor {get; set;}
    public TestScriptController(ApexPages.StandardController controller) {
        idTestInfor =ApexPages.currentPage().getParameters().get('RId');
        objTestScript = new Test_Script__c();
        objTestScript.Test_Information__c = idTestInfor;  
    }
    public TestScriptController(){
        objTestScript = new Test_Script__c();
        idTestInfor =ApexPages.currentPage().getParameters().get('RId'); 
        objTestScript.Test_Information__c = idTestInfor;        
    }
    
    
    public PageReference saveTestScript(){
        insert objTestScript;
        return new PageReference('/'+ idTestInfor); 
    }   
    
    public PageReference cancelTestScript(){
        return new PageReference('/'+ idTestInfor);
    }
}