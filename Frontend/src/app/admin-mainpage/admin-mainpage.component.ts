import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MainserviceService } from '../mainservice.service';
@Component({
  selector: 'app-admin-mainpage',
  templateUrl: './admin-mainpage.component.html',
  styleUrls: ['./admin-mainpage.component.css']
})
export class AdminMainpageComponent implements OnInit{
  constructor(private router: Router,private mainService: MainserviceService){

  }

  ngOnInit(): void {
    if(!localStorage.getItem('admin'))
    {
      this.router.navigate(['/']);
    }
  }

}
