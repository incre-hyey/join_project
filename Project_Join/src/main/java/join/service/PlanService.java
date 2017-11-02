package join.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import join.dao.PlanDAO;
import join.vo.PlanVO;

@Transactional
@Service("planService")
public class PlanService {

	@Autowired
	PlanDAO planDao;	
	
	public PlanVO[] getList(String useridx){	// join.plan을 눌렀을때 		
		//System.out.println(planDao.getList());
		return planDao.getList(useridx);		
	}
	
	public void addPlan(PlanVO pvo){
		// '저장'을 눌렀을때
		//System.out.println(pvo.getTitle());
		planDao.savePlan(pvo);			
	}	
	
	public PlanVO viewPlan(String idx, String useridx){		
		//'상세보기'를 눌렀을때 
		Map map = new HashMap<String, String>();
		
		map.put("idx", idx);
		map.put("useridx", useridx);
		return planDao.getPlan(map);
	}
	
	public void appPoeple(Map<String, String> map){
		//'신청하기'를 눌렀을때
		
		planDao.appPoeple(map);
	}
	// '수정하기'버튼을 눌렀을때
	public PlanVO editPlan(Map<String, String> map){
		
		return planDao.editPlan(map);
	}
	
	public int editOK(PlanVO pvo){
		
		return planDao.editOK(pvo);
	}
	
	public int delete(PlanVO pvo){
		System.out.println("서비쓰~");
		return planDao.delete(pvo);
	}
	
	/**
	 * 메인 최신 플랜
	 * @return
	 */
	public List<HashMap> getMainPlan(){
		return planDao.getMainPlan();
	}
	
}