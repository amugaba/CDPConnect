<?php

/**
 * 
 * Enter your MySQL database connection info below.
 * Username and password are for the user account your created with privileges
 * to edit the database
 * Server is the MySQL server location.
 * Databasename is the name of the schema you created.
 * Port is the port used to connect to the MySQL database.
 * @author tiddd
 *
 */

class ConnectionManager
{
	//Connection info
    public $username = "root";
    public $password = "asdf2423";
    public $server = "127.0.0.1";
    public $databasename = "cdpconnect_ny";
    public $port = "3306";
    
    //Tables
    public $dci_tbl = "dci_tbl";
	public $gpra_tbl = "gpra_tbl";
	public $assessment_tbl = "assessment_tbl";
	
	//Assessment Type Codes
	public $DCI = 0;
	public $GPRA = 1;
	
	//DCI Subtype Codes
	public $INTAKE_GENERAL = 1;
	public $INTAKE_SBIRT_NEG = 2;
	public $INTAKE_SBIRT_BI = 3;
	public $INTAKE_SBIRT_RT = 4;
	public $FOLLOWUP = 5;
	public $FOLLOWUP_SBIRT_BI = 6;
	public $DISCHARGE = 7;
	public $DISCHARGE_NO_INTERVIEW = 8;
}