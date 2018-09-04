package net.togogo.controller;

import net.togogo.bean.Company;
import net.togogo.bean.User;
import net.togogo.service.CompanyService;
import net.togogo.service.UserService;
import net.togogo.utis.newMD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private CompanyService companyService;

    @SuppressWarnings("deprecation")
    @RequestMapping("/register")
    @ResponseBody
    public String register(@RequestParam("email") String email,
                           @RequestParam("password")String password,
                           @RequestParam("username")String username,
                           @RequestParam("role")String role,
                           HttpSession session) throws NoSuchAlgorithmException {
        if (userService.checkExist(email)|| companyService.checkExist(email)){
            return "emailExist";
        }
        else if (role.equals("person")){
            String upassword = newMD5.generateCode(password);
            User user = new User(email,upassword,username);
            boolean rs = userService.createUser(user);
            if (rs)
                return "success";
            else
                return "fail";
        }
        else if (role.equals("company")){
            String upassword = newMD5.generateCode(password);
            Company company = new Company(email,upassword,username);
            boolean rs = companyService.createCompany(company);
            if (rs)
                return "success";
            else
                return "fail";
        }
        return "fail";
    }


    /*登录*/
    @RequestMapping("login")
    @ResponseBody
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        @RequestParam("role") String role,
                        HttpSession session) throws NoSuchAlgorithmException {


        String upassword = newMD5.generateCode(password);

        if (role.equals("person")){
            User user = new User(email,upassword);
            User rsUser = userService.login(user);
            if (rsUser==null){
                return "no";
            }
            else {
                session.setAttribute("user",rsUser);
                session.setAttribute("role",role);
                //首页未完成，用户登录成功后不显示，所以在控制台打印其登录信息验证
                System.out.println("rsUser = " + rsUser);
                System.out.println("role = " + role);
                return "yes";
            }
        }else if (role.equals("company")){
            Company company = new Company(email,upassword);
            Company rsCompany = companyService.login(company);
            if (rsCompany==null){
                return "no";
            }else {
                session.setAttribute("user",rsCompany);
                session.setAttribute("role",role);
                System.out.println("rsCompany = " + rsCompany);
                System.out.println("role = " + role);
                return "yes";
            }
        }
        else {
            return "no";
        }
    }

    /*用户登录成功后  无法加载首页  所以重新设置临时首页*/
    @RequestMapping("index")
    public String success(){
        return "/success.html";
    }

    /**/
    @RequestMapping("accountInfo")
    public String accountInfo(){
        return "WEB-INF/person/account_info.jsp";
    }


    /*修改用户信息*/
    @RequestMapping("updateUserInfo")
    @ResponseBody
    public String updateUserInfo(@RequestParam("name") String name,
                                 @RequestParam("sex") String sex,
                                 @RequestParam("birthday") String birthday,
                                 @RequestParam("workDate") String workDate,
                                 @RequestParam("bornCity") String bornCity,
                                 @RequestParam("livingCity") String livingCity,
                                 @RequestParam("phone") String phone,
                                 HttpSession session){

        User user = (User) session.getAttribute("user");
        if (user==null){
            return "fail";
        }else {
            user.setUser_name(name);
            user.setUser_sex(sex);
            user.setUser_birthday(birthday);
            user.setUser_work_date(workDate);
            user.setUser_born_city(bornCity);
            user.setUser_living_city(livingCity);
            user.setUser_phone(phone);

            boolean rs = userService.updateUserInfo(user);
            if (rs){
                session.removeAttribute("user");
                session.setAttribute("user",user);
                return "success";
            }else
                return "fail";
        }
    }


    /*上传头像  仅修改普通用户头像   公司不做修改*/
    @RequestMapping("uploadLogo")
    @ResponseBody
    public String uploadLogo(@RequestParam(value = "picFile",required = false)MultipartFile picFile,
                             HttpServletRequest request,HttpSession session) throws IOException {
        String role = (String) session.getAttribute("role");
        if (role==null){
            return null;
        }

        //获取webapp的路径
        String pathRoot = request.getSession().getServletContext().getRealPath("");
        String path = "";

        if (!picFile.isEmpty()){
            //随机生成uuid作为图片的名称
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            //获取图片的格式
            String contentType = picFile.getContentType();
            //获取图片的原始名称
            String originalFilename = picFile.getOriginalFilename();
            //获取图片的后缀名
            String imgname = contentType.substring(contentType.indexOf("/") + 1);

            path = "/logo/" + uuid + "." + imgname;

            picFile.transferTo(new File(pathRoot + path));
            String userLogo = "logo/" + uuid + "." + imgname;

            if (role.equals("person")){
                User user = (User) session.getAttribute("user");
                if (user==null)
                    return null;

                user.setUser_photo(userLogo);
                userService.uploadLogo(user);
                System.out.println("操作成功！");

            }else {
                //公司没做
                return null;
            }
        }
        return null;
    }
}




















