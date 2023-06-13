import { Component } from '@angular/core'
import { Router } from '@angular/router'
import { SupabaseService } from 'src/app/services/supabase.service'

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html'
})
export class NavbarComponent {
  constructor(
    private readonly supabase: SupabaseService,
    private readonly router: Router
  ) {}

  async signOut(): Promise<void> {
    await this.supabase.signOut()
    this.router.navigate(['/'], { replaceUrl: true })
  }
}
