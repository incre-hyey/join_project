package join.service;

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
	
	public PlanVO[] getList(){	// join.plan을 눌렀을때 		
		//System.out.println(planDao.getList());
		return planDao.getList();		
	}
	
	public void addPlan(PlanVO pvo){
		// '저장'을 눌렀을때
		//System.out.println(pvo.getTitle());
		planDao.savePlan(pvo);			
	}	
	
	public PlanVO viewPlan(String idx){		
		//String idx = pvo.getIdx();
		//System.out.println("planservice");
		return planDao.getPlan(idx);
	}
	
	public void appPoeple(Map<String, String> map){
		
		planDao.appPoeple(map);
	}
}