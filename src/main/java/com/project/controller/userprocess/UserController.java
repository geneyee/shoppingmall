package com.project.controller.userprocess;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.project.kakaologin.service.KakaoAPI;
import com.project.naverlogin.service.NaverLoginBO;
import com.project.user.service.UserService;
import com.project.user.vo.UserVO;

@Controller
public class UserController {
	
	@Resource(name="UserService")
	private UserService userService;
	
	@Autowired
    private KakaoAPI kakao;
	
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Inject
	JavaMailSender mailSender;
	
	@RequestMapping(value="/popup.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String popup() {
		return "popup"; 
	}
	
	@RequestMapping(value="/map.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String mapForm() {
		return "map"; 
	}
	
	@RequestMapping(value="/idsearchForm.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String idsearchForm() {
		return "idsearchForm"; 
	}
	
	@RequestMapping(value="/pwsearchForm.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String pwsearchForm() {
		return "pwsearchForm"; 
	}
	
	@RequestMapping(value="/loginForm.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String loginForm(Model model, HttpSession session) {
		
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
	
		model.addAttribute("url", naverAuthUrl);
		
		
		return "loginForm"; 
	}
	

	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,HttpServletRequest request, UserVO user)
          throws IOException, ParseException {
       OAuth2AccessToken oauthToken;
         oauthToken = naverLoginBO.getAccessToken(session, code, state);

         apiResult = naverLoginBO.getUserProfile(oauthToken); //String
        
         JSONParser parser = new JSONParser();
         Object obj = parser.parse(apiResult);
         JSONObject jsonObj = (JSONObject) obj;
        
         JSONObject response = (JSONObject)jsonObj.get("response");
         
         
         String nickname = (String)response.get("nickname");
         String emailaaa = (String)response.get("email");
         int index = emailaaa.indexOf("@");
         String email = emailaaa.substring(0,index);
         String email1 = emailaaa.substring(index+1,emailaaa.length());
         String telaaa = "010-1111-1111";
         System.out.println(nickname);
         System.out.println(email);
         System.out.println(email1);
         System.out.println(telaaa);
         
 
         session.setAttribute("user_id",nickname); 
         //session.setAttribute("email", email);
         model.addAttribute("result", apiResult);
         
    
         user.setName((String) response.get("name"));
         user.setPwd("0000");
         user.setEmail(email);
         user.setEmail1(email1);
         user.setUser_id((String) response.get("nickname"));
         user.setTel("��");
         user.setTel1("��");
         user.setTel2("��");
         user.setAddress("��");
         user.setAddress1("��");
         user.setAddress2("��");
         
        
       try {
          userService.registerAccount(user);
       } catch (SQLException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
       }


        

       
       return "main";
    }
 
    @RequestMapping(value="/kakaologin.do", produces="text/plain;charset=UTF-8")
     public String login(@RequestParam("code") String code,HttpSession session,UserVO user) {
       String access_Token = kakao.getAccessToken(code);
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        String emailaaa = (String)userInfo.get("email");
        int index = emailaaa.indexOf("@");
         String email = emailaaa.substring(0,index);
  
        if (userInfo.get("email") != null) {
            session.setAttribute("user_id", email);
            session.setAttribute("access_Token", access_Token);
        }
        
        String nickname = (String)userInfo.get("nickname");
        /* String emailaaa = (String)userInfo.get("email");*/
         /*int index = emailaaa.indexOf("@");
         String email = emailaaa.substring(0,index);*/
         String email1 = emailaaa.substring(index+1,emailaaa.length());
         String telaaa = "010-1111-1111";
         
         System.out.println(nickname);
         System.out.println(email);
         System.out.println(email1);
         System.out.println(telaaa);
         
        
         
      
         user.setName((String) userInfo.get("nickname"));
         user.setPwd("0000");
         user.setEmail(email);
         user.setEmail1(email1);
         user.setUser_id(email);
         user.setTel("��");
         user.setTel1("��");
         user.setTel2("��");
         user.setAddress("��");
         user.setAddress1("��");
         user.setAddress2("��");
         
        
       try {
          userService.registerAccount(user);
       } catch (SQLException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
       }
        
         return "main";
     }
	
	@RequestMapping(value="/kakaologout.do")
	public String logout1(HttpSession session) {
	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("user_id");
	    return "loginForm";
	}
	
	
	
	
	@RequestMapping(value="/boardwrite.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String writeForm(){
		return "write"; 
	}
	
	@RequestMapping(value="/writeAction.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String writeAction(){
		return "writeAction"; 
	}
	
	@RequestMapping(value="/signUpForm.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String signUpForm(){
		return "signUpForm"; 
	}
	
	@RequestMapping(value="/board.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String board(){
		return "board"; 
	}
	
	@RequestMapping(value="/main.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String main1(){
		return "main"; 
	}
	
	@RequestMapping(value="/view.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String view(){
		return "view"; 
	}
	
	@RequestMapping(value="/infoupdateForm.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String infoupdateForm(){
		return "infoupdate"; 
	}
	
	@RequestMapping(value="/mypageForm.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String mypageForm(){
		return "mypage"; 
	}
	
	@RequestMapping(value="/deleteAccountForm.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String deleteAccountForm(){
		return "infodelete";
	}
	
	@RequestMapping(value="/aaa.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String aaa(){
		return "aaa"; 
	}
	
	@RequestMapping(value="/center.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String centerForm(){
		return "center"; 
	}
	
	@RequestMapping(value="/adminMain.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String adminForm() {
	      return "Admin_main";
	   }
	 @RequestMapping(value="/Admin_product.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String poductForm() {
	      return "Admin_product";
	   }
	 @RequestMapping(value="/Admin_member.do", method= {RequestMethod.POST,RequestMethod.GET})
	   public String adminMemberForm() {
	      return "Admin_member";
	   }

	@RequestMapping(value="/", method= {RequestMethod.POST,RequestMethod.GET})
	public String main() {
		return "main";
	}
	

	@RequestMapping(value = "/signUp.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String registerAccount(UserVO vo) throws SQLException {		
		
		userService.registerAccount(vo);
		
		return "loginForm";//loginForm.jsp;
	}
	

	@RequestMapping(value="/deleteAccount.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String deleteAccount(String user_id, String pwd) throws SQLException {
		
		userService.deleteAccount(user_id, pwd);
		
		return "deleteInfoAction";
	}
	
	

	@RequestMapping(value="/login.do",method= {RequestMethod.POST,RequestMethod.GET})
	public String login(String user_id, String pwd, Model model) throws SQLException {
		
		model.addAttribute("mLogin",userService.login(user_id, pwd));
		
		return "loginAction";
	}
	

	@RequestMapping(value="/logout.do", method={RequestMethod.POST,RequestMethod.GET})
	public String logout(HttpSession session) {
		
		session.removeAttribute("sid");
		session.invalidate();
		
	    
	    return "loginForm";
		
	}
	

	@RequestMapping(value="/mypage.do", method={RequestMethod.POST,RequestMethod.GET})
	public String searchInfo(String sId, Model model) {
		
		model.addAttribute("mMyInfo",userService.searchInfo(sId));
		
		return "mypage";

	}
	
	
	
	

	@RequestMapping(value="/infoupdate.do", method={RequestMethod.POST,RequestMethod.GET})
	public String infoupdate(String pwd,String tel,String tel1,String tel2,String email,String email1,String address,String address1,String address2,String user_id) {
		
		userService.infoupdate(pwd, tel, tel1, tel2, email, email1, address, address1, address2, user_id);
		
		return "infoupdateAction";
	}
	
	@RequestMapping(value="/registerCheck.do", method={RequestMethod.POST,RequestMethod.GET})
	public String registerCheck(String user_id) throws SQLException  {
		
		userService.registerCheck(user_id);
		
		return "idCheck";
	}
	@RequestMapping(value="/setProduct.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String setProduct(){
		return "setProduct"; // 
	}

	@RequestMapping(value="/idsearch.do", method={RequestMethod.POST,RequestMethod.GET})
	public String idserach(UserVO vo,Model model) throws SQLException   {
		
		model.addAttribute("usersss",userService.idserach(vo));
		
		return "idsearchAction";
	}
	
	
	@RequestMapping(value="/pwsearch.do", method={RequestMethod.POST,RequestMethod.GET})
	public String pwsearch(UserVO vo,Model model) throws SQLException   {
		
		model.addAttribute("userpw",userService.pwsearch(vo));
		
		return "pwsearchAction";
	}
	
	
	
	
	  @RequestMapping(value="auth.do", method={RequestMethod.POST,RequestMethod.GET})
	   public ModelAndView mailSending(HttpServletRequest request, String e_mail, HttpServletResponse response_email) throws IOException {
	      
	      Random r = new Random();
	      int dice = r.nextInt(4589362)+49311;//�̸��� �����ڵ� ����
	      
	      String setfrom ="check@gazua.store";
	      String tomail=request.getParameter("e_mail");///�޴»�� �̸���
	      String title="ȸ������ ���� �̸��� �Դϴ�.";
	      String content=
	               System.getProperty("line.separator")+ //���پ� �ٰ����� �α����� �ۼ�
	               
	               System.getProperty("line.separator")+
	                       
	               "�ȳ��ϼ��� ȸ���� ���� Ȩ�������� ã���ּż� �����մϴ�"
	               
	               +System.getProperty("line.separator")+
	               
	               System.getProperty("line.separator")+
	       
	               " ������ȣ�� " +dice+ " �Դϴ�. "
	               
	               +System.getProperty("line.separator")+
	               
	               System.getProperty("line.separator")+
	               
	               "������ ������ȣ�� Ȩ�������� �Է��� �ֽø� �������� �Ѿ�ϴ�."; // ����
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	                    true, "UTF-8");

	            messageHelper.setFrom(setfrom); // �����»�� �����ϸ� �����۵��� ����
	            messageHelper.setTo(tomail); // �޴»�� �̸���
	            messageHelper.setSubject(title); // ���������� ������ �����ϴ�
	            messageHelper.setText(content); // ���� ����
	            
	            mailSender.send(message);
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        
	        ModelAndView mv = new ModelAndView();//ModelAndView�� ���� �������� �����ϰ�, ���� ���� �����Ѵ�.
	        mv.setViewName("/email_ok");     //�����̸�
	        mv.addObject("dice", dice);
	        
	        System.out.println("mv : "+mv);

	        response_email.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_email = response_email.getWriter();
	        out_email.println("<script>alert('�̸����� �߼۵Ǿ����ϴ�. ������ȣ�� �Է����ּ���.');</script>");
	        out_email.flush();
	        
	        
	        return mv;      
	      
	   }
	   
	   
	    //�̸��� ���� ������ ���� �޼ҵ�
	    @RequestMapping("/email.do")
	    public String email() {
	        return "email";
	    }
	    
	    
	    //�̸��Ϸ� ���� ������ȣ�� �Է��ϰ� ���� ��ư�� ������ ���εǴ� �޼ҵ�.
	    //���� �Է��� ������ȣ�� ���Ϸ� �Է��� ������ȣ�� �´��� Ȯ���ؼ� ������ ȸ������ �������� �Ѿ��,
	    //Ʋ���� �ٽ� ���� �������� ���ƿ��� �޼ҵ�
	    @RequestMapping(value = "/join_ok.do{dice}", method = RequestMethod.POST)
	    public ModelAndView join_injeung(String email_injeung, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
	 
	        
	        
	        
	        System.out.println("������ : email_injeung : "+email_injeung);
	        
	        System.out.println("������ : dice : "+dice);
	        
	        
	        //�������̵��� �ڷḦ ���ÿ� �ϱ����� ModelAndView�� ����ؼ� �̵��� �������� �ڷḦ ����
	         
	        ModelAndView mv = new ModelAndView();
	        
	        mv.setViewName("/signUpForm.do");
	        
	        mv.addObject("e_mail",email_injeung);
	        
	        if (email_injeung.equals(dice)) {
	            
	            //������ȣ�� ��ġ�� ��� ������ȣ�� �´ٴ� â�� ����ϰ� ȸ������â���� �̵���
	            
	            
	            
	            mv.setViewName("signUpForm");
	            
	            mv.addObject("e_mail",email_injeung);
	            
	            //���� ������ȣ�� ���ٸ� �̸����� ȸ������ �������� ���� �Ѱܼ� �̸�����
	            //�ѹ��� �Է��� �ʿ䰡 ���� �Ѵ�.
	            
	            response_equals.setContentType("text/html; charset=UTF-8");
	            PrintWriter out_equals = response_equals.getWriter();
	            out_equals.println("<script>alert('������ȣ�� ��ġ�Ͽ����ϴ�. ȸ������â���� �̵��մϴ�.');</script>");
	            out_equals.flush();
	    
	            return mv;
	            
	            
	        }else if (email_injeung != dice) {
	            
	            
	            ModelAndView mv2 = new ModelAndView(); 
	            
	            mv2.setViewName("email_injeung");
	            
	            response_equals.setContentType("text/html; charset=UTF-8");
	            PrintWriter out_equals = response_equals.getWriter();
	            out_equals.println("<script>alert('������ȣ�� ��ġ�����ʽ��ϴ�. ������ȣ�� �ٽ� �Է����ּ���.'); history.go(-1);</script>");
	            out_equals.flush();
	            
	    
	            return mv2;
	            
	        }    
	    
	        return mv;
	   
	    }

	@RequestMapping(value="/userlist.do", method={RequestMethod.POST,RequestMethod.GET})
	public String getAllInfo(UserVO vo, Model model) throws SQLException {
		model.addAttribute("userlist",userService.getAllInfo(vo));
		
		return "Admin_member";
	}
    
    
   

}
