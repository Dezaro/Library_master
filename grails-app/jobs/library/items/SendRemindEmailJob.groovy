package library.items

import grails.plugins.mail.MailService

class SendRemindEmailJob {
    MailService mailService
    RentBookService rentBookService

    static triggers = {
//      simple repeatInterval: 10000l // execute job once in 10 seconds
        cron name: 'sendRemindEmail', cronExpression: "0 15 10 ? * MON,WED,FRI"
    }

    def execute() {
        def rentBooks = rentBookService.list()
        def today = new Date()
        rentBooks.each {
            rentBook ->
             if(!rentBook.isReturn && rentBook.returnBeforeDate - 3 <= today){
                 print(rentBook.getReaderCard().email)
                 mailService.sendMail{
                     async true
                     to rentBook.getReaderCard().email
                     subject 'Remind to return book'
                     html '<p>Hello ' + rentBook.getReaderCard().readerNames + ',</p> <p>we remind you that you have to return the book <span style="color:#ff0000; font-weight: bold">' + rentBook.getBookItem().getBook().title + '</span> to date <span style="color:#ff0000; font-weight: bold">' + rentBook.returnBeforeDate + '</span>.</p> <p>Best regards,</p> <p> Library</p>'
                 }
             }
        }
        print("Job is run")
    }
}
