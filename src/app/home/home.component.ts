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

  showOnlySelected = false

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
    this.utils.todoAppliedFilters.subscribe(
      (todoAppliedFilters) =>
        (this.showOnlySelected = todoAppliedFilters.showOnlySelectedTodos)
    )
    await this.utils.fetchTodos()
  }

  async toggleShowOnlySelected(): Promise<void> {
    this.utils.todoAppliedFilters.next({
      showOnlySelectedTodos: !this.showOnlySelected
    })
    await this.utils.fetchTodos()
  }
}
