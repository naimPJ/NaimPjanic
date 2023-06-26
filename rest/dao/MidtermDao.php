<?php
require_once "BaseDao.php";

class MidtermDao extends BaseDao {

    public function __construct(){
        parent::__construct();
    }

    /** TODO
    * Implement DAO method used add new investor to investor table and cap-table
    */
    public function investor(){

    }

    /** TODO
    * Implement DAO method to validate email format and check if email exists
    */
    public function investor_email($email){

    }

    /** TODO
    * Implement DAO method to return list of investors according to instruction in MidtermRoutes.php
    */
    public function investors($share_class_id){
       

        $stmt = $this->conn->prepare("select description, equity_main_currency, price, authorized_assets, first_name, last_name, email, company, diluted_shares as total_diluted_assets
        from share_classes sc
        join cap_table ct on sc.id = ct.share_class_id
        join investors i on i.id = ct.investor_id
        where share_class_id = :id
        ");
        $stmt->bindParam(':id', $share_class_id);
        $stmt->execute();

        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;


    }

}
?>
