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
    public $databasename = "cdpconnect_test";
    public $port = "3306";
    
    //Tables
    public $dci_tbl = "gpra_tbl";
	public $prescreen_tbl = "prescreen_tbl";
	public $audit_tbl = "audit_tbl";
	public $dast10_tbl = "dast10_tbl";
	public $phq9_tbl = "phq9_tbl";
	public $assessment_tbl = "assessment_tbl";
	
	//Assessment Type Codes
	public $DCI = 0;
	public $PRESCREEN = 1;
	public $AUDIT = 2;
	public $DAST10 = 3;
	public $PHQ9 = 4;
	
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