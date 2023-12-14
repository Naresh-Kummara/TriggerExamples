public class TaskOnContact {
      public static void insertedcontacts(List<Contact> clist)
    {
        List<Account> accs= new List<Account>();
    for(Contact c:clist){
        List<Account> relatedaccs=[SELECT Id,No_of_Child_contacts__c,No_Of_Contacts_Cheked__c from Account Where Id=:c.AccountId ];
        for(Account a:relatedaccs)
        {
        a.No_of_Child_contacts__c=a.No_of_Child_contacts__c+1;
            if(c.Checked_Filed__c==true){
              a.No_Of_Contacts_Cheked__c=a.No_Of_Contacts_Cheked__c+1;
            }
            accs.add(a);
        }
    }
        if(!accs.isEmpty())
        {
            update accs;
        }
    }
    public static void deletedcontacts(List<Contact> clist){
        List<Account> accs= new List<Account>();
        for(Contact c:clist){
            List<Account> relatedaccs=[SELECT Id,No_of_Child_contacts__c from Account Where Id=:c.AccountId];
            for(Account a:relatedaccs){
                a.No_of_Child_Contacts__c=a.No_of_Child_Contacts__c-1;
                update accs;
            }
        }
    }
      public static void updatedcontacts(List<Contact> conListNew)
    {
        for(Contact con : conListNew )
        {
            if(con.Checked_Filed__c == True)
            {
                List<Account> accList = [SELECT Id,No_Of_Contacts_Cheked__c FROM Account WHERE Id = :con.AccountId];
                for(Account acc : accList)
                {
                    acc.No_Of_Contacts_Cheked__c = acc.No_Of_Contacts_Cheked__c + 1;
                    Update acc;
                }
            }
            else if(con.Checked_Filed__c==false)
            {
                System.debug('Checked is ===> False');
            }
        }
    }
}





  /*  public static void updateAccountField(List<Contact> newList,List<Contact>oldList)
    {
     Set<Id> accIds=new Set<id>();
        if(newList != null){
            for(Contact con:newList){
                if(con.AccountId !=null){
                    accIds.add(con.AccountId);
                }
            }
        }
        if(oldList != null){
            for(Contact con:oldList){
                if(con.AccountId !=null){
                    accIds.add(con.AccountId);
                }
            }
        }
        List<Account> accList=[SELECT Id, No_Of_Contacts_Cheked__c,(SELECT Id FROM Contacts WHERE Checked_Filed__c=true) FROM Account where id In:accIds];
        for(Account acc: accList){
            acc.No_Of_Contacts_Cheked__c=acc.contacts.size();
        }
        update accList;
    }
    

	public static void updateAccountCheckedField(List<Contact> newList,List<Contact>oldList)
	{
    Set<Id> accIds=new Set<id>();
    if(newList != null){
        for(Contact con:newList){
            if(con.Checked_Filed__c){
                accIds.add(con.AccountId);
            }
        }
    }
    if(oldList != null){
        for(Contact con:oldList){
            if(con.Checked_Filed__c){
                accIds.add(con.AccountId);
            }
        }
    }
    List<Account> accList=[SELECT Id, No_Of_Child_Contacts__c,(SELECT Id, Checked_Filed__c FROM Contacts) FROM Account where id in:accIds];
    for(Account acc: accList){
        acc.No_Of_Child_Contacts__c=acc.contacts.size();
    }
    update accList;
}

}*/