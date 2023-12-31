trigger ApexTestClassTrigger12 on Account (before insert,after insert,before update,after update,before delete,after delete) {
    if(Trigger.isInsert)
    {
        if(Trigger.isBefore)
        {
            ApexTestClass2.insertBeforeOnAccount(Trigger.new);
        }
        if(Trigger.isAfter)
        {
            ApexTestClass2.afterInsertUpdateAccount(Trigger.new); 
        }
    }
    if(Trigger.isUpdate)
    {
        if(Trigger.isBefore)
        {
          ApexTestClass2.beforeUpdateOperationOnAccount(Trigger.new,Trigger.oldMap); 
        }
        if(Trigger.isAfter)
        {
           ApexTestClass2.afterUpdateOperationOnAccount(Trigger.new,Trigger.oldMap);
        }
    }
    if(Trigger.isDelete)
    {
        if(Trigger.isBefore)
        {
         ApexTestClass2.deleteBeforeOperationOnAccount(Trigger.old);   
        }
        if(Trigger.isAfter)
        {
           ApexTestClass2.afterDeleteOperationOnAccount(Trigger.oldMap); 
        }
    }

}