#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
#list of services #) service
SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

SERVICE_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWhich service would you like?\n"

  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  #if not service show again
  if [[ ! $SERVICE_ID_SELECTED =~ [1-3] ]]
  then
    SERVICE_MENU "Not a valid service id."
  else

  SERVICE_REQUEST
  #prompt service_id, phone# -> name, time
  #if =! phone# add cust, num
  fi
}

SERVICE_REQUEST() {
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nEnter name:"
    read CUSTOMER_NAME
    INS_CUST_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\nPreferred appt time:"
  read SERVICE_TIME
  REQ_SER=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo $REQ_SER
  REQ_SER_FORM=$(echo $REQ_SER | sed 's/ //')
  echo $REQ_SER_FORM
  INS_APPT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $REQ_SER_FORM at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/ //')."
}

SERVICE_MENU

