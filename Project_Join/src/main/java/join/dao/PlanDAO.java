package join.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import join.vo.PlanVO;

public class PlanDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}

	// join.plan을 클릭했을때, list
	public PlanVO[] getList(String useridx){		
		
		List<PlanVO> list = template.selectList("plan.planList",useridx);		
		PlanVO[] ar = null;
		if(list != null && list.size() >0 ){
			ar = new PlanVO[list.size()];
			list.toArray(ar);		
		}
		return ar;
	}
	
	// '글쓰기'창에서 '저장'을 눌렀을때
	public boolean savePlan(PlanVO pvo){
		int cnt = template.insert("plan.write_ok", pvo);		
		if(cnt >0)			
			return true;
		else
			return false;		
	}
	// '신청하기'를 눌렀을때 
	public boolean appPoeple(Map<String, String> map){		
		int cnt = template.insert("plan.setPoeple",map);
		if(cnt >0)			
			return true;
		else
			return false;
	}
	
	// '글쓰기 상세보기'
	public PlanVO getPlan(Map map){
		//PlanVO pvo = template.selectOne("plan.getView", idx);	
		//System.out.println(idx);		
		return template.selectOne("plan.getView", map);
	}
}

	

	