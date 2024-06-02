package com.example.expence.task;

/**
 * @author yourkin666
 * @date 2024/05/30/10:22
 * @description
 */
import org.flowable.engine.delegate.TaskListener;
import org.flowable.task.service.delegate.DelegateTask;

public class ManagerTaskHandler implements TaskListener {

    @Override
    public void notify(DelegateTask delegateTask) {
        delegateTask.setAssignee("ad");
    }

}