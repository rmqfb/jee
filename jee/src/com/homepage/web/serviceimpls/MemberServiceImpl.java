package com.homepage.web.serviceimpls;

import java.util.HashMap;
import java.util.Map;

import com.homepage.web.beans.MemberBean;
import com.homepage.web.services.MemberService;

public class MemberServiceImpl implements MemberService {
	/*
	 * 회원가입 기능을 하는 메소드
	 * HashMap 을 해야 id 값을 가지고 password 를 호출하겠구나..
	 * */
	MemberBean Bean = new MemberBean();
	Map<String,Object> map = new HashMap<String,Object>();
	@Override
	public void join(String id, String password, String name, int age,
			String addr) {
		/*
		 * 이 패턴은 DB 에 저장하는 패턴과 일치한다.
		 * 즉, 값을 활용하면서 오염되거나 변질될 수 있기에
		 * 가장 먼저 순수값을 DB 에 저장하고 본다.
		 * */
		Bean.setAddr(addr);
		Bean.setAge(age);
		Bean.setId(id);
		Bean.setName(name);
		Bean.setPassword(password);

		map.put("id", Bean.getId());
		map.put("password", Bean.getPassword());
		map.put("name", Bean.getName());

		map.put("age", String.valueOf(Bean.getAge()));
		map.put("addr", Bean.getAddr());

		
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
}
