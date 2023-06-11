import { Component } from '@angular/core'
import { FormBuilder } from '@angular/forms'
import { SupabaseService } from 'src/app/services/supabase.service'
import { UtilsService } from 'src/app/services/utils.service'

@Component({
  selector: 'app-todo-modal',
  templateUrl: './todo-modal.component.html'
})
export class TodoModalComponent {
  createTaskForm = this.formBuilder.group({
    newTaskText: '',
    estimatedTime: 1,
    taskValue: 1
  })

  constructor(
    private readonly supabase: SupabaseService,
    private readonly formBuilder: FormBuilder,
    private readonly utils: UtilsService
  ) {}

  async addTodo(): Promise<void> {
    try {
      this.utils.toggleLoading(true)

      const taskText = this.createTaskForm.value.newTaskText as string
      const estimatedTime = this.createTaskForm.value.estimatedTime as number
      const taskValue = this.createTaskForm.value.taskValue as number

      let task = taskText.trim()

      if (task.length) {
        const { error } = await this.supabase.addTodo(
          task,
          estimatedTime,
          taskValue
        )

        if (error) throw error
        this.utils.fetchTodos()
      }
    } catch (error) {
      if (error instanceof Error) {
        this.utils.todoErrorText.next(error.message)
      }
    } finally {
      this.createTaskForm.reset()
      this.utils.toggleLoading(false)
    }
  }

  /*   async deleteTodo(): Promise<void> {
    try {
      this.utils.toggleLoading(true)

      await this.supabase.deleteTodo(this.todo.id)
      this.todos = this.todos.filter((x: any) => x.id != id)
    } catch (error) {
      if (error instanceof Error) {
        this.todoErrorText = error.message
      }
    } finally {
      this.utils.toggleLoading(false)
    }
  } */
}
