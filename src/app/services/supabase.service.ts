import { Injectable } from '@angular/core'
import {
  AuthChangeEvent,
  AuthSession,
  Session,
  SupabaseClient,
  createClient
} from '@supabase/supabase-js'
import { environment } from 'src/environments/environment'

@Injectable({
  providedIn: 'root'
})
export class SupabaseService {
  private supabase: SupabaseClient
  _session: AuthSession | null = null

  constructor() {
    this.supabase = createClient(
      environment.supabaseUrl,
      environment.supabaseKey
    )
  }

  authChanges(
    callback: (event: AuthChangeEvent, session: Session | null) => void
  ) {
    return this.supabase.auth.onAuthStateChange(callback)
  }

  get session() {
    this.supabase.auth.getSession().then(({ data }) => {
      this._session = data.session
    })
    return this._session
  }

  signInWithPassword(email: string, password: string) {
    return this.supabase.auth.signInWithPassword({ email, password })
  }

  signUpWithPassword(email: string, password: string) {
    return this.supabase.auth.signUp({ email, password })
  }

  signOut() {
    return this.supabase.auth.signOut()
  }

  get todos() {
    return this.supabase
      .from('todos')
      .select('*')
      .eq('user_id', this.session?.user.id)
      .order('task_value', { ascending: false })
  }

  editTodo(taskText: string, estimatedTime: number, taskValue: number) {
    return this.supabase
      .from('todos')
      .insert({
        user_id: this.session?.user.id,
        task: taskText,
        estimated_time: estimatedTime,
        task_value: taskValue
      })
      .select()
      .single()
  }

  toggleTodo(todoId: number, isCompleted: boolean) {
    return this.supabase
      .from('todos')
      .update({ is_complete: !isCompleted })
      .eq('id', todoId)
      .select('is_complete')
      .single()
  }

  deleteTodo(id: number) {
    this.supabase.from('todos').delete().eq('id', id)
  }
}
