import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { OnInit } from '@angular/core';
import { MainserviceService } from '../mainservice.service';
import { Product } from './Product';


@Component({
  selector: 'app-mainpage',
  templateUrl: './mainpage.component.html',
  styleUrls: ['./mainpage.component.css']
})
export class MainpageComponent implements OnInit{
  data : Product[]=[];
  errorMessage : string="";
  islogin : boolean=false;
  constructor(private router: Router,private mainService: MainserviceService){}

  AddtoCart(pid:String):void{
    if(this.islogin)
    {
      console.log(typeof(JSON.stringify(localStorage.getItem('user')).toString()))
      this.mainService.AddOrders(String(localStorage.getItem('user')),1,pid).subscribe({
        next:  status =>{

        },
        error:error => {

        }
      })
      this.router.navigate(['/bag']);
    }  
    else
      this.router.navigate(['/login']);
  }
  BuyNow():void{
    if(this.islogin)
      this.router.navigate(['/bag']);
    else
    this.router.navigate(['/login']);
  }

  getProducts() {
    //console.log("OK")
    this.mainService.getProducts().subscribe({
       next:  products => this.data = products,
       error:error => this.errorMessage = <any>error
     })
   }

   
   ngOnInit() {
        if(localStorage.getItem('user'))
          this.islogin=true;
        else if(localStorage.getItem('admin'))
        {
          this.islogin=false;
          this.router.navigate(['/adminmainpage']);
        }  
        else
          this.islogin=false;
        
        this.getProducts();
   }
}
