
class OrderNotifier < ActionMailer::Base
  default from: 'Flower Smith <willsmith12289@gmail.com>'
  def received(order)
    @order = order

    mail to: order.email, cc: "wsmi1289@gmail.com", subject: 'Flower Orders'
  end
end
