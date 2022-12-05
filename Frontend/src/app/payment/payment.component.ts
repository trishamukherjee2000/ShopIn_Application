import { Component,OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MainserviceService } from '../mainservice.service';

@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.css']
})
export class PaymentComponent  implements OnInit{
  total : any = null;

  constructor(private router: Router,private mainService: MainserviceService){}
  
  ngOnInit() {
    if(!localStorage.getItem('user'))
    {
      this.router.navigate(['/']);
    }
    if(localStorage.getItem('PaymentPrice')!=null){
      this.total = localStorage.getItem('PaymentPrice');
    }
    

  }

}
