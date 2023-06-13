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
    estHours: 0,
    estMinutes: 5,
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
      const estHours = this.createTaskForm.value.estHours as number
      const estMinutes = this.createTaskForm.value.estMinutes as number
      const taskValue = this.createTaskForm.value.taskValue as number

      let task = taskText.trim()

      if (task.length) {
        const { error } = await this.supabase.addTodo(
          task,
          estHours,
          estMinutes,
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
}
