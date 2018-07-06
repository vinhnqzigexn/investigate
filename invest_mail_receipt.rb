bill_config.mail_recipient_options
  { extra_recipients:   extra_recipients, 
    except_recipients: except_recipients }


    ScheduleMail.bill_verification(today = Date.today, options = {})
          MailRecipient.recipients_of(company, bill.bill_config.mail_recipient_options).each do |recipient|
            CompanyMailer.bill_verification(recipient, bill, subject).deliver
          end


    def CompanyMailer.bill_verification(recipient, bill, subject = nil)
      @recipient = recipient
      @bill = bill
      # 新形式
      pdf = @bill.to_pdf
  
      attachments["#{@bill.bill_number}.pdf"] = {
        :mime_type => 'application/pdf',
        :content => pdf
      }
      mail(:subject => subject, :to => @recipient.to)
    end



