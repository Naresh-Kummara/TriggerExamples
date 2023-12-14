public class OpportunityTaskOnAccount {
    public static void afterInsertionOfOpportunity(List<Opportunity> oppor)
    {
        List<Account> accList = new List<Account>();
        
        for(Opportunity oppo:oppor)
        {
            if(oppo.delivery_installation_status__c=='started')
            {
                Account a=new Account();
                a.Name=oppo.Name;
                a.Account_Opportunity__c=oppo.id;
                
                accList.add(a);
            }
        }
        insert accList;
        
        List<Contact> conList=new List<Contact>();
        
        for(Account acc : accList)
        {
            Contact con = new Contact();
            con.AccountId=acc.Id;
            con.LastName=acc.Name;
            conList.add(con);
        }
        insert conList;
       
        
    }
    public static void afterUpdatingField(List<Opportunity> opport)
    {
        List<Account> accList = new  List<Account>();
        List<OpportunityContactRole> orcList = new List<OpportunityContactRole>();
        List<Contact> conList = new List<Contact>();
        for(Opportunity opp:opport)
        {
            conList = [ select Id From Contact Where Name = : opp.Name LIMIT 1];
        }
        for(Opportunity opp:opport)
        {
       
             if(opp.delivery_installation_status__c=='inProgress')
             {
                 opp.StageName='Closed Won';
                 OpportunityContactRole oc=new OpportunityContactRole();
                 oc.name__c=opp.Name;
                 oc.OpportunityId=opp.Id;
                 oc.ContactId=conList[0].Id;
                 insert oc; 
                 //System.debug('oc');
             }
             else if(opp.delivery_installation_status__c=='completed')
             {
                 opp.StageName='Closed Lost';
                 Account acc=[SELECT Id FROM Account WHERE Name =: opp.Name Limit 1];
                 accList.add(acc);
                 OpportunityContactRole orc=[SELECT Id FROM OpportunityContactRole WHERE OpportunityId=:opp.Id ];
                 orcList.add(orc);
                 
             }
        }
        delete orcList;
        delete accList;
    }

}