<?php
    include('GpraService.php');
    $o = new GpraService();
    $data = array("EthnicOtherSpec"=>-1, "ParaphenaliaUsedOthers"=>-1, "ImpactStress"=>1, "RaceAmericanIndian"=>0, "Anxiety"=>0, "NonPrescGhbRoute"=>1, "OtherTranquilizersRoute"=>1, 
    "BirthMonth"=>1, "OpiatesMorphineRoute"=>1, "RaceAlaskaNative"=>0, "ParoleProbation"=>0, "ImpactEmotional"=>1, "InpatientAlcoholSA"=>0, "OutpatientAlcoholSATimes"=>-1, "ERMental"=>0, 
    "NonPresMethadoneRoute"=>1, "AwaitTrial"=>0, "AttendOtherOrg"=>0, "FamilyActiveDuty"=>1, "OpiatesDiluadidDays"=>0, "InjectedDrugs"=>0, "ArrestedConfineDays"=>0, "DAUseBothDays"=>-1, 
    "OtherIllegalDrugsRoute"=>1, "OpiatesHeroinDays"=>0, "InhalantsDays"=>0, "InpatientMentalNights"=>-1, "InhalantsRoute"=>1, "SexUnprot"=>-1, "ChildrenCustody"=>-1, "Depression"=>0, 
    "SexUnprotHigh"=>-1, "EducationYears"=>0, "MarijuanaHashRoute"=>1, "CocaineCrackDays"=>0, "KetamineRoute"=>1, "IncomeOther"=>0, "EmployStatus"=>1, "OtherTranquilizersDays"=>0, 
    "OpiatesCodeineRoute"=>1, "AnyViolence"=>0, "PersianGulf"=>-1, "RaceNativeHawaiian"=>0, "OutpatientAlcoholSA"=>0, "MethamRoute"=>1, "BenzodiazepinesDays"=>0, "DarmhaID"=>"ok", 
    "TrainingProgramSpec"=>-1, "AttendReligiousTimes"=>-1, "OpiatesMorphineDays"=>0, "OutpatientPhysicalTimes"=>-1, "OutpatientMental"=>0, "InteractFamilyFriends"=>0, "MilitaryServed"=>0, 
    "OpiatesDemerolDays"=>0, "DAUseAlcoholDays"=>0, "fHIVTestResult"=>-1, "CooccurringScreenStatus"=>0, "ClientID"=>"asdf3", "WhomInTrouble"=>1, "SexActivity"=>0, "IncomeFamFriends"=>0, 
    "IncomeNonLegal"=>0, "VietnamSoutheastAsia"=>-1, "AttendVoluntary"=>0, "InpatientPhysical"=>0, "InpatientMental"=>0, "LivingHoused"=>-1, "InactFlag"=>0, "PhysicallyHurt"=>0, "ERPhysical"=>0, 
    "SexContacts"=>-1, "EthnicDominican"=>-1, "OutpatientMentalTimes"=>-1, "DAUseIllegDrugsDays"=>0, "KetamineDays"=>0, "EthnicMexican"=>-1, "OpiatesTylenolRoute"=>1, "Korea"=>-1, 
    "OpiatesHeroinRoute"=>1, "Pregnant"=>-1, "AttendOtherOrgTimes"=>-1, "FFY"=>2013, "BirthYear"=>1955, "ImpactActivity"=>1, "ChildrenCustodyLost"=>-1, "GenderOtherSpecify"=>-1, 
    "ArrestedDays"=>0, "GrantInactFlag"=>0, "WhomInTroubleSpec"=>-1, "GrantNo"=>"asdf1234", "EthnicCentralAmerican"=>-1, "ChildrenCustodyNr"=>-1, "EthnicPuertoRican"=>-1, 
    "InpatientAlcoholSANights"=>-1, "NonPresMethadoneDays"=>0, "NeverDeployed"=>-1, "OpiatesTylenolDays"=>0, "Suicide"=>0, "IncomeOtherSpec"=>-1, "OpiatesOxycoDays"=>0, "Month"=>5, 
    "NonPrescGhbDays"=>0, "IncomeRetirement"=>0, "InterviewSeqNum"=>1, "LivingHousedSpec"=>-1, "OpiatesDarvonRoute"=>1, "OpiatesPercocetDays"=>0, "OtherIllegalDrugsSpec"=>-1, 
    "ConductedInterview"=>-1, "GenderCode"=>1, "TrainingProgram"=>1, "HealthStatus"=>1, "InpatientPhysicalNights"=>-1, "CooccurringScreen"=>1, "EthnicOther"=>-1, "OpiatesDiluadidRoute"=>1, 
    "ERMentalTimes"=>-1, "PsycholEmotMedication"=>0, "DAUseAlcoholIntox5Days"=>-1, "OpiatesCodeineDays"=>0, "NrCrimes"=>0, "Nightmares"=>-1, "BrainFunction"=>0, "RaceBlack"=>0, 
    "SexUnprotInjDrugUser"=>-1, "OpiatesDemerolRoute"=>1, "OtherIllegalDrugsDays"=>0, "RaceAsian"=>0, "OpiatesOxycoRoute"=>1, "InterviewDate"=>"05/31/2013", "HallucPsychRoute"=>1, 
    "OpiatesDarvonDays"=>0, "BenzodiazepinesRoute"=>1, "RaceWhite"=>0, "ConstantGuard"=>-1, "fHIVTest"=>0, "PsycholEmotImpact"=>1, "ClientType"=>5, "ViolentBehavior"=>0, "CocaineCrackRoute"=>1, 
    "MarijuanaHashDays"=>0, "AttendReligious"=>0, "Age"=>58, "EthnicCuban"=>-1, "EmployStatusSpec"=>-1, "Hallucinations"=>0, "Employment"=>1, "NumbAndDetach"=>-1, "TriedHard"=>-1, 
    "SexUnprotHIVAids"=>-1, "ArrestedDrugDays"=>0, "ActiveDuty"=>-1, "WWII"=>-1, "ChildrenNr"=>-1, "BarbituatesDays"=>0, "AttendVoluntaryTimes"=>-1, "Quarter"=>3, "IncomePubAssist"=>0, 
    "OpiatesPercocetRoute"=>1, "IncomeWages"=>0, "EthnicSouthAmerican"=>-1, "OutpatientPhysical"=>0, "ERAlcoholSA"=>0, "Children"=>0, "BarbituatesRoute"=>1, "AgeGroup"=>6, "IncomeDisability"=>0, 
    "InterviewTypeCode"=>1, "HallucPsychDays"=>0, "IraqAfghanistan"=>-1, "HispanicLatino"=>0, "ERPhysicalTimes"=>-1, "LivingWhere"=>1, "DAUseAlcoholIntox4Days"=>-1, "MethamDays"=>0, 
    "ERAlcoholSATimes"=>-1);
    $gpra = new GpraVO();
    $gpra->data = $data;
    $gpra->status = 0;
    $res = $o->saveGpra($gpra);
    //$res = $o->getGpraByID("asdf");
    var_dump($res);
?> 
