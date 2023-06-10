import { Component, Input } from '@angular/core'

@Component({
  selector: 'app-loading-screen',
  templateUrl: './loading-screen.component.html'
})
export class LoadingScreenComponent {
  @Input({ required: true }) loading!: boolean
}
