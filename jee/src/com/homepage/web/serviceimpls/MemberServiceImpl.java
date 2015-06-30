package com.homepage.web.serviceimpls;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.homepage.web.beans.MemberBean;
import com.homepage.web.daos.MemberDAO;
import com.homepage.web.services.MemberService;

public class MemberServiceImpl implements MemberService {
	/*
	 * DAO 가 싱글톤 패턴으로 단 하나의 인스턴스만 리턴한다면
	 * 그것을 사용하는 서비스도 싱글톤으로 구성해야 한다.
	 * 그러지 않으면 다중 접속 상태에서 하나의 인스턴스만 사용하게되어
	 * 접속불량 현상이 발생한다.
	*/
	private static MemberService service = new MemberServiceImpl();
	private MemberServiceImpl() {}
	public static MemberServiceImpl getInstance(){
		return (MemberServiceImpl) service;
	}
	/*
	 * 회원가입 기능을 하는 메소드
	 * HashMap 을 해야 id 값을 가지고 password 를 호출하겠구나..
	 * */
	MemberBean Bean = new MemberBean();
	Map<String,Object> map = new HashMap<String,Object>();
	@Override
	public int join(MemberBean bean){//String id, String password, String name, String age, String email) {
		/*
		 * 이 패턴은 DB 에 저장하는 패턴과 일치한다.
		 * 즉, 값을 활용하면서 오염되거나 변질될 수 있기에
		 * 가장 먼저 순수값을 DB 에 저장하고 본다.
		 * */
		/*Bean.setEmail(email);
		Bean.setAge(age);
		Bean.setId(id);
		Bean.setName(name);
		Bean.setPassword(password);*/

		/*map.put("id", Bean.getId());
		map.put("password", Bean.getPassword());
		map.put("name", Bean.getName());

		map.put("age", String.valueOf(Bean.getAge()));
		map.put("addr", Bean.getEmail());
		 db 가 이역할을 함.*/
		return MemberDAO.getInstance().join(bean);
	}

	@Override
	public String login(String id, String password) {
		String msg = "";
		if(map.get("id").equals(id)&& map.get("password").equals(password)){			
			msg = "환영합니다.";
		}else if(!(map.get("id").equals(id))&&map.get("password").equals(password)){
			msg ="입력하신 ID 는 존재하지 않거나, 일치하지 않습니다. 다시 입력해 주세요.";
		}else{					
			msg ="비번이 다릅니다.다시 입력하세요.";
		}
		
		return msg;
	}

	@Override
	public List<MemberBean> getList() {
		MemberDAO dao = MemberDAO.getInstance();
		return dao.getList();
	}
}
