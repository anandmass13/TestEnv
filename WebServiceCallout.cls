public class WebServiceCallout {
    @future (callout=true)
    public static void sendNotification(String TestInfoId, String OrganizationId, String TestInfoName) {
      
      System.debug('TestinformationID'+TestInfoId);
      
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        String OrganizationId1='00D61000000fBw41';
      // String testparam = TestInfoId+'~'+'00D61000000fBw4'+'~'+TestInfoName;
              String testparam =TestInfoId +'~'+OrganizationId1+'~'+TestInfoName;
        String token = 'testcasename';
         System.debug('TestParameters :'+testparam);
        
        //String content = 'token='+token+'&testparam='+testparam;
        String endPointURL='http://183.82.108.79/jenkins/job/SeleniumTestFramework/buildWithParameters?token=testcasename';
        
        String content = '&testparam='+testparam;
        
       //req.setEndpoint('http://183.82.108.79/jenkins/job/TestFramework/buildWithParameters?testparam=test');
         req.setEndpoint(endPointURL);
        //String testparam = TestInfoId+'~'+OrganizationId+'~'+TestInfoName;
       
        //req.setEndpoint('http://52.33.6.171:8081/job/TestAutomation');
        req.setBody(content);
        


          req.setHeader('Content-Type','application/x-www-form-urlencoded'); 
          req.setMethod('POST');  
          req.setBody(content); 
                       
        //req.setCompressed(true); // otherwise we hit a limit of 32000
                 System.debug('Request' +req.toString());
        try {
            res = http.send(req);
             
        } catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
            System.debug(res.toString());
        }
    }
}