import { Component, Input, OnInit } from '@angular/core'
import { SupabaseService } from 'src/app/services/supabase.service'
import { TodoInterface } from 'src/app/types/TodoInterface'

@Component({
  selector: 'app-todo',
  templateUrl: './todo.component.html'
})
export class TodoComponent implements OnInit {
  @Input({ required: true }) todo!: TodoInterface

  isSelected!: boolean

  constructor(private readonly supabase: SupabaseService) {}

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
}
