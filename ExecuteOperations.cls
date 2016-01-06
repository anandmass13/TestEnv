global class ExecuteOperations{
    webservice static String executeScript(String strTestInfoId){
        MetadataLog__c objMTlog = new MetadataLog__c();
        objMTlog.Status__c ='Open';
        objMTlog.Action__c ='ExecuteScript';
        objMTlog.Test_Information__c = strTestInfoId;
        insert objMTlog; 
        return 'success';
    }
    
    webservice static String sendNotification(String TestInfoId, String OrganizationId, String TestInfoName){
        WebServiceCallout.sendNotification(TestInfoId, OrganizationId,TestInfoName);
        return 'success';
    }
    
    webservice static String NotifyForAutomation(String TestInfoId, String OrganizationId, String TestInfoName){
        Test_Information__c objTestInfo = new Test_Information__c(Id =TestInfoId, recordtypeid= '01261000000SDbo');
        update objTestInfo;
        WebServiceCallout.sendNotification(TestInfoId, OrganizationId,TestInfoName);
        return 'success';
    }
}