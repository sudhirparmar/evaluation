<?php

class PerformanceReview_model extends CI_Model {
    public function getAllQuestionData($Id=Null)
	{
		try{
            if($Id)
	        { 
            $this->db->select('ea.EvaluationAnswerId,ea.EmployeeEvaluatorId,ea.AnswerText,q.QuestionId,q.QuestionText, q.AnswerTypeId, q.IsActive');
            $this->db->join('tblmstquestion q','q.QuestionId=ea.QuestionId','left');
            $this->db->where('ea.EmployeeEvaluatorId',$Id);
            $this->db->where('q.IsActive',1);
            $query=$this->db->get('tblevaluationanswer ea');
            
            //$res=array();
            if($query->result())
            {
                $result = $query->result();
                $res2 = array();
                    $j = -1;
                    for($i=0; $i<$query->num_rows(); $i++) {
                        $query_ans = array();
                        $this->db->select('o.QuestionOptionId, o.QuestionId, o.OptionValue');
                        $this->db->where('o.QuestionId',$result[$i]->QuestionId);
                        $query_ans=$this->db->get('tblquestionoptions o');
                        
                        if($i==0 || $i%4==0){
                            $res = array();
                            $j++;
                        }					
                        $result[$i]->answer = $query_ans->result();				
						array_push($res,$result[$i]);			
						$res2[$j]['row'] = $res;
                    }
                    return $res2;
            }
            
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
    public function getEvaluationStatus($Id=Null)
	{
	  if($Id)
	  {
        $this->db->select('ee.StatusId');
            $this->db->where('ee.EmployeeEvaluatorId',$Id);
            $result=$this->db->get('tblmstempevaluator ee');
		
          $res = array();
          foreach($result->result() as $row) {
              $res = $row;
          }
          return $res;
        }
    }
    public function insertPerformance($post_data)
	{	
                    $PerformanceData=$post_data['PerformanceData'];
                    //$performance_data= array();
					foreach($PerformanceData as $data){
						//$child = $data['child'];
							$data1=array(
								"EmployeeEvaluatorId"=>$data['EmployeeEvaluatorId'],
								"QuestionId"=>$data['QuestionId'],
								"AnswerText"=>$data['AnswerText'],
								"IsActive"=>1,
								"UpdatedOn"=>date('y-m-d H:i:s')
                                );	
                                $this->db->where('EvaluationAnswerId',trim($data['EvaluationAnswerId']));
                                $res1=$this->db->update('tblevaluationanswer',$data1);

                    } 
                    $result=$this->db->query("update tblmstempevaluator set StatusId=1 where EmployeeEvaluatorId=".$data['EmployeeEvaluatorId']);
                    return true;
                    
    }
    public function saveAsDraft($post_data)
	{	
                    $PerformanceData=$post_data['PerformanceData'];
                    
                    //$performance_data= array();
					foreach($PerformanceData as $data){
                        foreach($data as $value){
                        if ($value['AnswerText'] == '')
                        $AnswerText = null;
                            else
                        $AnswerText = $data['AnswerText'];
						//$child = $data['child'];
							$data1=array(
								"EmployeeEvaluatorId"=>$value['EmployeeEvaluatorId'],
								"QuestionId"=>$value['QuestionId'],
								"AnswerText"=>$AnswerText,
								"IsActive"=>1,
								"UpdatedOn"=>date('y-m-d H:i:s')
                                );	
                                $this->db->where('EvaluationAnswerId',trim($value['EvaluationAnswerId']));
                                $res1=$this->db->update('tblevaluationanswer',$data1);
                            }
                    } 
                    //$result=$this->db->query("update tblmstempevaluator set StatusId=1 where EmployeeEvaluatorId=".$data['EmployeeEvaluatorId']);
                    return true;
                    
	}
}
?>