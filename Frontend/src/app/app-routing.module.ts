import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { AdminLoginComponent } from './admin-login/admin-login.component';
import { PaymentComponent } from './payment/payment.component';
import { MainpageComponent } from './mainpage/mainpage.component';
import { BagComponent } from './bag/bag.component';
import { MyprofileComponent } from './myprofile/myprofile.component';
import { AdminHeaderComponent } from './admin-header/admin-header.component';
import { AdminMainpageComponent } from './admin-mainpage/admin-mainpage.component';
import { AdminworkComponent } from './adminwork/adminwork.component';


const routes: Routes = [
  { path: '', component: MainpageComponent },
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent },
    { path: 'admin', component: AdminLoginComponent },
    { path: 'payment', component: PaymentComponent },
    { path: 'bag', component: BagComponent },
    { path: 'myprofile', component: MyprofileComponent },
    { path: 'adminheader', component:AdminHeaderComponent },
    { path: 'adminmainpage', component:AdminMainpageComponent },
    { path: 'adminwork', component:AdminworkComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
