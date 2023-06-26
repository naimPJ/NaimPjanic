<?php

Flight::route('GET /midterm/connection-check', function(){
    /** TODO
    * This endpoint prints the message from constructor within MidtermDao class
    * Goal is to check whether connection is successfully established or not
    * This endpoint does not have to return output in JSON format
    * Sample output is given in figure 2
    */
    Flight::midtermService();
});

Flight::route('POST /midterm/investor', function(){
    /** TODO
    * This endpoint is used to add new record to investors and cap-table database tables.
    * Investor contains: first_name, last_name, email and company
    * Cap table fields are share_class_id, share_class_category_id, investor_id and diluted_shares
    * RULE 1: Sum of diluted shares of all investors within given class cannot be higher than authorized assets field
    * for share class given in share_classes table
    * Example: If share_class_id = 1, sum of diluted_shares = 310 and authorized_assets for this share_class = 500
    * It means that investor added to cap table with share_class_id = 1 cannot have more than 190 diluted_shares
    * RULE 2: Email address has to be unique, meaning that two investors cannot have same email address
    * If added successfully output should be the message that investor has been created successfully
    * If error detected appropriate error message should be given as output
    * This endpoint should return output in JSON format
    * Sample output is given in figure 2 (message should be updated according to the result)
    */
});


Flight::route('GET /midterm/investor_email/@email', function($email){
    /** TODO
    * This endpoint is used to check if investor email is in valid format
    * and if it exists in investors table
    * If format is not valid, output should be 'Invalid email format' message
    * If format is valid, return either
    * 'Investor first_name last_name' uses this email address' (replace first_name and last_name with data from database)
    * or 'Investor with this email does not exists in database'
    * Output example is given in figure 2 (message should be updated according to the result)
    * This endpoint should return output in JSON format
    */
});

Flight::route("GET /midterm/investor/@share_class_id", function($share_class_id){
    /** TODO
    * This endpoint is used to list all investors from give share_class
    * (meaning all investors occuring in cap table with given share_class_id)
    * It should return share class description, equiy main currency, price and authorized_assets,
    * investor first and last name, email, company and total diluted assets within cap table
    * Sample data within tables and expected output with given data is provided in figures 3, 4, 5 and 6
    * Output is given in figure 6
    * This endpoint should return output in JSON format
    */
    Flight::json(Flight::midtermService()->investors($share_class_id));
});

?>
