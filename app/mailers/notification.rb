class Notification < ActionMailer::Base
  default from: "no-reply@zaqueu.com"

  def notify(collection)
    @collection = collection

    mail to: @collection.email, subject: "Lembrete de Cobrança"
  end

  def close_notify(collection)
    @collection = collection

    mail to: @collection.user.email, subject: "Encerramento de Cobrança"
  end
end
