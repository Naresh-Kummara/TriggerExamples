trigger ContactTriggers on Contact (after insert,after update,after delete){ 
     if(Trigger.isAfter && Trigger.isInsert){
        TaskOnContact.insertedcontacts(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isDelete){
        TaskOnContact.deletedcontacts(Trigger.old);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        TaskOnContact.updatedcontacts(Trigger.new);
    }

}