package com.github.alexwolfgoncharov.balance.services;

import com.github.alexwolfgoncharov.balance.structure.ContrAgents;
import com.github.alexwolfgoncharov.balance.structure.Contracts;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by alexwolf on 01.02.16.
 */
@Service
public interface ContractsService {
    void add(Contracts contract);
    Contracts getById(int ID);
    List<Contracts> getAll();
    List<Contracts> getAllbyContAgent(ContrAgents contrAgents);
    void modify (Contracts contract);
    void delete(Contracts contract);
}
