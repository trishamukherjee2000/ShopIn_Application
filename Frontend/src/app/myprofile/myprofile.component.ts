import { Component,OnInit } from '@angular/core';
import { MainserviceService } from '../mainservice.service';
import { Router } from '@angular/router';


@Component({
  selector: 'app-myprofile',
  templateUrl: './myprofile.component.html',
  styleUrls: ['./myprofile.component.css']
})
export class MyprofileComponent implements OnInit {

  constructor(private router: Router,private mainService: MainserviceService){}
  ngOnInit() {
    if(!localStorage.getItem('user'))
    {
      this.router.navigate(['/']);
    }

  }

}
