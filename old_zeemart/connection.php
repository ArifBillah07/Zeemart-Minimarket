<?php 
class connection{
	private $host="localhost";
	private $user="root";
	private $pass="";
	private $db="db_zeemart";
	protected $connection;
	public function __construct(){
		try{
			$this->connection = new PDO("mysql:host=$this->host; dbname=$this->db",$this->user, $this->pass);
			$this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		}catch(PDOException $e){
			echo $e->getMessage();
		}
		return $this->connection;
	}
}
?>