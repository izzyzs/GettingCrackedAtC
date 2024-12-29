# **Ideas for the To-Do List**

### What I Need to Know

1. basics of File I/O ✅ (complete)

    - Opening file
    - closing file
    - reading from file-- and how to organize and store said information.
    - writing to file in an organized way

2. Data Structures

    - How exactly will the tasks be stored?
    - What exactly will a task 'struct' look like?

    - Decision
      a. Task has 4 parts
      i. task*num: int
      ii. task_name: char *
      iii. task*description: char *
      iv. task*completed: bool
      b. The task "database" will be a txt file with 4 functions for each one of the CRUD operations
      i. create_task_db()
      ii. read_task_db()
      iii. update_task_db()
      iv. delete_task_db()
      *(Note)\_ implementation of said functions requires the creation of other helper functions, one of the beauties of C :)
