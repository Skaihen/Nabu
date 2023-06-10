import { Component } from '@angular/core'
import { FormBuilder } from '@angular/forms'
import { SupabaseService } from 'src/app/services/supabase.service'
import { HelperTextInterface } from 'src/app/types/HelperTextInterface'

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})
export class LoginComponent {
  loading: boolean = false
  helperText: HelperTextInterface = { error: false, text: null }

  signInForm = this.formBuilder.group({
    email: '',
    password: ''
  })

  constructor(
    private readonly supabase: SupabaseService,
    private readonly formBuilder: FormBuilder
  ) {}

  async onSignInSubmit(): Promise<void> {
    try {
      this.loading = true

      const email = this.signInForm.value.email as string
      const password = this.signInForm.value.password as string

      const { error } = await this.supabase.signInWithPassword(email, password)

      if (error) throw error
    } catch (error) {
      if (error instanceof Error) {
        this.helperText = { error: true, text: error.message }
      }
    } finally {
      this.signInForm.reset()
      this.loading = false
    }
  }
}
