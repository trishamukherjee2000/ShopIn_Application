import { Component ,OnInit} from '@angular/core';
import { Router } from '@angular/router';
import { MainserviceService } from '../mainservice.service';
import { Order } from '../Interfaces/Order';
import { Bag } from '../Interfaces/Bag';
import { observable } from 'rxjs';

@Component({
  selector: 'app-bag',
  templateUrl: './bag.component.html',
  styleUrls: ['./bag.component.css']
})
export class BagComponent implements OnInit {
  data:Order[]=[];
  bagdata:any=[];

  checkoutTotal:number=5;

  constructor(private router: Router,private mainService: MainserviceService){}

  ngOnInit() {
    if(!localStorage.getItem('user'))
    {
      this.router.navigate(['/']);
    }
    this.getOrdersofUser();

  }
  GoToPage()
  {
    localStorage.setItem('PaymentPrice',String(this.checkoutTotal));
    this.router.navigate(['/payment']);
  }

  mult(a:number,b:number):number
  {
    return (a*b);
  }
  
  getOrdersofUser() {
    
    this.mainService.getOrderByUser(String(localStorage.getItem('user'))).subscribe({
       next:  (data) => {
        this.data = data;
        
        for(let i=0;i<this.data.length;i++)
        {
          this.mainService.GetProductDetailsById(this.data[i].productId).subscribe({
            next:  (res) => {
              //getting specified product details
              var Tp:number=this.mult( res.price.valueOf() ,this.data[i].noOfItems.valueOf());
              let ob={
              "productName": res.productName,
              "noOfItems": this.data[i].noOfItems,
              "totalprice" : Tp,
              "imgurl": res.imgUrl
              }
              this.checkoutTotal=this.checkoutTotal.valueOf()+Tp;
              this.bagdata.push(ob);
            
            },
            error: (error) => {
    
            }
          })
        }
              



       },
       error: (error) => {

       }
     })
   }
}
