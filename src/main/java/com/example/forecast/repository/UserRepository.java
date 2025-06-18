//ユーザー情報（usersテーブル）にアクセスするリポジトリです。
package com.example.forecast.repository;

import com.example.forecast.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findByEmail(String email);

    // ★ 追加: userId の降順で並べて取得
    List<User> findAllByOrderByUserIdAsc();
}
