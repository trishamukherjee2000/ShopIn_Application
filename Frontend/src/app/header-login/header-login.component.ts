import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Category } from './Category';
import { MainserviceService } from '../mainservice.service';

@Component({
  selector: 'app-header-login',
  templateUrl: './header-login.component.html',
  styleUrls: ['./header-login.component.css']
})
export class HeaderLoginComponent implements OnInit {
  data : Category[]=[];
  errorMessage : string="";

  constructor(private router: Router,private mainService: MainserviceService){}
  ProfileRouting(){
    this.router.navigate(['/myprofile']);
  }
  Logout(){
    localStorage.clear();
    window.location.href='/';

  }

  getAllCategories() {
    console.log("OK")
    this.mainService.getAllCategories().subscribe({
       next:  category => this.data = category,
       error:error => this.errorMessage = <any>error
     })
   }
   ngOnInit() {
     this.getAllCategories();
   }
}
