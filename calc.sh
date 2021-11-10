#!/bin/bash

# Function to clear screen and display menu
displayMenu()
{
  # Clears screen
  clear;

  # Echos the menu
  echo -e "WELCOME TO MY NOT SO ADVANCED CALCULATOR! \n
******************************* 
*            Menu             * 
*******************************
* 1. Add                      * 
* 2. Sub                      * 
* 3. Mult                     * 
* 4. Div                      * 
* 0. Exit                     * 
*******************************";
}

# Function to intrepret the input and choice of user
interpretInput() {
  # Take user Input
  echo "Enter Two numbers : ";

  # Store in array called args
  args=()

  # Loop numbers
  for ((i=0; i<2; i++))
  do
    # Make sure user inputs number
    while [ true ]
    do
      # Give hand to user for data entry
      num=$(($i+1))
      read -p "Enter number ${num}: " input;

      # Analyzes entry if number
      if ! [[ "$input" =~ ^[0-9]+$ ]] ; 
      then 
        # IsNaN
        echo -e "Error: Not a number. \n";

      else
        # IsNumb
        args[i]=$input;
        break;
      fi
    done
  done

  # Interpret choice and numbers
  case $choice in
    "1" )
      # add
      add args[0] args[1]
      ;;
    "2" )
      # sub
      sub args[0] args[1]
      ;;
    "3" )
      # mult
      mult args[0] args[1]
      ;;
    "4" )
      # div
      div args[0] args[1]
      ;;
    
    *)
      # Developer conception error!
      echo "Error: Contact Support.";
      ;;
  esac
}

# Add function
add()
{
  echo "Result: $(($1)) + $(($2)): $(($1+$2))";
}

# Sub function
sub()
{
  echo "Result: $(($1)) - $(($2)): $(($1-$2))";
}

# Mult function
mult()
{
  echo "Result: $(($1)) * $(($2)): $(($1*$2))";
}

# Div function
div()
{
  # Check division rule
  ## If denom is 0 then throw error;s
  if [ "$(($2))" -eq "0" ]; then
    echo "Division by 0 is not allowed!";
  else
    # Show result if rule applied
    echo "Result: $(($1)) / $(($2)): $(($1/$2))";
  fi
}

# Loops infinitlt until exit
while [ true ]
do
  # Clears and shows menu
  displayMenu;

  # Reads user choice from screen
  read -p "Enter an option (use menu numbers only): " choice;

  # Asserts user choice and analyzes entry
  case $choice in
    "0" ) # IF 0
      # Displays messages and exits the process
      echo -e "\n\nSee you later! Bye for now..\n";
      exit 0;
      ;;

    "1" | "2" | "3" | "4" ) # IF 1 OR 2 OR 3 OR 4
      # Sends choice to analyzing function.
      interpretInput $choice;
      ;;
    
    *) # IF ANYTHING ELSE
      # Displays error message
      echo "Error: Unknown response, enter a number 1-4 or type '0' to Exit";
      ;;
  esac

  # Waits for continued procedure
  echo -e "\n\nPress ENTER to continue...";
  read;

  ## THEN LOOPS AGAIN
done