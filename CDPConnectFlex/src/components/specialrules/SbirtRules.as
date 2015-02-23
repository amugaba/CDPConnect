package components.specialrules
{
	import components.assessment.AssessType;
	import components.assessment.SBIRTModality;
	import components.client.ClientGroup;
	import components.dci.Demographics2Form;
	import components.dci.InterviewType;
	import components.questions.QuestionClass;
	
	import mx.controls.DateField;
	import mx.core.FlexGlobals;
	
	import valueObjects.AssessmentVO;

	public class SbirtRules
	{
		protected var global:CDPConnectFlex;
		public var enabled:Boolean = false;
		
		public var prescreen:AssessmentVO;
		public var audit:AssessmentVO;
		public var dast:AssessmentVO;
		public var phq9:AssessmentVO;
		public var followupSelected:Boolean = false;
		
		//coloring
		protected var highlightColor:String = "#59bc91";
		protected var defaultColor:String = "#6376A5";
		
		//warnings
		public var screeningsIncomplete:Boolean = false;
		
		public function SbirtRules(global:CDPConnectFlex)
		{
			this.global = global;
		}
		
		public function createClient():void
		{
			var cg:ClientGroup = global.pageClient.clientGroup;
			var dob:String = global.dateFormatter.format(DateField.stringToDate(cg.qDOB.answer,"MM/DD/YYYY"));
			var ssn:String = cg.qSSN.answer;
			var last:String = cg.qLastName.answer;
			//Gender/Month2/Day2/Year2/Year4/SSN2/SSN4/Last2/Last1/SSN3/SSN1/Year3/Year1/Day1/Month1
			var id:String = cg.qGender.answer.charAt(0);
			id += dob.charAt(1) + dob.charAt(4) + dob.charAt(7) + dob.charAt(9);
			id += ssn.charAt(1) + ssn.charAt(3);
			id += last.charAt(1).toUpperCase() + last.charAt(0).toUpperCase();
			id += ssn.charAt(2) + ssn.charAt(0);
			id += dob.charAt(8) + dob.charAt(6) + dob.charAt(3) + dob.charAt(0);
			cg.qClientID.answer = id;
		}
		
		public function initAssessments():void
		{
			global.pageClient.assessmentGroup.intakeGeneralButton.enabled = false;
			global.pageClient.assessmentGroup.dischargeGeneralButton.enabled = false;
			//global.pageClient.assessmentGroup.followupGeneralButton.label = "SBIRT - BT/RT";
		}
		
		/**
		 * When loading assessments, make sure SBIRT rules are followed
		 * 1. For each positive prescreen answer, the corresponding full screen needs to be done.
		 *    If full screen not done, color button green and give warning if trying to create DCI.
		 * 2. For each full screening, get the modality. Compute the max modality. Color corresponding DCI button green.
		 *    Give warning if creating a DCI button that does not match modality.
		 * */
		public function loadAssessments():void
		{
			//Reset variables
			prescreen = null;
			audit = null;
			dast = null;
			phq9 = null;
			
			for each(var assess:AssessmentVO in global.pageClient.assessmentGroup.assessmentList)
			{
				if(assess.type == AssessType.PRESCREEN)
				{
					prescreen = assess;
				}
				else if(assess.type == AssessType.AUDIT)
				{
					audit = assess;
				}
				else if(assess.type == AssessType.DAST10)
				{
					dast = assess;
				}
				else if(assess.type == AssessType.PHQ9)
				{
					phq9 = assess;
				}
			}
			refreshAssessments();
		}
		
		protected function refreshAssessments():void
		{
			//reset colorings and enablings
			screeningsIncomplete = false;
			global.pageClient.assessmentGroup.prescreenButton.setStyle("chromeColor",defaultColor);
			global.pageClient.assessmentGroup.auditButton.setStyle("chromeColor",defaultColor);
			global.pageClient.assessmentGroup.dast10Button.setStyle("chromeColor",defaultColor);
			global.pageClient.assessmentGroup.phq9Button.setStyle("chromeColor",defaultColor);
			
			global.pageClient.assessmentGroup.prescreenButton.enabled = true;
			global.pageClient.assessmentGroup.sbirtIntakeNegativeButton.enabled = false;
			global.pageClient.assessmentGroup.sbirtIntakeBIButton.enabled = false;
			global.pageClient.assessmentGroup.sbirtIntakeRTButton.enabled = false;
			global.pageClient.assessmentGroup.dischargeNoInterviewButton.enabled = false;
			global.pageClient.assessmentGroup.followupGeneralButton.enabled = false;
			global.pageClient.assessmentGroup.sbirtFollowupButton.enabled = false;
			
			//Coloring and enabling and warnings
			if(prescreen == null)
			{
				screeningsIncomplete = true;
				global.pageClient.assessmentGroup.prescreenButton.setStyle("chromeColor",highlightColor);
			}
			else
			{
				global.pageClient.assessmentGroup.prescreenButton.enabled = false;
				
				if(prescreen.data.source["Alcohol"] == 1 && audit == null)
				{
					screeningsIncomplete = true;
					global.pageClient.assessmentGroup.auditButton.setStyle("chromeColor",highlightColor);
				}
				if(prescreen.data.source["Drug"] == 1 && dast == null)
				{
					screeningsIncomplete = true;
					global.pageClient.assessmentGroup.dast10Button.setStyle("chromeColor",highlightColor);
				}
				if(prescreen.data.source["Depression"] == 1 && phq9 == null)
				{
					screeningsIncomplete = true;
					global.pageClient.assessmentGroup.phq9Button.setStyle("chromeColor",highlightColor);
				}
			}
			
			//Enable DCI buttons by modality
			if(!screeningsIncomplete)
			{
				var modality:int = calculateModality();
				var followupSelected:Boolean = false;
				if(global.pageDCI.intakeExists)
					followupSelected = global.pageDCI.intakeDCI.data.source["followupSelected"] == 1;
				
				if(modality == SBIRTModality.NEG)
				{
					if(!global.pageDCI.intakeExists)
						global.pageClient.assessmentGroup.sbirtIntakeNegativeButton.enabled = true;
					else if(!global.pageDCI.dischargeExists)
						global.pageClient.assessmentGroup.dischargeNoInterviewButton.enabled = true;
				}
				else if(modality == SBIRTModality.BI)
				{
					if(!global.pageDCI.intakeExists)
						global.pageClient.assessmentGroup.sbirtIntakeBIButton.enabled = true;
					else if(!global.pageDCI.dischargeExists)
						global.pageClient.assessmentGroup.dischargeNoInterviewButton.enabled = true;
					else if(followupSelected)
						global.pageClient.assessmentGroup.sbirtFollowupButton.enabled = true;
				}
				else if(modality > SBIRTModality.BI)
				{
					if(!global.pageDCI.intakeExists)
						global.pageClient.assessmentGroup.sbirtIntakeRTButton.enabled = true;
					else if(!global.pageDCI.dischargeExists)
						global.pageClient.assessmentGroup.dischargeNoInterviewButton.enabled = true;
					else if(followupSelected)
						global.pageClient.assessmentGroup.followupGeneralButton.enabled = true;
				}
			}
		}
		
		private function calculateModality():int
		{
			var alcMod:int = 0;
			if(audit != null)
				alcMod = audit.data.source["Modality"];
			var drugMod:int = 0;
			if(dast != null)
				drugMod = dast.data.source["Modality"];
			return Math.max(alcMod, drugMod);
		}
		
		//Go to prescreen form
		public function episodeCreated():void
		{
			loadAssessments();
			global.pageClient.assessmentGroup.createAssessment(AssessType.PRESCREEN);
		}
		
		//Move directly to next item required
		public function assessmentCreated():void
		{
			loadAssessments();//refresh first
			var assess:AssessmentVO = global.activeAssessment;
			
			if(prescreen == null)
			{
				global.pageClient.assessmentGroup.createAssessment(AssessType.PRESCREEN);
			}
			else
			{
				if(prescreen.data.source["Alcohol"] == 1 && audit == null)
				{
					global.pageClient.assessmentGroup.createAssessment(AssessType.AUDIT);
				}
				else if(prescreen.data.source["Drug"] == 1 && dast == null)
				{
					global.pageClient.assessmentGroup.createAssessment(AssessType.DAST10);
				}
				else if(prescreen.data.source["Depression"] == 1 && phq9 == null)
				{
					global.pageClient.assessmentGroup.createAssessment(AssessType.PHQ9);
				}
				else if(!global.pageDCI.intakeExists)
				{
					var modality:int = calculateModality();
					if(modality == SBIRTModality.NEG)
						global.pageClient.assessmentGroup.createDCI(InterviewType.INTAKE_SBIRT_NEG);
					else if(modality == SBIRTModality.BI)
						global.pageClient.assessmentGroup.createDCI(InterviewType.INTAKE_SBIRT_BI);
					else if(modality > SBIRTModality.BI)
						global.pageClient.assessmentGroup.createDCI(InterviewType.INTAKE_SBIRT_RT);
				}
			}
		}
		
		public function assessmentChanged():void
		{
			loadAssessments();
		}
		
		//Populate screening scores, modality, and services
		public function createDCI():void
		{
			if(global.pageDCI.isIntake(global.pageDCI.interviewType))
			{
				//PHQ on record form
				if(prescreen != null && prescreen.data.source["Depression"] == 1)
					global.pageDCI.recordForm.qCooccurringScreenStatus.setAnswerIndex(0);//Yes
				
				if(audit != null)
					global.pageDCI.sbirtForm.qAUDIT.answer = audit.data.source["Score"].toString();
				if(dast != null)
					global.pageDCI.sbirtForm.qDAST10.answer = dast.data.source["Score"].toString();
				
				var modality:int = calculateModality();
				if(modality > SBIRTModality.NEG)
				{
					global.pageDCI.sbirtForm.qSBIRTScreen.setAnswerIndex(1);//Positive
					global.pageDCI.sbirtForm.qSBIRTContinue.setAnswerIndex(0);//Yes
				}
				
				//Services
				global.pageDCI.services1Form.qSvcModOther.answer = "Yes";
				global.pageDCI.services1Form.qSvcModOther.refreshSkips();
				global.pageDCI.services1Form.qSvcModOtherSpec.answer = "SBIRT";
				global.pageDCI.services1Form.qSvcScreening.answer = "Yes";
				if(modality == SBIRTModality.BI)
					global.pageDCI.services1Form.qSvcBriefIntervention.answer = "Yes";
				else if(modality == SBIRTModality.BT)
					global.pageDCI.services1Form.qSvcBriefTreatment.answer = "Yes";
				else if(modality == SBIRTModality.RT)
					global.pageDCI.services1Form.qSvcReferralToTreatment.answer = "Yes";
				
				//If negative, put missing data for skipped demographics questions
				if(modality == SBIRTModality.NEG)
				{
					var df:Demographics2Form = global.pageDCI.demo2Form;
					for each(var q:QuestionClass in [df.qForeignLanguage,df.qSexOrientation,df.qSexWith,df.qSexFeelings,df.qDeaf,df.qBlind,df.qLearningDisability,df.qBrainInjury,df.qThinkingDifficult,df.qStairsDifficult,df.qDressingDifficult])
					{
						q.answer = "Missing Data";
					}
				}
			}
			//Discharge
			else if(global.pageDCI.isDischarge(global.pageDCI.interviewType))
			{
				//Populate discharge services
				global.pageDCI.dischargeServices1Form.qSvcModOther.answer = "1";
				global.pageDCI.dischargeServices1Form.qSvcModOther.refreshSkips();
				global.pageDCI.dischargeServices1Form.qSvcModOtherSpec.answer = "SBIRT";
				global.pageDCI.dischargeServices1Form.qSvcScreening.answer = "1";
				if(modality == SBIRTModality.BI)
					global.pageDCI.dischargeServices1Form.qSvcBriefIntervention.answer = "1";
				else if(modality == SBIRTModality.BT)
					global.pageDCI.dischargeServices1Form.qSvcBriefTreatment.answer = "1";
				else if(modality == SBIRTModality.RT)
					global.pageDCI.dischargeServices1Form.qSvcReferralToTreatment.answer = "1";
			}
		}
		
		public function dciCreated():void
		{
			refreshAssessments();
			//if a BI or RT intake was created, move directly to the discharge
			if(!global.pageDCI.dischargeExists && (global.activeAssessment.subtype == InterviewType.INTAKE_SBIRT_BI || global.activeAssessment.subtype == InterviewType.INTAKE_SBIRT_RT))
				global.pageClient.assessmentGroup.createDCI(InterviewType.DISCHARGE_NO_INTERVIEW);
		}
	}
}