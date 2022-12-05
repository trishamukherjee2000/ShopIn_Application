import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MainpageComponent } from './mainpage/mainpage.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { AdminLoginComponent } from './admin-login/admin-login.component';
import { PaymentComponent } from './payment/payment.component';
import { FooterComponent } from './footer/footer.component';
import { HeaderComponent } from './header/header.component';
import { HeaderLoginComponent } from './header-login/header-login.component';
import { BagComponent } from './bag/bag.component';
import { MyprofileComponent } from './myprofile/myprofile.component';
import { AdminHeaderComponent } from './admin-header/admin-header.component';
import { AdminMainpageComponent } from './admin-mainpage/admin-mainpage.component';
import { MainserviceService } from './mainservice.service';
import { HttpClientModule } from '@angular/common/http';
import { AdminworkComponent } from './adminwork/adminwork.component';
import {FormsModule,ReactiveFormsModule} from '@angular/forms';
import { ProductDetailsComponent } from './product-details/product-details.component'



@NgModule({
  declarations: [
    AppComponent,
    MainpageComponent,
    LoginComponent,
    RegisterComponent,
    AdminLoginComponent,
    PaymentComponent,
    FooterComponent,
    HeaderComponent,
    HeaderLoginComponent,
    BagComponent,
    MyprofileComponent,
    AdminHeaderComponent,
    AdminMainpageComponent,
    AdminworkComponent,
    ProductDetailsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [MainserviceService],
  bootstrap: [AppComponent]
})
export class AppModule { }
