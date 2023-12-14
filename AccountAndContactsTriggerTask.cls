public class AccountAndContactsTriggerTask {
    public static void updateContactStatus(List<Account> accList,Map<Id,Account> oldMap){
        List<Contact> conList=new List<Contact>();
        for(Account ac :accList)
        {
            Account newAccount=oldMap.get(ac.Id);
            if(ac.Health_Status__c!=newAccount.Health_Status__c)
            {
               for(Contact con:[SELECT Id FROM Contact WHERE AccountId =:ac.Id])
              {
                con.Health_Status__c=ac.Health_Status__c;
                con.Health_Status_CloseDate__c=System.today();
                con.Contact_Token__c=generateRandomToken(10);
                conList.add(con);
              }
               
            }
            
        }
       
        if(!conList.isEmpty())
        {
            update conList;
        }

    }
   public static String generateRandomToken(Integer length) {
        String validChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-=[]{}|;:,.<>?';
        String token = '';
        while (token.length() < length) {
            Integer randomIndex = Math.mod(Math.abs(Crypto.getRandomInteger()), validChars.length());
            token += validChars.substring(randomIndex, randomIndex + 1);
        }
        return token;
    }
}