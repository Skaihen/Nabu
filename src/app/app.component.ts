import { Component, OnInit } from '@angular/core'
import { Router } from '@angular/router'
import { SupabaseService } from 'src/app/services/supabase.service'

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent implements OnInit {
  title = 'Nabu'

  constructor(
    private readonly supabase: SupabaseService,
    private readonly router: Router
  ) {}

  ngOnInit() {
    this.supabase.authChanges((_, session) => {
      if (session?.user) {
        this.router.navigate(['/home'])
      }
    })
  }
}
