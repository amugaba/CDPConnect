<?php
include_once 'GpraService.php';

$o = new GpraService();
$gpra = $o->getGpraObjByID(9);

//translate db values to correct SAIS codes
$d = explode("/", $gpra->InterviewDate);
if(strlen($d[0]) == 1)
	$d[0] = "0".$d[0];
if(strlen($d[1]) == 1)
	$d[1] = "0".$d[1];
$interviewDate = $d[2]."-".$d[0]."-".$d[1];

if($gpra->DischargeDate != null)
{
	$d = explode("/", $gpra->DischargeDate);
	if(strlen($d[0]) == 1)
		$d[0] = "0".$d[0];
	if(strlen($d[1]) == 1)
		$d[1] = "0".$d[1];
	$dischargeDate = $d[2]."-".$d[0]."-".$d[1];
}

if($gpra->ArrestedDays < 0)
	$gpra->ArrestedDrugDays = 0;

$gpra->MilitaryServed--;
$gpra->ActiveDuty--;
$gpra->FamilyActiveDuty--;
$gpra->EducationYears--;
$gpra->PhysicallyHurt--;

if($gpra->EmployStatus == 8)
	$gpra->EmployStatus = 0;
	
if($gpra->NeverDeployed == 1)
{
	$gpra->IraqAfghanistan = 0;
	$gpra->PersianGulf = 0;
	$gpra->VietnamSoutheastAsia = 0;
	$gpra->Korea = 0;
	$gpra->WWII = 0;
	$gpra->DeployedCombatZone = 0;
}
if($gpra->NeverDeployed <= -7)
{
	$gpra->IraqAfghanistan = $gpra->NeverDeployed;
	$gpra->PersianGulf = $gpra->NeverDeployed;
	$gpra->VietnamSoutheastAsia = $gpra->NeverDeployed;
	$gpra->Korea = $gpra->NeverDeployed;
	$gpra->WWII = $gpra->NeverDeployed;
	$gpra->DeployedCombatZone = $gpra->NeverDeployed;
}

if($gpra->ImpactStress == -1)
	$gpra->ImpactStress = 5;
if($gpra->ImpactActivity == -1)
	$gpra->ImpactActivity = 5;
if($gpra->ImpactEmotional == -1)
	$gpra->ImpactEmotional = 5;

switch ($gpra->FLWPStatus)
{
	case 2: $gpra->FLWPStatus = 11;
	case 3: $gpra->FLWPStatus = 12;
	case 4: $gpra->FLWPStatus = 21;
	case 5: $gpra->FLWPStatus = 22;
	case 6: $gpra->FLWPStatus = 23;
	case 7: $gpra->FLWPStatus = 24;
	case 8: $gpra->FLWPStatus = 31;
	case 9: $gpra->FLWPStatus = 32;
}

if($gpra->CooccurringScreen == -9)
	$gpra->CooccurringScreenStatus = -9;
	
if($gpra->fHIVTest <= -7)
	$gpra->fHIVTestResult = $gpra->fHIVTest;

$d = explode("/", $gpra->DateOfBirth);
$month = $d[0];
$year = $d[2];
if(strlen($month) == 1)
	$month = "0".$month;
$birthDate = $year.$month;

if($gpraData->InterviewTypeCode > 1 && $gpraData->ConductedInterview == 0)
	$gpraData->InterviewDate = NULL;
					
