module BilanciosHelper
	def label_avanzo_or_disavanzo number
		if number < Money.new(0)
			"disavanzo"
		else
			"avanzo"
		end
	end
end