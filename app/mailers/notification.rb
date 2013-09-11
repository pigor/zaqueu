class Notification < ActionMailer::Base
  default from: "no-reply@zaqueu.com"

  def notify(collection)
    @collection = collection

    mail to: @collection.user.email, subject: "Lembrete de Cobrança"
  end
end
