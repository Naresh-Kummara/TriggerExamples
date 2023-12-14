public class TriggerTask2 {
    public static void beforeInsertingEmail(List<Account> accList){
        List<String> emailSet = new List<String>();
              
        for(Account acc:[SELECT id, Email__c FROM account WHERE Email__c != null]){
            emailSet.add(acc.Email__c);

        }
        
        for(Account acc1:accList){
   
            if(emailSet.contains(acc1.Email__c)){
                acc1.addError('duplicate value triggered');
            }
        }
        
       
    }
}