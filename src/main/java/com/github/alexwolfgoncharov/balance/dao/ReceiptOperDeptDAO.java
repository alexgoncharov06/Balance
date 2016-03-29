package com.github.alexwolfgoncharov.balance.dao;

import com.github.alexwolfgoncharov.balance.structure.Contracts;
import com.github.alexwolfgoncharov.balance.structure.Departments;
import com.github.alexwolfgoncharov.balance.structure.ReceiptOperationsContracts;
import com.github.alexwolfgoncharov.balance.structure.ReceiptOperationsDepartments;

import java.util.Date;
import java.util.List;

/**
 * Created by alexwolf on 31.01.16.
 */
public interface ReceiptOperDeptDAO {
    long add(ReceiptOperationsDepartments contract);
    ReceiptOperationsDepartments getById(long ID);
    void modify(ReceiptOperationsDepartments contract);
    void delete(ReceiptOperationsDepartments contract);

    //    Все записи по поступлению для контракта
    List<ReceiptOperationsDepartments> getAllbyOperContr(ReceiptOperationsContracts receiptOperationsContracts);
    //    1 - Все записи
    List<ReceiptOperationsDepartments> getAll();
    //    2 - все записи по выбранному Департаменту
    List<ReceiptOperationsDepartments> getAllbyDept(Departments department);
    //    3 - записи за выбранный период по всем Департаментам (все записи за выбранный период)
    List<ReceiptOperationsDepartments> getAllByDate(Date start, Date end);
    //    4 - записи за выбранный период по выбранному Департаменту
    List<ReceiptOperationsDepartments> getAllByDateDepartment(Date start, Date end, Departments departments);
    //    5 - все записи по контракту
    List<ReceiptOperationsDepartments> getAllByContract(Contracts contracts);
    //    6 - все записи по контракту  для выбранного Департамента
    List<ReceiptOperationsDepartments> getAllByContractAndDep(Contracts contracts, Departments departments);




}
