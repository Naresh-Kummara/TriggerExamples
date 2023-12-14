public with sharing class SentEmailToUser
{
    public static void getEmailAlertToUsedr(List<Contact> conn)
    {
        List<Messaging.Email> emailList=new List<Messaging.Email>();
        for(Contact con:conn)
        {
            if(con.Email != null)
            {
            Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
            String[] address=new String[]{con.Email};
            msg.setToAddresses(address);
            String subject='sibject is'+con.LastName;
            msg.setSubject(subject);
            String body='hi'+con.FirstName+'<br/><br/>'+'welcome to salesforce';
            msg.setHtmlBody(body);

            emailList.add(msg);
            }
        }
        Messaging.sendEmail(emailList);
    }
}