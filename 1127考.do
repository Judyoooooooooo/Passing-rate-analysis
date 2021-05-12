set l 90

gen g大學碩士 = 0
replace g大學碩士 = 1 if d大學大專以上==1  | d碩士==1
gen g專科大學 = 0
replace g專科大學 = 1 if d專科==1  | d大學大專以上==1

//margin,dydx( )
//找[1] p考rb
probit 結果考驗員 i.d106年 i.d107年 c.報考年齡 i.d高職 i.d碩士 i.d同時報考 if d報考驗員 == 1 ,robust
est store p考rb

//建立cluster所需之 每一次班級 及 地區
gen l2_課堂編號 = 0
 replace l2_課堂編號 =1 if d北1次==1
 replace l2_課堂編號 =2 if d中1次==1
 replace l2_課堂編號 =3 if d南1次==1
 replace l2_課堂編號 =4 if d北2次==1
 replace l2_課堂編號 =5 if d中2次==1
 replace l2_課堂編號 =6 if d南2次==1
 replace l2_課堂編號 =7 if d北3次==1
 replace l2_課堂編號 =8 if d中3次==1
 replace l2_課堂編號 =9 if d南3次==1
 replace l2_課堂編號 =10 if d北4次==1
 replace l2_課堂編號 =11 if d中4次==1
 replace l2_課堂編號 =12 if d南4次==1
 replace l2_課堂編號 =13 if d北5次==1
 replace l2_課堂編號 =14 if d中5次==1
 replace l2_課堂編號 =15 if d南5次==1
 replace l2_課堂編號 =16 if d北6次==1
 replace l2_課堂編號 =17 if d中6次==1
 replace l2_課堂編號 =18 if d南6次==1
 replace l2_課堂編號 =19 if d北7次==1
 replace l2_課堂編號 =20 if d中7次==1
 replace l2_課堂編號 =21 if d南7次==1
 replace l2_課堂編號 =22 if d北8次==1
 replace l2_課堂編號 =23 if d中8次==1
 replace l2_課堂編號 =24 if d南8次==1
 replace l2_課堂編號 =25 if d北9次==1
 replace l2_課堂編號 =26 if d中9次==1
 replace l2_課堂編號 =27 if d南9次==1
 replace l2_課堂編號 =28 if d北10次==1
 replace l2_課堂編號 =29 if d中10次==1
 replace l2_課堂編號 =30 if d南10次==1
gen l2_地區=0
 replace l2_地區 =1 if d北==1
 replace l2_地區 =2 if d中 ==1
 replace l2_地區 =3 if d南 ==1
  
//找[2] p考cl地
//專科大學合併
probit 結果考驗員 i.d106年 i.d107年 i.d北  i.d男性 c.報考年齡 i.d高職 i.g專科大學 i.d碩士 c.c班級人數  if d報考驗員 == 1 ,cluster ( l2_地區 )
est store p考cl地

//找[3] p考cl班
probit 結果考驗員  i.d107年  c.報考年齡 i.d高職  i.d碩士 if d報考驗員 == 1 ,cluster ( l2_課堂編號 )
est store p考cl班
 
//比較三個模型
noisily est tab p考rb p考cl地 p考cl班,se
 
 
 
 
 
 
 
