module PaymentHelper
  def sub_total
    sub = 0

    cart.each do |dog|
      sub += dog["price"].to_d
    end

    sub
  end

  def gst_charged
    sub_total * current_user.province.gst
  end

  def pst_charged
    sub_total * current_user.province.pst
  end

  def hst_charged
    current_user.province.hst? ? current_user.province.hst * sub_total : 0

  end

  def total
    sub_total + gst_charged + pst_charged + hst_charged
  end
end
