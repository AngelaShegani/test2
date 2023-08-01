package controllers;

import jakarta.servlet.http.HttpSession;
import models.LoginUser;
import models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import services.UserService;


@Controller
public class LoginController {

    @Autowired
    private UserService userServ;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "loginReg.jsp";
    }

    @PostMapping("/register")
    public String register(@Validated @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {

        userServ.register(newUser, result);

        if (result.hasErrors()) {

            model.addAttribute("newLogin", new LoginUser());
            return "loginReg.jsp";
        }
        else {
            session.setAttribute("user_id", newUser.getId());
            return "redirect:/home";
        }


    }

    @PostMapping("/login")
    public String login(@Validated @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
                        HttpSession session) {


        User user = userServ.login(newLogin, result);

        if (result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "loginReg.jsp";
        }else {
            session.setAttribute("user_id", user.getId());
            return "redirect:/home";
        }

    }

    @GetMapping("/logout")
    public String logout(HttpSession s) {
        //this will clear everything in session
        s.invalidate();
        return "redirect:/";
    }
}



