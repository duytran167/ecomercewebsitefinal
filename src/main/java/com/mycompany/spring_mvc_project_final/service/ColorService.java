/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ColorEntity;
import com.mycompany.spring_mvc_project_final.entities.SizeEntity;
import com.mycompany.spring_mvc_project_final.repository.ColorRepository;
import com.mycompany.spring_mvc_project_final.repository.SizeRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class ColorService {
    @Autowired
    private ColorRepository colorRepository;
    
    public List<ColorEntity> getColor(){
        return (List<ColorEntity>) colorRepository.findAll();
    }
}
