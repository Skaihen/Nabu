import { Component, Input, OnInit } from '@angular/core'
import { SupabaseService } from 'src/app/services/supabase.service'
import { TodoInterface } from 'src/app/types/TodoInterface'

@Component({
  selector: 'app-todo',
  templateUrl: './todo.component.html'
})
export class TodoComponent implements OnInit {
  @Input({ required: true }) todo!: TodoInterface

  isMarked!: boolean

  constructor(private readonly supabase: SupabaseService) {}

  ngOnInit(): void {
    this.isMarked = this.todo.is_marked
  }

  async toggleMarked(): Promise<void> {
    try {
      const { data, error } = await this.supabase.toggleTodo(
        this.todo.id,
        this.isMarked
      )
      if (error) throw error
      this.isMarked = data.is_marked
    } catch (error) {
      if (error instanceof Error) {
        console.log('error', error)
      }
    }
  }
}
