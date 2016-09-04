package seschool.bank.intercepter;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		//context가 붙은 애들은 대장 역할을 하는 중요한 것들.
		String result= "";
		
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session =ctx.getSession();
		
		System.out.println("............로그인 인터셉터 시작");
		String loginId = (String) session.get("loginId");
		System.out.println(loginId);
		if(loginId == null){
			result = Action.LOGIN; 
			//login화면으로 가도록 설정하기
		}else{
			result= invocation.invoke();
			System.out.println(".........로그인 인터셉터 끝");
		}
	
		
		return result; //유저가 원래 하려고 했던 액션을 invocation이 알고 있다. 
	
	
	}

}
