package library.items

class SendRemindEmailJob {

    UserService userService
    EmailSenderController emailSender
    RentBookService rentBookService
    static triggers = {
      simple repeatInterval: 10000l // execute job once in 5 seconds
//        cron name: 'sendRemindEmail', cronExpression: "0 0 6 * * ?"
    }

    def execute() {
        def rentBooks = rentBookService.list()
        def today = new Date()
//        def readerCard
//        def userEmail
        rentBooks.each {
            rentBook ->
             if(!rentBook.isReturn && rentBook.returnBeforeDate - 3 <= today){
                 print(rentBook.getReaderCard().email)
//                 emailSender.send().params = [
//                     email:rentBook.getReaderCard().email,
//                     name: rentBook.getReaderCard().readerNames,
//                     book: rentBook.getBookItem().getBook().title,
//                     returnBeforeDate: rentBook.returnBeforeDate
//                 ]
//                 redirect(controller: "emailSender", action: "send",
//                         params: [email:rentBook.getReaderCard().email,
//                                 name:rentBook.getReaderCard().readerNames,
//                                 book:rentBook.getBookItem().getBook().title,
//                                returnBeforeDate:rentBook.returnBeforeDate]
//                 )
                 sendMail {
                     async true
                     to rentBook.getReaderCard().email
                     subject 'Remind to return book'
                     html '<p>Hello ' + rentBook.getReaderCard().readerNames + ',</p> <p>we remind you that you have to return the book <span style="color:#ff0000; font-weight: bold">' + rentBook.getBookItem().getBook().title + '</span> to date <span style="color:#ff0000; font-weight: bold">' + rentBook.returnBeforeDate + '</span>.</p> <p>Best regards,</p> <p> Library</p>'
                 }
//                 respond([message: 'Message sent at ' + new Date()], formats: ['json'])
             }
        }
        print("Job is run")
        // execute job
    }
}
