import { Component, OnInit } from '@angular/core'
import { SupabaseService } from 'src/app/services/supabase.service'
import { UtilsService } from 'src/app/services/utils.service'
import { TodoInterface } from 'src/app/types/TodoInterface'

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html'
})
export class HomeComponent implements OnInit {
  todoErrorText?: string
  todoList?: TodoInterface[]

  session = this.supabase.session

  constructor(
    private readonly supabase: SupabaseService,
    private readonly utils: UtilsService
  ) {}
  async ngOnInit(): Promise<void> {
    this.utils.todoErrorText.subscribe(
      (todoErrorText) => (this.todoErrorText = todoErrorText)
    )
    this.utils.todoList.subscribe((todoList) => (this.todoList = todoList))
    await this.utils.fetchTodos(false)
  }
}
