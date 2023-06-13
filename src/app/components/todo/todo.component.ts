import { Component, Input, OnInit } from '@angular/core'
import { SupabaseService } from 'src/app/services/supabase.service'
import { UtilsService } from 'src/app/services/utils.service'
import { TodoInterface } from 'src/app/types/TodoInterface'

@Component({
  selector: 'app-todo',
  templateUrl: './todo.component.html'
})
export class TodoComponent implements OnInit {
  @Input({ required: true }) todo!: TodoInterface

  isSelected!: boolean

  constructor(
    private readonly supabase: SupabaseService,
    private readonly utils: UtilsService
  ) {}

  ngOnInit(): void {
    this.isSelected = this.todo.is_selected
  }

  async toggleSelected(): Promise<void> {
    try {
      const { data, error } = await this.supabase.toggleTodo(
        this.todo.id,
        this.isSelected
      )
      if (error) throw error
      this.isSelected = data.is_selected
    } catch (error) {
      if (error instanceof Error) {
        console.log('error', error)
      }
    }
  }

  async deleteTodo(): Promise<void> {
    try {
      this.utils.toggleLoading(true)

      const { error } = await this.supabase.deleteTodo(this.todo.id)
      if (error) throw error
      await this.utils.fetchTodos()
    } catch (error) {
      if (error instanceof Error) {
        console.log('error', error)
      }
    } finally {
      this.utils.toggleLoading(false)
    }
  }
}
