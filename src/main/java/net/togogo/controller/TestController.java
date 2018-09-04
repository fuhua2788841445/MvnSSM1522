package net.togogo.controller;

import net.togogo.bean.User;
import net.togogo.service.UserService;
import net.togogo.utis.Md5;
import net.togogo.utis.newMD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.NoSuchAlgorithmException;

@Controller
@RequestMapping("/ajax")
public class TestController {
    @Autowired
    private UserService userService;

    @RequestMapping("/post")
    @ResponseBody
    public String post(@RequestBody User user) throws NoSuchAlgorithmException {
        user.setUser_password(newMD5.generateCode(user.getUser_password()));
        int count = userService.addUser(user);
        if (count > 0) {
            return "true";
        }
        return "false";
    }
}
