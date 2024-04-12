module PaymentHelper
  def sub_total
    sub = 0

    cart.each do |dog|
      sub += dog["price"].to_d
    end

    sub
  end

  def gst_charged
    sub_total * 0.05
  end

  def pst_charged
    sub_total * 0.07
  end

  def total
    sub_total + gst_charged + pst_charged
  end
end