$content = <<<XML
<?xml version="1.0" encoding="UTF-8"?>
<document xmlns="http://SAISEDIService.org/SAISSBIRTDocument" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://SAISEDIService.org/SAISSBIRTDocument
C:\Projects\sais\Code\EDI\Configuration\DocumentSchema\SAISSBIRTDocument.xsd">
	<ProcessControl>
		<SCHEMA_VERSION>1.0</SCHEMA_VERSION>
		<RECORD_COUNT>1</RECORD_COUNT>
	</ProcessControl>
	<Record>
		<RecordType>A</RecordType>
		<RecordSeqNo>1</RecordSeqNo>
		<GranteeSourceID>$gpra->autoid</GranteeSourceID>
		<RecordMgmt>
			<SampleParticipation>1</SampleParticipation>
			<ClientID>$gpra->SAISID</ClientID>
			<SampleCriteria>11</SampleCriteria>
			<GrantID>$gpra->GrantNo</GrantID>
			<InterviewTypeCode>$gpra->InterviewTypeCode</InterviewTypeCode>
			<ClientType>$gpra->ClientType</ClientType>
			<InterviewDate>$interviewDate</InterviewDate>
			<SBIRTClassCode>BT</SBIRTClassCode>
		</RecordMgmt>
		<SectionA>
			<CooccurringScreen>$gpra->CooccurringScreen</CooccurringScreen>
			<CooccurringScreenStatus>$gpra->CooccurringScreenStatus</CooccurringScreenStatus>
			<ClientIntakeSBIRT>
				<ClientScreen>2</ClientScreen>
				<ScoreType1>Other</ScoreType1>
				<ScoreValue1>13</ScoreValue1>
				<ScoreType2 />
				<ScoreValue2>-1</ScoreValue2>
				<ScoreType3 />
				<ScoreValue3>-1</ScoreValue3>
				<ScoreOtherSpec>ASSIST</ScoreOtherSpec>
				<ClientSBIRTCont>1</ClientSBIRTCont>
			</ClientIntakeSBIRT>
			<ServicesPlanned>
				<Modality1CaseManagement>$gpra->SvcCaseManagement</Modality1CaseManagement>
				<Modality2DayTreatment>$gpra->SvcDayTreatment</Modality2DayTreatment>
				<Modality3InpatientHospital>$gpra->SvcInpatient</Modality3InpatientHospital>
				<Modality4Outpatient>$gpra->SvcOutpatient</Modality4Outpatient>
				<Modality5Outreach>$gpra->SvcOutreach</Modality5Outreach>
				<Modality6IntensiveOutpatient>$gpra->SvcIntensiveOutpatient</Modality6IntensiveOutpatient>
				<Modality7Methadone>$gpra->SvcMethadone</Modality7Methadone>
				<Modality8ResidentialRehabilitation>$gpra->SvcResidentialRehab</Modality8ResidentialRehabilitation>
				<ModalityDetoxification9AHospital>$gpra->SvcHospitalInpatient</ModalityDetoxification9AHospital>
				<ModalityDetoxification9BFree>$gpra->SvcFreeStandingRes</ModalityDetoxification9BFree>
				<ModalityDetoxification9CAmbulatory>$gpra->SvcAmbulatoryDetox</ModalityDetoxification9CAmbulatory>
				<Modality10AfterCare>$gpra->SvcAfterCare</Modality10AfterCare>
				<Modality11RecoverySupport>$gpra->SvcRecoverySupport</Modality11RecoverySupport>
				<Modality12Other>$gpra->SvcOtherModalities</Modality12Other>
				<Modality12OtherSpec>$gpra->SvcOtherModalitiesSpec</Modality12OtherSpec>
				<Treatment1Screening>$gpra->SvcScreening</Treatment1Screening>
				<Treatment2BriefIntervention>$gpra->SvcBriefIntervention</Treatment2BriefIntervention>
				<Treatment3BriefTreatment>$gpra->SvcBriefTreatment</Treatment3BriefTreatment>
				<Treatment4ReferralToTreatment>$gpra->SvcReferralTreatment</Treatment4ReferralToTreatment>
				<Treatment5Assessment>$gpra->SvcAssessment</Treatment5Assessment>
				<Treatment6RecoveryPlanning>$gpra->SvcTreatmentPlanning</Treatment6RecoveryPlanning>
				<Treatment7IndividualCounseling>$gpra->SvcIndividualCouns</Treatment7IndividualCounseling>
				<Treatment8GroupCounseling>$gpra->SvcGroupCouns</Treatment8GroupCounseling>
				<Treatment9FamilyCounseling>$gpra->SvcFamilyMarriageCouns</Treatment9FamilyCounseling>
				<Treatment10CoOccurringTreatment>$gpra->SvcCoOccurring</Treatment10CoOccurringTreatment>
				<Treatment11PharmacologicalInterventions>$gpra->SvcPharmacological</Treatment11PharmacologicalInterventions>
				<Treatment12AIDSCounseling>$gpra->SvcHIVAIDSCouns</Treatment12AIDSCounseling>
				<Treatment13Other>$gpra->SvcOtherClinicalCouns</Treatment13Other>
				<Treatment13OtherSpec>$gpra->SvcOtherClinicalCounsSpec</Treatment13OtherSpec>
				<CaseManagement1FamilyServices>$gpra->SvcFamilyServices</CaseManagement1FamilyServices>
				<CaseManagement2ChildCare>$gpra->SvcChildCare</CaseManagement2ChildCare>
				<CaseManagement3APreEmployment>$gpra->SvcPreEmployment</CaseManagement3APreEmployment>
				<CaseManagement3BEmploymentCoaching>$gpra->SvcEmploymentCoaching</CaseManagement3BEmploymentCoaching>
				<CaseManagement4IndividualCoordination>$gpra->SvcIndividualCoord</CaseManagement4IndividualCoordination>
				<CaseManagement5Transportation>$gpra->SvcTransportation</CaseManagement5Transportation>
				<CaseManagement6AIDSService>$gpra->SvcHIVAIDSServices</CaseManagement6AIDSService>
				<CaseManagement7SupportiveTransitional>$gpra->SvcDrugFreeHousing</CaseManagement7SupportiveTransitional>
				<CaseManagement8Other>$gpra->SvcOtherCaseMgmt</CaseManagement8Other>
				<CaseManagement8OtherSpec>$gpra->SvcOtherCaseMgmtSpec</CaseManagement8OtherSpec>
				<Medical1Care>$gpra->SvcMedicalCare</Medical1Care>
				<Medical2AlcoholDrugTesting>$gpra->SvcAlcoholDrugTesting</Medical2AlcoholDrugTesting>
				<Medical3AIDSMedicalSupport>$gpra->SvcHIVAIDSMedical</Medical3AIDSMedicalSupport>
				<Medical4Other>$gpra->SvcOtherMedical</Medical4Other>
				<Medical4OtherSpec>$gpra->SvcOtherMedicalSpec</Medical4OtherSpec>
				<AfterCare1ContinuingCare>$gpra->SvcContinuingCare</AfterCare1ContinuingCare>
				<AfterCare2RelapsePrevention>$gpra->SvcRelapsePrevention</AfterCare2RelapsePrevention>
				<AfterCare3RecoveryCoaching>$gpra->SvcRecoveryCoaching</AfterCare3RecoveryCoaching>
				<AfterCare4SelfHelp>$gpra->SvcSelfHelpSupport</AfterCare4SelfHelp>
				<AfterCare5SpiritualSupport>$gpra->SvcSpiritualSupport</AfterCare5SpiritualSupport>
				<AfterCare6Other>$gpra->SvcOtherAfterCare</AfterCare6Other>
				<AfterCare6OtherSpec>$gpra->SvcOtherAfterCareSpec</AfterCare6OtherSpec>
				<Education1SubstanceAbuse>$gpra->SvcSubstanceAbuseEdu</Education1SubstanceAbuse>
				<Education2AIDSEducation>$gpra->SvcHIVAIDSEdu</Education2AIDSEducation>
				<Education3Other>$gpra->SvcOtherEdu</Education3Other>
				<Education3OtherSpec>$gpra->SvcOtherEduSpec</Education3OtherSpec>
				<PeerToPeer1Coaching>$gpra->SvcPeerCoaching</PeerToPeer1Coaching>
				<PeerToPeer2HousingSupport>$gpra->SvcHousingSupport</PeerToPeer2HousingSupport>
				<PeerToPeer3DrugFreeActivities>$gpra->SvcDrugFreeSocial</PeerToPeer3DrugFreeActivities>
				<PeerToPeer4InformationAndReferral>$gpra->SvcInformationReferral</PeerToPeer4InformationAndReferral>
				<PeerToPeer5Other>$gpra->SvcOtherRecovery</PeerToPeer5Other>
				<PeerToPeer5OtherSpec>$gpra->SvcOtherRecoverySpec</PeerToPeer5OtherSpec>
			</ServicesPlanned>
			<GenderCode>$gpra->GenderCode</GenderCode>
			<GenderOtherSpecify>$gpra->GenderOtherSpecify</GenderOtherSpecify>
			<IsHispanicLatino>$gpra->HispanicLatino</IsHispanicLatino>
			<HispanicLatino>
				<CentralAmerican>$gpra->EthnicCentralAmerican</CentralAmerican>
				<Cuban>$gpra->EthnicCuban</Cuban>
				<Dominican>$gpra->EthnicDominican</Dominican>
				<Mexican>$gpra->EthnicMexican</Mexican>
				<PuertoRican>$gpra->EthnicPuertoRican</PuertoRican>
				<SouthAmerican>$gpra->EthnicSouthAmerican</SouthAmerican>
				<Other>$gpra->EthnicOther</Other>
				<OtherSpec>$gpra->EthnicOtherSpec</OtherSpec>
			</HispanicLatino>
			<Race>
				<Black>$gpra->RaceBlack</Black>
				<Asian>$gpra->RaceAsian</Asian>
				<NativeHawaiian>$gpra->RaceNativeHawaiian</NativeHawaiian>
				<AlaskaNative>$gpra->RaceAlaskaNative</AlaskaNative>
				<White>$gpra->RaceWhite</White>
				<AmericanIndian>$gpra->RaceAmericanIndian</AmericanIndian>
			</Race>
			<BirthDate>$birthDate</BirthDate>
			<Veteran>-99</Veteran>
			<MilitaryServed>$gpra->MilitaryServed</MilitaryServed>
			<ActiveDuty>$gpra->ActiveDuty</ActiveDuty>
			<NeverDeployed>$gpra->NeverDeployed</NeverDeployed>
			<IraqAfghanistan>$gpra->IraqAfghanistan</IraqAfghanistan>
			<PersianGulf>$gpra->PersianGulf</PersianGulf>
			<VietnamSoutheastAsia>$gpra->VietnamSoutheastAsia</VietnamSoutheastAsia>
			<Korea>$gpra->Korea</Korea>
			<WWII>$gpra->WWII</WWII>
			<DeployedCombatZone>$gpra->DeployedCombatZone</DeployedCombatZone>
			<FamilyActiveDuty>$gpra->FamilyActiveDuty</FamilyActiveDuty>
			<SerMemRelationshipList>
			</SerMemRelationshipList>
		</SectionA>
		<DrugandAlcohol>
			<DAUseAlcoholDays>$gpra->DAUseAlcoholDays</DAUseAlcoholDays>
			<DAUseAlcoholIntox5Days>$gpra->DAUseAlcoholIntox5Days</DAUseAlcoholIntox5Days>
			<DAUseAlcoholIntox4Days>$gpra->DAUseAlcoholIntox4Days</DAUseAlcoholIntox4Days>
			<DAUseIllegDrugsDays>$gpra->DAUseIllegDrugsDays</DAUseIllegDrugsDays>
			<DAUseBothDays>$gpra->DAUseBothDays</DAUseBothDays>
			<CocaineCrackDays>$gpra->CocaineCrackDays</CocaineCrackDays>
			<CocaineCrackRoute>$gpra->CocaineCrackRoute</CocaineCrackRoute>
			<MarijuanaHashDays>$gpra->MarijuanaHashDays</MarijuanaHashDays>
			<MarijuanaHashRoute>$gpra->MarijuanaHashRoute</MarijuanaHashRoute>
			<OpiatesHeroinDays>$gpra->OpiatesHeroinDays</OpiatesHeroinDays>
			<OpiatesHeroinRoute>$gpra->OpiatesHeroinRoute</OpiatesHeroinRoute>
			<OpiatesMorphineDays>$gpra->OpiatesMorphineDays</OpiatesMorphineDays>
			<OpiatesMorphineRoute>$gpra->OpiatesMorphineRoute</OpiatesMorphineRoute>
			<OpiatesDiluadidDays>$gpra->OpiatesDiluadidDays</OpiatesDiluadidDays>
			<OpiatesDiluadidRoute>$gpra->OpiatesDiluadidRoute</OpiatesDiluadidRoute>
			<OpiatesDemerolDays>$gpra->OpiatesDemerolDays</OpiatesDemerolDays>
			<OpiatesDemerolRoute>$gpra->OpiatesDemerolRoute</OpiatesDemerolRoute>
			<OpiatesPercocetDays>$gpra->OpiatesPercocetDays</OpiatesPercocetDays>
			<OpiatesPercocetRoute>$gpra->OpiatesPercocetRoute</OpiatesPercocetRoute>
			<OpiatesDarvonDays>$gpra->OpiatesDarvonDays</OpiatesDarvonDays>
			<OpiatesDarvonRoute>$gpra->OpiatesDarvonRoute</OpiatesDarvonRoute>
			<OpiatesCodeineDays>$gpra->OpiatesCodeineDays</OpiatesCodeineDays>
			<OpiatesCodeineRoute>$gpra->OpiatesCodeineRoute</OpiatesCodeineRoute>
			<OpiatesTylenolDays>$gpra->OpiatesTylenolDays</OpiatesTylenolDays>
			<OpiatesTylenolRoute>$gpra->OpiatesTylenolRoute</OpiatesTylenolRoute>
			<OpiatesOxycoDays>$gpra->OpiatesOxycoDays</OpiatesOxycoDays>
			<OpiatesOxycoRoute>$gpra->OpiatesOxycoRoute</OpiatesOxycoRoute>
			<NonPresMethadoneDays>$gpra->NonPresMethadoneDays</NonPresMethadoneDays>
			<NonPresMethadoneRoute>$gpra->NonPresMethadoneRoute</NonPresMethadoneRoute>
			<HallucPsychDays>$gpra->HallucPsychDays</HallucPsychDays>
			<HallucPsychRoute>$gpra->HallucPsychRoute</HallucPsychRoute>
			<MethamDays>$gpra->MethamDays</MethamDays>
			<MethamRoute>$gpra->MethamRoute</MethamRoute>
			<BenzodiazepinesDays>$gpra->BenzodiazepinesDays</BenzodiazepinesDays>
			<BenzodiazepinesRoute>$gpra->BenzodiazepinesRoute</BenzodiazepinesRoute>
			<BarbituatesDays>$gpra->BarbituatesDays</BarbituatesDays>
			<BarbituatesRoute>$gpra->BarbituatesRoute</BarbituatesRoute>
			<NonPrescGhbDays>$gpra->NonPrescGhbDays</NonPrescGhbDays>
			<NonPrescGhbRoute>$gpra->NonPrescGhbRoute</NonPrescGhbRoute>
			<KetamineDays>$gpra->KetamineDays</KetamineDays>
			<KetamineRoute>$gpra->KetamineRoute</KetamineRoute>
			<OtherTranquilizersDays>$gpra->OtherTranquilizersDays</OtherTranquilizersDays>
			<OtherTranquilizersRoute>$gpra->OtherTranquilizersRoute</OtherTranquilizersRoute>
			<InhalantsDays>$gpra->InhalantsDays</InhalantsDays>
			<InhalantsRoute>$gpra->InhalantsRoute</InhalantsRoute>
			<OtherIllegalDrugsDays>$gpra->OtherIllegalDrugsDays</OtherIllegalDrugsDays>
			<OtherIllegalDrugsRoute>$gpra->OtherIllegalDrugsRoute</OtherIllegalDrugsRoute>
			<OtherIllegalDrugsSpec>$gpra->OtherIllegalDrugsSpec</OtherIllegalDrugsSpec>
			<InjectedDrugs>$gpra->InjectedDrugs</InjectedDrugs>
			<ParaphenaliaUsedOthers>$gpra->ParaphenaliaUsedOthers</ParaphenaliaUsedOthers>
		</DrugandAlcohol>
		<FamilyandLiving>
			<LivingWhere>$gpra->LivingWhere</LivingWhere>
			<LivingHoused>$gpra->LivingHoused</LivingHoused>
			<LivingHousedSpec>$gpra->LivingHousedSpec</LivingHousedSpec>
			<ImpactStress>$gpra->ImpactStress</ImpactStress>
			<ImpactActivity>$gpra->ImpactActivity</ImpactActivity>
			<ImpactEmotional>$gpra->ImpactEmotional</ImpactEmotional>
			<Pregnant>$gpra->Pregnant</Pregnant>
			<Children>$gpra->Children</Children>
			<ChildrenNr>$gpra->ChildrenNr</ChildrenNr>
			<ChildrenCustody>$gpra->ChildrenCustody</ChildrenCustody>
			<ChildrenCustodyNr>$gpra->ChildrenCustodyNr</ChildrenCustodyNr>
			<ChildrenCustodyLost>$gpra->ChildrenCustodyLost</ChildrenCustodyLost>
		</FamilyandLiving>
		<EducationEmploymentIncome>
			<TrainingProgram>$gpra->TrainingProgram</TrainingProgram>
			<TrainingProgramSpec>$gpra->TrainingProgramSpec</TrainingProgramSpec>
			<EducationYears>$gpra->EducationYears</EducationYears>
			<EmployStatus>$gpra->EmployStatus</EmployStatus>
			<EmployStatusSpec>$gpra->EmployStatusSpec</EmployStatusSpec>
			<IncomeWages>$gpra->IncomeWages</IncomeWages>
			<IncomePubAssist>$gpra->IncomePubAssist</IncomePubAssist>
			<IncomeRetirement>$gpra->IncomeRetirement</IncomeRetirement>
			<IncomeDisability>$gpra->IncomeDisability</IncomeDisability>
			<IncomeNonLegal>$gpra->IncomeNonLegal</IncomeNonLegal>
			<IncomeFamFriends>$gpra->IncomeFamFriends</IncomeFamFriends>
			<IncomeOther>$gpra->IncomeOther</IncomeOther>
			<IncomeOtherSpec>$gpra->IncomeOtherSpec</IncomeOtherSpec>
		</EducationEmploymentIncome>
		<CrimeandCriminalJusticeStatus>
			<ArrestedDays>$gpra->ArrestedDays</ArrestedDays>
			<ArrestedDrugDays>$gpra->ArrestedDrugDays</ArrestedDrugDays>
			<ArrestedConfineDays>$gpra->ArrestedConfineDays</ArrestedConfineDays>
			<NrCrimes>$gpra->NrCrimes</NrCrimes>
			<AwaitTrial>$gpra->AwaitTrial</AwaitTrial>
			<ParoleProbation>$gpra->ParoleProbation</ParoleProbation>
		</CrimeandCriminalJusticeStatus>
		<MentalandPhysicalHealth>
			<HealthStatus>$gpra->HealthStatus</HealthStatus>
			<InpatientPhysical>$gpra->InpatientPhysical</InpatientPhysical>
			<InpatientPhysicalNights>$gpra->InpatientPhysicalNights</InpatientPhysicalNights>
			<InpatientMental>$gpra->InpatientMental</InpatientMental>
			<InpatientMentalNights>$gpra->InpatientMentalNights</InpatientMentalNights>
			<InpatientAlcoholSA>$gpra->InpatientAlcoholSA</InpatientAlcoholSA>
			<InpatientAlcoholSANights>$gpra->InpatientAlcoholSANights</InpatientAlcoholSANights>
			<OutpatientPhysical>$gpra->OutpatientPhysical</OutpatientPhysical>
			<OutpatientPhysicalTimes>$gpra->OutpatientPhysicalTimes</OutpatientPhysicalTimes>
			<OutpatientMental>$gpra->OutpatientMental</OutpatientMental>
			<OutpatientMentalTimes>$gpra->OutpatientMentalTimes</OutpatientMentalTimes>
			<OutpatientAlcoholSA>$gpra->OutpatientAlcoholSA</OutpatientAlcoholSA>
			<OutpatientAlcoholSATimes>$gpra->OutpatientAlcoholSATimes</OutpatientAlcoholSATimes>
			<ERPhysical>$gpra->ERPhysical</ERPhysical>
			<ERPhysicalTimes>$gpra->ERPhysicalTimes</ERPhysicalTimes>
			<ERMental>$gpra->ERMental</ERMental>
			<ERMentalTimes>$gpra->ERMentalTimes</ERMentalTimes>
			<ERAlcoholSA>$gpra->ERAlcoholSA</ERAlcoholSA>
			<ERAlcoholSATimes>$gpra->ERAlcoholSATimes</ERAlcoholSATimes>
			<SexActivity>$gpra->SexActivity</SexActivity>
			<SexContacts>$gpra->SexContacts</SexContacts>
			<SexUnprot>$gpra->SexUnprot</SexUnprot>
			<SexUnprotHIVAids>$gpra->SexUnprotHIVAids</SexUnprotHIVAids>
			<SexUnprotInjDrugUser>$gpra->SexUnprotInjDrugUser</SexUnprotInjDrugUser>
			<SexUnprotHigh>$gpra->SexUnprotHigh</SexUnprotHigh>
			<HIVTest>$gpra->fHIVTest</HIVTest>
			<HIVTestResult>$gpra->fHIVTestResult</HIVTestResult>
			<Depression>$gpra->Depression</Depression>     
			<Anxiety>$gpra->Anxiety</Anxiety>     
			<Hallucinations>$gpra->Hallucinations</Hallucinations>  
			<BrainFunction>$gpra->BrainFunction</BrainFunction>    
			<ViolentBehavior>$gpra->ViolentBehavior</ViolentBehavior>    
			<Suicide>$gpra->Suicide</Suicide>   
			<PsycholEmotMedication>$gpra->PsycholEmotMedication</PsycholEmotMedication>
			<PsycholEmotImpact>$gpra->PsycholEmotImpact</PsycholEmotImpact>   
			<AnyViolence>$gpra->AnyViolence</AnyViolence>
			<Nightmares>$gpra->Nightmares</Nightmares>
			<TriedHard>$gpra->TriedHard</TriedHard>
			<ConstantGuard>$gpra->ConstantGuard</ConstantGuard>
			<NumbandDetach>$gpra->NumbAndDetach</NumbandDetach>
			<PhysicallyHurt>$gpra->PhysicallyHurt</PhysicallyHurt>
		</MentalandPhysicalHealth>
		<SocialConnectedness>
			<AttendVoluntary>$gpra->AttendVoluntary</AttendVoluntary>
			<AttendVoluntaryTimes>$gpra->AttendVoluntaryTimes</AttendVoluntaryTimes>
			<AttendReligious>$gpra->AttendReligious</AttendReligious>
			<AttendReligiousTimes>$gpra->AttendReligiousTimes</AttendReligiousTimes>
			<AttendOtherOrg>$gpra->AttendOtherOrg</AttendOtherOrg>
			<AttendOtherOrgTimes>$gpra->AttendOtherOrgTimes</AttendOtherOrgTimes>
			<InteractFamilyFriends>$gpra->InteractFamilyFriends</InteractFamilyFriends>
			<WhomInTrouble>$gpra->WhomInTrouble</WhomInTrouble>
			<WhomInTroubleSpec>$gpra->WhomInTroubleSpec</WhomInTroubleSpec>
		</SocialConnectedness>
		<FollowUpStatus>
			<FollowUpStatusCode>$gpra->FLWPStatus</FollowUpStatusCode>
			<FollowUpOtherSpecify>$gpra->FLWPStatusSpec</FollowUpOtherSpecify>
			<ReceivingServices>$gpra->ReceivingServices</ReceivingServices>
			<ConductedInterview>$gpra->ConductedInterview</ConductedInterview>
		</FollowUpStatus>
		<DischargeStatus>
			<DischargeDate>$dischargeDate</DischargeDate>
			<DischargeStatusCode>$gpra->DischargeStatusCompl</DischargeStatusCode>
			<TerminationReasonCode>$gpra->DischargeStatusTermReason</TerminationReasonCode>
			<TerminationReasonOtherSpecify>$gpra->OtherDischargeStatTermRsnSpec</TerminationReasonOtherSpecify>
			<ConductedInterview>$gpra->ConductedInterview</ConductedInterview>
			<ProgramTestHIV>$gpra->jHIVTest</ProgramTestHIV>
			<ProgramReferHIVTest>$gpra->jHIVTestResult</ProgramReferHIVTest>
		</DischargeStatus>
		<ServicesReceived>
			<Modality1CaseManagement>$gpra->SvcCaseManagement</Modality1CaseManagement>
			<Modality2DayTreatment>$gpra->SvcDayTreatment</Modality2DayTreatment>
			<Modality3InpatientHospital>$gpra->SvcInpatient</Modality3InpatientHospital>
			<Modality4Outpatient>$gpra->SvcOutpatient</Modality4Outpatient>
			<Modality5Outreach>$gpra->SvcOutreach</Modality5Outreach>
			<Modality6IntensiveOutpatient>$gpra->SvcIntensiveOutpatient</Modality6IntensiveOutpatient>
			<Modality7Methadone>$gpra->SvcMethadone</Modality7Methadone>
			<Modality8ResidentialRehabilitation>$gpra->SvcResidentialRehab</Modality8ResidentialRehabilitation>
			<ModalityDetoxification9AHospital>$gpra->SvcHospitalInpatient</ModalityDetoxification9AHospital>
			<ModalityDetoxification9BFree>$gpra->SvcFreeStandingRes</ModalityDetoxification9BFree>
			<ModalityDetoxification9CAmbulatory>$gpra->SvcAmbulatoryDetox</ModalityDetoxification9CAmbulatory>
			<Modality10AfterCare>$gpra->SvcAfterCare</Modality10AfterCare>
			<Modality11RecoverySupport>$gpra->SvcRecoverySupport</Modality11RecoverySupport>
			<Modality12Other>$gpra->SvcOtherModalities</Modality12Other>
			<Modality12OtherSpec>$gpra->SvcOtherModalitiesSpec</Modality12OtherSpec>
			<Treatment1Screening>$gpra->SvcScreening</Treatment1Screening>
			<Treatment2BriefIntervention>$gpra->SvcBriefIntervention</Treatment2BriefIntervention>
			<Treatment3BriefTreatment>$gpra->SvcBriefTreatment</Treatment3BriefTreatment>
			<Treatment4ReferralToTreatment>$gpra->SvcReferralTreatment</Treatment4ReferralToTreatment>
			<Treatment5Assessment>$gpra->SvcAssessment</Treatment5Assessment>
			<Treatment6RecoveryPlanning>$gpra->SvcTreatmentPlanning</Treatment6RecoveryPlanning>
			<Treatment7IndividualCounseling>$gpra->SvcIndividualCouns</Treatment7IndividualCounseling>
			<Treatment8GroupCounseling>$gpra->SvcGroupCouns</Treatment8GroupCounseling>
			<Treatment9FamilyCounseling>$gpra->SvcFamilyMarriageCouns</Treatment9FamilyCounseling>
			<Treatment10CoOccurringTreatment>$gpra->SvcCoOccurring</Treatment10CoOccurringTreatment>
			<Treatment11PharmacologicalInterventions>$gpra->SvcPharmacological</Treatment11PharmacologicalInterventions>
			<Treatment12AIDSCounseling>$gpra->SvcHIVAIDSCouns</Treatment12AIDSCounseling>
			<Treatment13Other>$gpra->SvcOtherClinicalCouns</Treatment13Other>
			<Treatment13OtherSpec>$gpra->SvcOtherClinicalCounsSpec</Treatment13OtherSpec>
			<CaseManagement1FamilyServices>$gpra->SvcFamilyServices</CaseManagement1FamilyServices>
			<CaseManagement2ChildCare>$gpra->SvcChildCare</CaseManagement2ChildCare>
			<CaseManagement3APreEmployment>$gpra->SvcPreEmployment</CaseManagement3APreEmployment>
			<CaseManagement3BEmploymentCoaching>$gpra->SvcEmploymentCoaching</CaseManagement3BEmploymentCoaching>
			<CaseManagement4IndividualCoordination>$gpra->SvcIndividualCoord</CaseManagement4IndividualCoordination>
			<CaseManagement5Transportation>$gpra->SvcTransportation</CaseManagement5Transportation>
			<CaseManagement6AIDSService>$gpra->SvcHIVAIDSServices</CaseManagement6AIDSService>
			<CaseManagement7SupportiveTransitional>$gpra->SvcDrugFreeHousing</CaseManagement7SupportiveTransitional>
			<CaseManagement8Other>$gpra->SvcOtherCaseMgmt</CaseManagement8Other>
			<CaseManagement8OtherSpec>$gpra->SvcOtherCaseMgmtSpec</CaseManagement8OtherSpec>
			<Medical1Care>$gpra->SvcMedicalCare</Medical1Care>
			<Medical2AlcoholDrugTesting>$gpra->SvcAlcoholDrugTesting</Medical2AlcoholDrugTesting>
			<Medical3AIDSMedicalSupport>$gpra->SvcHIVAIDSMedical</Medical3AIDSMedicalSupport>
			<Medical4Other>$gpra->SvcOtherMedical</Medical4Other>
			<Medical4OtherSpec>$gpra->SvcOtherMedicalSpec</Medical4OtherSpec>
			<AfterCare1ContinuingCare>$gpra->SvcContinuingCare</AfterCare1ContinuingCare>
			<AfterCare2RelapsePrevention>$gpra->SvcRelapsePrevention</AfterCare2RelapsePrevention>
			<AfterCare3RecoveryCoaching>$gpra->SvcRecoveryCoaching</AfterCare3RecoveryCoaching>
			<AfterCare4SelfHelp>$gpra->SvcSelfHelpSupport</AfterCare4SelfHelp>
			<AfterCare5SpiritualSupport>$gpra->SvcSpiritualSupport</AfterCare5SpiritualSupport>
			<AfterCare6Other>$gpra->SvcOtherAfterCare</AfterCare6Other>
			<AfterCare6OtherSpec>$gpra->SvcOtherAfterCareSpec</AfterCare6OtherSpec>
			<Education1SubstanceAbuse>$gpra->SvcSubstanceAbuseEdu</Education1SubstanceAbuse>
			<Education2AIDSEducation>$gpra->SvcHIVAIDSEdu</Education2AIDSEducation>
			<Education3Other>$gpra->SvcOtherEdu</Education3Other>
			<Education3OtherSpec>$gpra->SvcOtherEduSpec</Education3OtherSpec>
			<PeerToPeer1Coaching>$gpra->SvcPeerCoaching</PeerToPeer1Coaching>
			<PeerToPeer2HousingSupport>$gpra->SvcHousingSupport</PeerToPeer2HousingSupport>
			<PeerToPeer3DrugFreeActivities>$gpra->SvcDrugFreeSocial</PeerToPeer3DrugFreeActivities>
			<PeerToPeer4InformationAndReferral>$gpra->SvcInformationReferral</PeerToPeer4InformationAndReferral>
			<PeerToPeer5Other>$gpra->SvcOtherRecovery</PeerToPeer5Other>
			<PeerToPeer5OtherSpec>$gpra->SvcOtherRecoverySpec</PeerToPeer5OtherSpec>
		</ServicesReceived>
	</Record>
