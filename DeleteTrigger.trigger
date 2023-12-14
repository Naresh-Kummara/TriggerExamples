trigger DeleteTrigger on Market_Name__c (before delete) {
    if(Trigger.isDelete)
    {
        if(Trigger.isBefore)
        {
          DeleteTrigger.deleteBefore(Trigger.old);  
        }
        else if(Trigger.isAfter){
           // DeleteTrigger.deleteAfter(Trigger.old);
        }
    }

}