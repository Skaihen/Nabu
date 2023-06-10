import { Component, OnInit } from '@angular/core'
import { FormBuilder } from '@angular/forms'
import { SupabaseService } from 'src/app/services/supabase.service'
import { TodoInterface } from 'src/app/types/TodoInterface'

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html'
})
export class HomeComponent implements OnInit {
  loading: boolean = false
  errorText: string = ''
  todos: TodoInterface[] = []

  session = this.supabase.session

  createTaskForm = this.formBuilder.group({
    newTaskText: '',
    taskValue: 1,
    estimatedTime: 1
  })

  constructor(
    private readonly supabase: SupabaseService,
    private readonly formBuilder: FormBuilder
  ) {}
  async ngOnInit(): Promise<void> {
    await this.fetchTodos()
  }

  async fetchTodos(): Promise<void> {
    try {
      this.loading = true

      const { data, error } = await this.supabase.todos

      if (error) throw error

      this.todos = data as TodoInterface[]
    } catch (error) {
      if (error instanceof Error) {
        this.errorText = error.message
      }
    } finally {
      this.loading = false
    }
  }

  async addTodo(): Promise<void> {
    try {
      this.loading = true

      const taskText = this.createTaskForm.value.newTaskText as string
      const taskValue = this.createTaskForm.value.taskValue as number
      const estimatedTime = this.createTaskForm.value.estimatedTime as number

      let task = taskText.trim()

      if (task.length) {
        const { data, error } = await this.supabase.editTodo(
          task,
          taskValue,
          estimatedTime
        )

        if (error) throw error

        this.todos = [...this.todos, data as TodoInterface]
      }
    } catch (error) {
      if (error instanceof Error) {
        this.errorText = error.message
      }
    } finally {
      this.createTaskForm.reset()
      this.loading = false
    }
  }
}
