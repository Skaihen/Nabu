import { Component, OnInit } from '@angular/core'
import { UtilsService } from 'src/app/services/utils.service'

@Component({
  selector: 'app-loading-screen',
  templateUrl: './loading-screen.component.html'
})
export class LoadingScreenComponent implements OnInit {
  loading!: boolean

  constructor(private readonly utils: UtilsService) {}

  ngOnInit(): void {
    this.utils.loading.subscribe((loading) => (this.loading = loading))
  }
}
