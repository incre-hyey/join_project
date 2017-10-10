package join.service;

import java.util.List;

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
	
	public boolean setPlan(PlanVO pvo){
		// '저장'을 눌렀을때
		System.out.println(pvo.getContent());
		return planDao.savePlan(pvo);			
	}	
	
	
}