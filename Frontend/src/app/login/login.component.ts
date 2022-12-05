import { Component,OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgForm } from '@angular/forms';
import { MainserviceService } from '../mainservice.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})




export class LoginComponent implements OnInit{
  

  constructor(private router: Router,private mainService: MainserviceService){}
  ngOnInit(): void {
    if(localStorage.getItem('user') )
    {
      this.router.navigate(['/']);
    }
    else if( localStorage.getItem('admin'))
    {
      this.router.navigate(['/adminmainpage']);
    }

    
  }


  submit(login:NgForm){
   
    this.mainService.GetUserCheck(login.value.email,login.value.password).subscribe({
      next:  (status) => {
       
        if(status!=0){
          alert("Logged in SuccessFully");
          localStorage.setItem('user', status.toString());
          this.router.navigate(['/']);
        }
        else
          alert("Error !!");
      },
      error: (error) => {
        alert("Error !!");
      }
    })
    
  }
}
