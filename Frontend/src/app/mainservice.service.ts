import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, tap } from 'rxjs/operators';
import { Product } from './mainpage/Product';
import { Category } from './header-login/Category';
import { Order } from './Interfaces/Order';


@Injectable({
  providedIn: 'root'
})
export class MainserviceService {

  constructor(private http: HttpClient) { }


  getProducts(): Observable<Product[]> {
    return this.http.get<Product[]>('http://localhost:5223/api/Main/GetAllProducts').pipe(
      tap((data: any) => console.log('Data Fetched:' + JSON.stringify(data))),
      catchError(this.handleError));
  }

  getAllCategories(): Observable<Category[]>{
    return this.http.get<Category[]>('http://localhost:5223/api/Main/GetAllCategories').pipe(
      tap((data: any) => console.log('Data Fetched:' + JSON.stringify(data))),
      catchError(this.handleError));
  }

  GetProductDetailsById(productId: String): Observable<Product>{
    return this.http.get<Product[]>('http://localhost:5223/api/Main/GetProductDetailsById?PId='+productId).pipe(
      tap((data: any) => console.log('Data Fetched:' + JSON.stringify(data))),
      catchError(this.handleError));
  }

  GetProductsByCategoryId(categoryId: String): Observable<Product[]>{
    return this.http.get<Product[]>('http://localhost:5223/api/Main/GetProductsByCategoryId?CId='+categoryId).pipe(
      tap((data: any) => console.log('Data Fetched:' + JSON.stringify(data))),
      catchError(this.handleError));
  }

  GetAllOrdersByUserId(userId: Number): Observable<Order[]>{
    return this.http.get<Order[]>('http://localhost:5223/api/Main/GetAllOrdersByUserId?UId='+userId).pipe(
      tap((data: any) => console.log('Data Fetched:' + JSON.stringify(data))),
      catchError(this.handleError));
  }

  GetUserCheck(email: String,password:String): Observable<Number>{
    return this.http.get<Number>('http://localhost:5223/api/Main/CheckUser?Email='+email+'&Password='+password).pipe(
      tap((data: any) => console.log('Data Fetched:' + JSON.stringify(data))),
      catchError(this.handleError));
  }

  AddCategory(categoryName: String): Observable<Boolean>{
    return this.http.get<Boolean>('http://localhost:5223/api/Main/AddCategory?categoryName='+categoryName).pipe(
      tap((data: any) => console.log('Data Fetched:' + JSON.stringify(data))),
      catchError(this.handleError));
  }

  AddProducts(PName : String,CId:Number,PR:Number,QtAv:Number,Img:String,Vid:String,Rating:Number): Observable<Boolean>{
    let product = {
      productNamne:PName,
      categoryId:CId,
      price:PR,
      quantityAvailable:QtAv,
      imgUrl:Img,
      videoUrl:Vid,
      rating:Rating
    }
    return this.http.post<Boolean>('http://localhost:5223/api/Main/AddProducts',product).pipe(
      tap((data: any) => console.log('Data Fetched:' + JSON.stringify(data))),
      catchError(this.handleError));
  }

  AddUsers(UName:String,UE:String,UP:String,CT:String,UA:String): Observable<Boolean>{
    let user = {
      "UserName":UName,
      "UserEmail":UE,
      "UserPassword":UP,
      "UserContact":CT,
      "UserAddress":UA
      
    }
    return this.http.post<Boolean>('http://localhost:5223/api/Main/AddUsers',user).pipe(
      tap((data: any) => console.log('Data Fetched:' + JSON.stringify(data))),
      catchError(this.handleError));
  }

  AddOrders(UI:String,NI:Number,PI:String): Observable<Boolean>{
   
    let order = {
      "UserId":UI,
      "NoOfItems":1,
      "ProductId":PI
    }
    return this.http.post<Boolean>('http://localhost:5223/api/Main/AddOrders',order).pipe(
      tap((data: any) => console.log('Data Fetched:' + JSON.stringify(data))),
      catchError(this.handleError));
  }

  getOrderByUser(UI:String): Observable<Order[]>{
    return this.http.get<Order[]>('http://localhost:5223/api/Main/GetOrderByUser?UserId='+UI).pipe(
      tap((data: any) => console.log('Data Fetched:' + JSON.stringify(data))),
      catchError(this.handleError));
  }

  private handleError(err: HttpErrorResponse): Observable<any> {
    let errMsg = '';
    if (err.error instanceof Error) {
      // A client-side or network error occurred. Handle it accordingly.
      console.log('An error occurred:', err.error.message);
      errMsg = err.error.message;
    } else {
      // The backend returned an unsuccessful response code.
      // The response body may contain clues as to what went wrong,
      console.log(`Backend returned code ${err.status}`);
      errMsg = err.error.status;
    }
    return throwError(()=>errMsg);
  }
}
