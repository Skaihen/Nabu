import { Injectable } from '@angular/core'
import { BehaviorSubject } from 'rxjs'
import { SupabaseService } from 'src/app/services/supabase.service'
import { TodoInterface } from 'src/app/types/TodoInterface'

@Injectable({
  providedIn: 'root'
})
export class UtilsService {
  loading = new BehaviorSubject<boolean>(false)

  todoAppliedFilters = new BehaviorSubject<boolean>(false)

  todoList = new BehaviorSubject<TodoInterface[]>([])

  todoErrorText = new BehaviorSubject<string>('')

  constructor(private readonly supabase: SupabaseService) {}

  toggleLoading(loading: boolean) {
    this.loading.next(loading)
  }

  async fetchTodos(onlySelected: boolean): Promise<void> {
    try {
      this.toggleLoading(true)

      const { data, error } = await this.supabase.todos

      if (error) throw error

      if (onlySelected) {
        let selectedTodos = (data as TodoInterface[]).filter(
          (todo: TodoInterface) => {
            return todo.is_selected === true
          }
        )

        this.todoList.next(selectedTodos as TodoInterface[])
      } else {
        this.todoList.next(data as TodoInterface[])
      }
    } catch (error) {
      if (error instanceof Error) {
        this.todoErrorText.next(error.message)
      }
    } finally {
      this.toggleLoading(false)
    }
  }
}
