library(magrittr)
data("mtcars")

# Add row names as a column called 'car_name' at the first index position
mtcars$car_name <- rownames(mtcars)
# Remove the row names
rownames(mtcars) <- NULL 

# Create a complementary dataset with manufacturer and price
mtcars_details <- data.frame(
    car_name = c("Mazda RX4", "Mazda RX4 Wag", "Datsun 710", "Hornet 4 Drive",
                 "Hornet Sportabout", "Valiant", "Merc 240D", "Toyota Corolla", 
                 "Camaro Z28", "Ford Pantera L", "Ferrari Dino", "Chrysler Imperial"),
    manufacturer = c("Mazda", "Mazda", "Nissan", "AMC", "AMC", "Chrysler", "Mercedes",
                     "Toyota", "Chevrolet", "Ford", "Ferrari", "Chrysler"),
    price = c(3000, 3200, 2400, 2800, 3500, 2600, 4500, 2200, 5000, 5500, 6000, 4800)
)

# Create a complementary dataset with years
mtcars_years <- data.frame(
    car_name = c("Mazda RX4", "Mazda RX4 Wag", "Datsun 710", "Hornet 4 Drive",
                 "Hornet Sportabout", "Valiant", "Duster 360", "Merc 240D",
                 "Merc 230", "Merc 280", "Merc 280C", "Merc 450SE",
                 "Merc 450SL", "Merc 450SLC", "Cadillac Fleetwood", "Lincoln Continental",
                 "Chrysler Imperial", "Fiat 128", "Honda Civic", "Toyota Corolla",
                 "Toyota Corona", "Dodge Challenger", "AMC Javelin", "Camaro Z28",
                 "Pontiac Firebird", "Fiat X1-9", "Porsche 914-2", "Lotus Europa",
                 "Ford Pantera L", "Ferrari Dino", "Maserati Bora", "Volvo 142E"),
    year = c(1974, 1974, 1973, 1973, 1972, 1971, 1970, 1974, 
             1974, 1973, 1973, 1974, 1974, 1974, 1973, 1974, 
             1974, 1972, 1973, 1974, 1973, 1971, 1972, 1974, 
             1974, 1974, 1972, 1972, 1971, 1973, 1974, 1972)
)

# Create a complementary dataset with some matching and non-matching car names
mtcars_specs <- data.frame(
    car_name = c("Mazda RX4", "Mazda RX4 Wag", "Datsun 710", "Hornet 4 Drive",
                 "Hornet Sportabout", "Toyota Corolla", "Ferrari Dino", "Ford Pantera L", 
                 "Tesla Model S", "Rivian R1T", "Chevrolet Bolt", "Nissan Leaf", "Honda Accord",
                 "Ford Mustang", "Toyota Prius", "BMW i3", "Volvo 142E", "Maserati Bora"),
    drivetrain = c( "RWD", "RWD", "FWD", "RWD","RWD", "FWD", "RWD", "RWD", "AWD",
                    "AWD", "FWD", "FWD", "FWD", "RWD", "FWD", "RWD", "RWD", "RWD"),
    fuel_type = c("Gasoline", "Gasoline", "Gasoline", "Gasoline","Gasoline", "Gasoline", 
                  "Gasoline", "Gasoline",   "Electric", "Electric", "Electric", "Electric",
                  "Gasoline", "Gasoline", "Hybrid", "Electric", "Gasoline", "Gasoline")
)



# Join all the mtcars data into one full dataset
mtcars_full <- mtcars_1 %>% 
    left_join(mtcars_years, by = "car_name") %>% 
    left_join(mtcars_specs, by = "car_name")



# group by year of manufacturing 
by_years <- mtcars_full %>% 
    group_by(year)

# summarise the average price by manufacturer
avgprice_by_manufacturer <- mtcars_full %>% 
    group_by(manufacturer) %>% 
    summarise(avg_price = mean(price, na.rm = TRUE))
    
