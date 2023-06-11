import { Injectable } from '@angular/core'
import { BehaviorSubject } from 'rxjs'
import { SupabaseService } from 'src/app/services/supabase.service'
import { TodoInterface } from 'src/app/types/TodoInterface'

@Injectable({
  providedIn: 'root'
})
export class UtilsService {
  loading = new BehaviorSubject<boolean>(false)

  todosList = new BehaviorSubject<TodoInterface[]>([])

  todoErrorText = new BehaviorSubject<string>('')

  constructor(private readonly supabase: SupabaseService) {}

  toggleLoading(loading: boolean) {
    this.loading.next(loading)
  }

  async fetchTodos(): Promise<void> {
    try {
      this.toggleLoading(true)

      const { data, error } = await this.supabase.todos

      if (error) throw error

      this.todosList.next(data as TodoInterface[])
    } catch (error) {
      if (error instanceof Error) {
        this.todoErrorText.next(error.message)
      }
    } finally {
      this.toggleLoading(false)
    }
  }
}
