/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<UserEntity,Integer>{
    
    //public UsersEntity login(String username, String password);
    
    
    @Query(value="select * FROM users ", nativeQuery = true)
    List<UserEntity> getAllUsers();
     @Query("select u FROM UserEntity u WHERE u.password = ?1")
    UserEntity findByPassword(@Param("password") String password);
    @Query("SELECT u FROM UserEntity u WHERE u.email = ?1")
    UserEntity findByEmail(String email);
     
    
    @Query("select u FROM UserEntity u WHERE username = ?1")
    UserEntity findByUsername(String username);
    
    
    
    @Query("select u FROM UserEntity u WHERE name = ?1")
    UserEntity findByName(String name);

    @Query("select u FROM UserEntity u WHERE id = ?1")
    UserEntity findById(int id);

}