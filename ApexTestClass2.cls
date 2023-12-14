public class ApexTestClass2 {
    //before insert event====insert rating is hot when industry field is media or enaergy
    public static void insertBeforeOnAccount(List<Account> accList)
    {
        for(Account acc:accList)
        {
            if(acc.industry=='media' || acc.industry=='energy')
            {
                acc.rating='Hot';
            }
        }
    }
    //after insert event====create account related opportunity
    public static void afterInsertUpdateAccount(List<Account> accList){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Account acc:accList)
        {
            Opportunity opp=new Opportunity();
            opp.Name=acc.name;
            opp.StageName='Qualification';
            opp.CloseDate=System.today();
            opp.AccountId=acc.Id;
            
            oppList.add(opp);
        }
        if(!oppList.isEmpty())
        {
           insert oppList; 
           // System.debug('oppLiast===='+oppList);
        }
    }
    //before update event===when updating address field in account object it will update description also
    public static void beforeUpdateOperationOnAccount(List<Account> accList,Map<Id,Account> oldMap)
    {
        for(Account acc:accList)
        {
            if(acc.Phone!=oldMap.get(acc.Id).phone)
            {
                acc.Description='are you serious on changing the work address';
               // System.debug(acc);
            }
        }

     }
    //after update event====when updating phone number in account relevent opportunity phone and description also updated
    public static void afterUpdateOperationOnAccount(List<Account> accList,Map<Id,Account> oldMap)
    {
        List<Opportunity> oppList=new List<Opportunity>();
        Map<Id,Account> updatedfield=new Map<Id,Account>();
        for(Account acc:accList)
        {
            if(acc.Phone!=oldMap.get(acc.id).phone)
            {
               updatedfield.put(acc.id,acc); 
            }
        }
     if(updatedfield!=null)
     {
         for(Opportunity opp:[SELECT Id,Account_Phone__c,AccountId FROM Opportunity WHERE AccountId IN :updatedfield.keySet()])
        {
            if(updatedfield.containsKey(opp.AccountId)){
                opp.Account_Phone__c=updatedfield.get(opp.AccountId).phone;
                //opp.Description='description field is updated by phone number field changed in account object';
                oppList.add(opp);
            }
        }
     }
        
        if(!oppList.isEmpty())
        {
            update oppList;
        }
    }
    
    //before delete event=====when the account active status is true you cannot delete that account
    public static void deleteBeforeOperationOnAccount(List<Account> accList)
    {
        for(Account acc:accList)
        {
            if(acc.Active__c=='yes')
            {
                acc.addError('you never delete active account');
            }
        }
    }
    
    //after delete event====while deleting account record related opportunity also deleted
    public static void afterDeleteOperationOnAccount(Map<Id,Account> mapSet)
    {
        List<Opportunity> oppList=new List<Opportunity>();
        for(Opportunity opp:[SELECT ID,Name FROM Opportunity WHERE AccountId IN:mapSet.keySet()])
        {
            oppList.add(opp);
        }
        if(!oppList.isEmpty())
        {
            delete oppList;
        }
    }

}