# Prerequisites

Before you begin, you will need to have the following tools installed on your computer:

   * Ruby 3.1.3 or later
   * Rails 7.0.4 or later
   * Git
   
   # Installation
 
 Follow these steps to install the application on your local machine:
 
 Clone the repository:
 
     git clone https://github.com/Monorall/food_order_service.git
     
Navigate to the application directory:
 
     cd food_order_service
     
Install the required gems:
     
     bundle install
     
install the database with the command:

     rails db:create

Run the migration:

     rails db:migrate
     
Load the data from the dishes.yml and ingredients.yml files with the command:
   
     rails db:seed
    
# Used

Аfter doing all the manipulations, you can use the application at the link http://127.0.0.1:3000. Select the ingredients that you do not like and the order of dishes that do not contain these ingredients will go to the kitchen. To see what came to the kitchen, follow the link http://127.0.0.1:3000/orders/kitchen_json there will be a json with the number of dishes to cook.

You can also add your dishes and ingredients to the database, after entering, run the command:

    rails db:reset
