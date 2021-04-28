#! /bin/bash

echo "Welcome to RVCE BOOK RENTAL APPLICATION"
echo "#######################################"

COST_PER_DAY=30
read -p "How many days was book rented : " DAYS_RENTED
read -p "What day book rented : " DAY_RENTED

H=$(date +%H)
if [ $H -ge 21 ]; then
   # charge extra money 
   let DAYS_RENTED++
fi
if [ $DAY_RENTED = "sunday" ]; then
    COST=$(echo "$DAYS_RENTED * $COST_PER_DAY * 0.5" | bc)
elif [ $DAY_RENTED = "saturday" ]; then
    COST=$(echo "$DAYS_RENTED * $COST_PER_DAY * 0.7" | bc)
else
    COST=$(echo "$DAYS_RENTED * $COST_PER_DAY" | bc)
fi    

echo "The cost of book rental is : Rs. $COST"

ORIGINAL_COST=$[ DAY_RENTED * $COST_PER_DAY ] 
DISCOUNTF=$(echo "$ORIGINAL_COST - $COST" | bc)
DISCOUNTI=$(echo "$DISCOUNTF" | cut -d "." -f1)

if [ $DISCOUNTI -gt 0 ]; then
    echo "Hello, you got Rs $DISCOUNTF discount , Enjoy..."
fi
echo "Thank you please visit again ..." 
