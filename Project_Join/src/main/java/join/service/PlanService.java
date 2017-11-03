

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
	
	public PlanVO[] getList(String useridx, int paging, int listPerPage, String search ){	// join.plan을 눌렀을때 	
		
		HashMap<String, Object> map = new HashMap<String, Object>();	
		
		map.put("useridx", useridx);
		map.put("begin", (paging-1) * listPerPage +1);
		map.put("end", paging * listPerPage);	
		map.put("search", search);
		
		return planDao.getList(map);		
	}
	
	public void addPlan(PlanVO pvo){
		// '저장'을 눌렀을때		
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
	//수정
	public int editOK(PlanVO pvo){
		
		return planDao.editOK(pvo);
	}
	// 삭제
	public int delete(PlanVO pvo){
		
		return planDao.delete(pvo);
	}
	//검색
	public int getTotalPlan(String search){
		Map map = new HashMap<String, String>();
		
		map.put("search", search);
		return planDao.getTotalPlan(map);
	}
	/**
	 * 메인 최신 플랜
	 * @return
	 */
	public List<HashMap> getMainPlan(){
		return planDao.getMainPlan();
	}
}