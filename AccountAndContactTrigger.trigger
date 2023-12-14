trigger AccountAndContactTrigger on Account (after update) {
    if(Trigger.isUpdate && Trigger.isAfter)
    {
        AccountAndContactsTriggerTask.updateContactStatus(Trigger.new,Trigger.oldMap);
    }

}