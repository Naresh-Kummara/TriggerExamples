trigger SentEmailTrigger on Contact (before insert,after insert) {
    if(Trigger.isInsert)
    {
        SentEmailToUser.getEmailAlertToUsedr(Trigger.new);
    }

}