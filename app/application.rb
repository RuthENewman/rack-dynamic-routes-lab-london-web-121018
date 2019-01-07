class Application

  @@items = [Item.new("Chocolates", 8.99), Item.new("Book", 12.99), Item.new("Magnet", 2.50)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item =@@items.find{|i| i.name == item_name}
        resp.write "The price of #{item_name}is #{item.price}"
      else
        resp.status = 400
        resp.write "Item not found"
      end
  else
    resp.status = 404
    resp.write "Route not found"
  end
    resp.finish
  end

end
