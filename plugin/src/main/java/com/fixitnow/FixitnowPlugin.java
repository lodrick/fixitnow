/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package com.fixitnow;


/**
 * A simple 'hello world' plugin.
 */
public class FixitnowPlugin implements Plugin<Project> {
    public void apply(Project project) {
        // Register a task
        project.getTasks().register("greeting", task -> {
            task.doLast(s -> System.out.println("Hello from plugin 'com.fixitnow.greeting'"));
        });
    }
}
