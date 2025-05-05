class Cart
  def initialize(user_id)
    @user_id = user_id
    @redis = Redis.new
  end

  def add_item(item_id, quantity = 1)
    @redis.hincrby(cart_key, item_id, quantity)
  end

  def remove_item(item_id)
    @redis.hdel(cart_key, item_id)
  end

  def items
    @redis.hgetall(cart_key)
  end

  def clear
    @redis.del(cart_key)
  end

  private

  def cart_key
    "cart:#{@user_id}"
  end
end