</document> 
XML;

$xml = new SimpleXMLElement($content);

if($gpra->InterviewTypeCode == 1)
{
	for($i=1; $i<=6; $i++)
	{
		$relation = "ServiceMemRelationship".$i;
		$other = "ServiceMemExpOther".$i;
		$deploy = "ServiceMemExpDeployed".$i;
		$injured = "ServiceMemExpInjured".$i;
		$stress = "ServiceMemExpCombatStress".$i;
		$killed = "ServiceMemExpDeceased".$i;
		if($gpra->$relation != -1)
		{
			$relative = $xml->Record->SectionA->SerMemRelationshipList->addChild('TypeCode');
			$relative->addChild('ServiceMemRelationship', $gpra->$relation);
			$relative->addChild('ServiceMemExpOther', $gpra->$other);
			$relative->addChild('ServiceMemExpDeployed', $gpra->$deploy);
			$relative->addChild('ServiceMemExpInjured', $gpra->$injured);
			$relative->addChild('ServiceMemExpCombatStress', $gpra->$stress);
			$relative->addChild('ServiceMemExpDeceased', $gpra->$killed);
		}
	}
	unset($xml->Record->FollowUpStatus);
	unset($xml->Record->DischargeStatus);
	unset($xml->Record->ServicesReceived);
}
else if($gpra->InterviewTypeCode == 2)
{
	unset($xml->Record->SectionA);
	unset($xml->Record->DischargeStatus);
	unset($xml->Record->ServicesReceived);
}
else if($gpra->InterviewTypeCode == 5)
{
	unset($xml->Record->SectionA);
	unset($xml->Record->FollowUpStatus);
}

