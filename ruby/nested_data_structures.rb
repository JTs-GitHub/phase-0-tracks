
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