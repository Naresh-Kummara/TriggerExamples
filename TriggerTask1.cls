public class TriggerTask1 {
    //when satge is updated in oppo case status updated and status is new send email alert otherwise not send email alert
    
    /*public static void updateAnnualRevenue(List<case> caseList){
        List<Account> accList=new List<Account>();
        Account a=new Account();
        for(Case acc:caseList){
            if(acc.Status=='Working'){
               a.AnnualRevenue=20000;
                acc.id=a.Id;
                acc.Subject=a.Name;
                accList.add(acc);
            }
            }
        if(!accList.isEmpty()){
            insert accList;
        }
        }*/
    
    public static void updateCaseData(List<Opportunity> oopList) {
        List<Case> ca=new List<Case>();
     Case c=new Case();
     for(Opportunity oop:oopList){
         c.Subject=oop.Name;
         if(oop.StageName=='Prospecting'){
             c.Status='New';
         }else if(oop.StageName=='Needs Analysis'){
             c.Status='Working';
             
         }else if(oop.StageName=='Closed Lost'){
             c.Status='Escalated';
         }
         
         ca.add(c);   
     }
     
     if(!ca.isEmpty()){
         insert ca;
     }
    }
}