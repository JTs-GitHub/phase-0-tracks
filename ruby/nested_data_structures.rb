
tot_year_exp = {
    annual: {
        taxes: {
            city_taxes:  ".5",
            state_taxes: "4",
            fed_taxes:  {
                fica:  "7.5",
                soc_sec:  "3",
                unemploy_ins: ".2",
                medicare: "15"
            }
        }
    },
    bi_annual: {
        mortgage_ins: "10,000",
        auto_ins:  "500"
    },
    monthly: {
        utilities: {
          gas:  "300" ,
          elec:  "200" ,
          garb:  "75" ,
          cable_TV: "100"
        }
    },
    daily: {
        "starbuck" => 5,
        "lunch" => 10,
        "groceries" =>  35
    },
    misc_other: [
        "newspaper for train ride" ,
        "dine out with spouse" ,
        "phone data overage",
        "family vacation",
        "car repairs",
        "charity donations",
        {
          breakfast:  7,
          lunch: 10,
          dinner: 14,
          "snacks" => 9
        }
    ] 
}

#puts tot_year_exp[:misc_other][-1]
#puts tot_year_exp.keys

#tot_year_exp[:misc_other].each do |label|
#  puts label
#end


puts "medicare is currently set as #{tot_year_exp[:annual][:taxes][:fed_taxes][:medicare]} %"
if tot_year_exp[:annual][:taxes][:fed_taxes][:medicare] = "15"
  tot_year_exp[:annual][:taxes][:fed_taxes][:medicare] = "1.5"            #change hash value of medicare from 15 to 1.5
end
puts "medicare is currently set as #{tot_year_exp[:annual][:taxes][:fed_taxes][:medicare]} %"       #check new value

puts tot_year_exp[:misc_other][-1][:dinner]          #list out value for dinner symbol.
puts tot_year_exp[:misc_other][-1]                   # access array, list its items, including the hash in the array.