$content = $xml->asXML();

class AuthHeader
{
    public $userName;
    public $passWord;   
   
}
$client = new SoapClient("https://sais-grantee-test.rti.org/UploadService/UploadDocumentService.asmx?wsdl",
	array('trace' => 1, 'exceptions' => 1));

$AuthHeader = new AuthHeader();

$AuthHeader->userName = 'uSERVICESIN';
$AuthHeader->passWord = 'rti1234';

$headers[] = new SoapHeader("http://tempuri.org/", 'EDIServiceSOAPHeader', $AuthHeader);
$client->__setSoapHeaders($headers);

$callID = "631";
$servName = "SERVICES";
$refID = "REFID";

$format = "XML";
$args = array('UploadDocument' => array('callerIdentifier' => $callID, 
'serviceName' => $servName, 'referenceIdentifier' => $refID, 
'content' => $content, 'contentFormat' => $format));

$res = $client->__soapCall("UploadDocument", $args);
header('Content-Type: text/plain');
var_dump($res);
#echo( "res is " . $res);

echo( "\n\nRequest Header: ". $client->__getLastRequestHeaders());
echo( "\n\nRequest: ". $client->__getLastRequest());
echo( "\n\nResponse Header: ". $client->__getLastResponseHeaders());
echo( "\n\nResponse Header: ". $client->__getLastResponse());
?>