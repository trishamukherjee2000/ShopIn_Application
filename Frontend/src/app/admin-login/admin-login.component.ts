import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { MainserviceService } from '../mainservice.service';


@Component({
  selector: 'app-admin-login',
  templateUrl: './admin-login.component.html',
  styleUrls: ['./admin-login.component.css']
})
export class AdminLoginComponent implements OnInit{
  constructor(private router: Router,private mainService: MainserviceService){  }
  ngOnInit() {
    if(localStorage.getItem('user') )
    {
      this.router.navigate(['/']);
    }
    else if( localStorage.getItem('admin'))
    {
      this.router.navigate(['/adminmainpage']);
    }
  }

  submit(admin:NgForm)
  {
    if(admin.value.username=="admin@123" && admin.value.password=="admin@123")
    {
      localStorage.clear();
      localStorage.setItem('admin','admin@123');
      this.router.navigate(['/adminmainpage']);
    }else
    {
      alert("Wrong credential !");
      this.router.navigate(['/admin']);
    }

  }

}
