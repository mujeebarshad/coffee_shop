module OrdersHelper
	def calculate_amount items
		discounted_sum = 0
		total_sum = 0
		items.map do |item|
			total_sum += item.price
			discounted_sum += (item.price * item.discount) / 100
		end
		[discounted_sum, total_sum]
	end
end