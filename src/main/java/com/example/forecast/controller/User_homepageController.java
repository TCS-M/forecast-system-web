// ログイン後のユーザーホーム画面への遷移を管理するコントローラーです。
package com.example.forecast.controller;

import com.example.forecast.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class User_homepageController {

    // ユーザーホームページを表示する
    @GetMapping("/user_homepage")
    public String userHomepage(HttpSession session, Model model) {
        Object userObj = session.getAttribute("loggedInUser");
        if (userObj instanceof User user) {
            model.addAttribute("username", user.getName());
        }
        return "user_homepage";
    }

    // 天気と販売詳細ページを表示する
    @GetMapping("/weather_detail")
    public String weatherDetail(@RequestParam("date") String date, Model model) {
        // TODO: 日付に基づいて天気と販売データを取得する処理を追加する
        // モックデータを設定（仮）
        model.addAttribute("detail", new Object()); // 本来はWeatherDetailなどのクラスのインスタンス

        return "weather_detail";  // Thymeleafテンプレート "weather_detail.html" を返す
    }
}


