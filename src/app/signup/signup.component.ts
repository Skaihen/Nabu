import { Component } from '@angular/core'
import { FormBuilder } from '@angular/forms'
import { SupabaseService } from 'src/app/services/supabase.service'
import { HelperTextInterface } from 'src/app/types/HelperTextInterface'

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html'
})
export class SignupComponent {
  loading: boolean = false
  helperText: HelperTextInterface = { error: false, text: null }

  signUpForm = this.formBuilder.group({
    email: '',
    password: '',
    confirmPassword: ''
  })

  constructor(
    private readonly supabase: SupabaseService,
    private readonly formBuilder: FormBuilder
  ) {}

  async onSignUpSubmit(): Promise<void> {
    try {
      this.loading = true

      const email = this.signUpForm.value.email as string
      const password = this.signUpForm.value.password as string
      const confirmPassword = this.signUpForm.value.confirmPassword as string

      if (password !== confirmPassword) {
        this.helperText = { error: true, text: 'Passwords do not match' }
        return
      }

      const { error } = await this.supabase.signUpWithPassword(email, password)

      if (error) {
        throw error
      } else {
        this.helperText = {
          error: false,
          text: 'An email has been sent to you for verification!'
        }
      }
    } catch (error) {
      if (error instanceof Error) {
        this.helperText = { error: true, text: error.message }
      }
    } finally {
      this.signUpForm.reset()
      this.loading = false
    }
  }
}
