package com.homepage.web.serviceimpls;

import com.homepage.web.beans.KaupBean;
import com.homepage.web.services.KaupService;

public class KaupServiceImpl  implements KaupService{
	private int idx; // 멤버변수는 초기화가 필요없다. 지변만 초기화가 필요하다.
	
	@Override
	public int getKaupIndex(double height, double weight) {
		KaupBean vo = new KaupBean();
		vo.setHeight(height);
		vo.setWeight(weight);
		this.idx = (int)((weight/(height*height))*10000);;
		return this.idx;
	}

	@Override
	public String getResultMsg(int idx) {
		String msg = "";
		if(this.idx>30){msg = "비만";}
		else if(this.idx>24){msg = "과체중";}
		else if(this.idx>20){msg = "정상";}
		else if(this.idx>15){msg = "저체중";}
		else if(this.idx>13){msg = "마름";}
		else if(this.idx>10){msg = "영양실조";}
		else{msg = "소모증";}
		return "카우프 지수는 " + this.idx +", "+ msg + " 입니다.";
	}
}
