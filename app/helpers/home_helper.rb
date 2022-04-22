module HomeHelper
  
  def ticker(id)
    a = StockBuy.find(id)
    return a.ticker
  end

  def price(id)
    a = StockBuy.find(id)
    return a.last_price
  end

  def total_user
    user = User.all.where(admin:false)
    return user.count
  end

end
