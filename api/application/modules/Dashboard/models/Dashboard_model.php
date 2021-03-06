<?php

class Dashboard_model extends CI_Model {
    public function getEvaluationsById($UserId=Null)
	{
	  if($UserId)
	  {
        $result = $this->db->query('select ee.EmployeeEvaluatorId,ee.EvaluationId,ee.EvaluatorId,ee.StatusId,ee.EvaluatorType,e.UserId,e.EvaluationTypeId,e.ExpirationDate,e.EvaluationDate,et.EvaluationTypeName,u.FirstName,u.LastName from tblmstempevaluator as ee left join tblmstempevaluation as e on (e.EvaluationId=ee.EvaluationId) left join tblmstevaluationtype as et on (e.EvaluationTypeId=et.EvaluationTypeId)
          LEFT join tbluser as u on (u.UserId=e.UserId) where ee.EvaluatorId='.$UserId.'
          ORDER BY CASE WHEN e.UserId='.$UserId.' THEN e.UserId END DESC');
		
          $res = array();
          if($result->result()) {
              $res = $result->result();
          }
          return $res;
        }
    }
    public function insertQuestions($post_data)
	{
	  if($post_data)
	  {  
        $result1 = $this->db->query("INSERT INTO tblevaluationanswer (EmployeeEvaluatorId, QuestionId, CreatedBy, UpdatedBy) SELECT ".$post_data['Id'].",QuestionId,".$post_data['UserId'].",".$post_data['UserId']." FROM tblmstquestion where EvaluationTypeId=".$post_data['TypeId']." && EvaluatorTypeId!=".$post_data['EvaluatorType']." && IsActive=1;");
        
        if($result1) {
            $result=$this->db->query("update tblmstempevaluator set StatusId=2 where EmployeeEvaluatorId=".$post_data['Id']);
            if($result){
                $log_data = array(
                    'UserId' => $post_data['UserId'],
                    'Module' => 'Evaluation',
                    'Activity' =>'Start Evaluation (EmployeeEvaluatorId = '.$post_data['Id'].')'
                );
                $log = $this->db->insert('tblactivitylog',$log_data);
                return true; 
            }
            else{
                return false;
            }
        }
        else{
            return false;
        }
        
    }
}
public function reviewById($EmployeeEvaluatorId=Null)
	{
        try{
            if($EmployeeEvaluatorId)
	        { 
            $this->db->select('ea.EvaluationAnswerId,ea.EmployeeEvaluatorId,ea.AnswerText,q.QuestionId,q.QuestionText, q.AnswerTypeId, q.IsActive');
            $this->db->join('tblmstquestion q','q.QuestionId=ea.QuestionId','left');
            $this->db->where('ea.EmployeeEvaluatorId',$EmployeeEvaluatorId);
            $this->db->where('q.IsActive',1);
            $result=$this->db->get('tblevaluationanswer ea');
            
            $res=array();
            foreach($result->result() as $row)
            {
                $this->db->select('o.QuestionOptionId, o.QuestionId, o.OptionValue');
                $this->db->where('o.QuestionId',$row->QuestionId);
                $result1=$this->db->get('tblquestionoptions o');
                //$res=$row;
                $row->child=$result1->result();
                array_push($res,$row);
            }
            return $res;
            }
            else
            {
                return false;
            }
		}catch(Exception $e){
			trigger_error($e->getMessage(), E_USER_ERROR);
			return false;
		}	
    }
}

?>