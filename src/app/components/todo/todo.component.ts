import { Component, Input, OnInit } from '@angular/core'
import { SupabaseService } from 'src/app/services/supabase.service'
import { TodoInterface } from 'src/app/types/TodoInterface'

@Component({
  selector: 'app-todo',
  templateUrl: './todo.component.html'
})
export class TodoComponent implements OnInit {
  @Input({ required: true }) todo!: TodoInterface

  loading: boolean = false
  errorText: string = ''
  isCompleted!: boolean

  constructor(private readonly supabase: SupabaseService) {}

  ngOnInit(): void {
    this.isCompleted = this.todo.is_complete
  }

  async toggleCompleted(): Promise<void> {
    try {
      const { data, error } = await this.supabase.toggleTodo(
        this.todo.id,
        this.isCompleted
      )
      if (error) throw error
      this.isCompleted = data.is_complete
    } catch (error) {
      if (error instanceof Error) {
        console.log('error', error)
      }
    }
  }

  /*   async deleteTodo(): Promise<void> {
    try {
      this.loading = true

      await this.supabase.deleteTodo(this.todo.id)
      this.todos = this.todos.filter((x: any) => x.id != id)
    } catch (error) {
      if (error instanceof Error) {
        this.errorText = error.message
      }
    } finally {
      this.loading = false
    }
  } */
}
