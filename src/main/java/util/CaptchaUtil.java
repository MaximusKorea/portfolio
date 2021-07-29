package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.apiclub.captcha.Captcha;
import cn.apiclub.captcha.audio.AudioCaptcha;
import cn.apiclub.captcha.backgrounds.GradiatedBackgroundProducer;
import cn.apiclub.captcha.servlet.CaptchaServletUtil;
import cn.apiclub.captcha.text.producer.NumbersAnswerProducer;

public class CaptchaUtil{
    public CaptchaUtil() {}
    public void captchaImg(HttpServletRequest request, HttpServletResponse response){
        Captcha captcha = new Captcha.Builder(200,  60)
							        .addText(new NumbersAnswerProducer(6))
							        .addNoise().addNoise().addNoise()
							        .addBackground(new GradiatedBackgroundProducer())
							        .addBorder()
							        .build();
        
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Max-Age", 0);
        response.setContentType("image/png");
        
        CaptchaServletUtil.writeImage(response,  captcha.getImage());;
        request.getSession().setAttribute("captcha", captcha.getAnswer());
    }
    
    public void captchaAudio(HttpServletRequest request, HttpServletResponse response){
        String getAnswer = (String) request.getSession().getAttribute("captcha");
        AudioCaptcha ac = new AudioCaptcha.Builder()
									        .addAnswer(new SetTextProducer(getAnswer))
									        .addVoice()
									        .addNoise()
									        .build();
        
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Max-Age", 0);
    
        CaptchaServletUtil.writeAudio(response,  ac.getChallenge());;
        request.getSession().setAttribute("captcha", ac.getAnswer());
    }
}
