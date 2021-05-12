import excel "C:\Users\ouyijun\Desktop\1211.xls", sheet("Sheet1") firstrow
set l 90
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
probit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,cluster ( l2_地區 )
est store p檢cl地
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d中 )
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d夜間班 )
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d男性 )
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( 報考年齡 )
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( 報考年齡 d高職 )
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( 報考年齡 d高職 d專科 )
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( 報考年齡 d高職 d專科 d大學大專以上 )
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( 報考年齡 d高職 d專科 d大學大專以上 d碩士 )
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( 報考年齡 d高職 d專科 d大學大專以上 c滿意度 )
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( 報考年齡 d高職 d專科 d大學大專以上 c滿意度 a檢分區上一期平均通過率 )
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( 報考年齡 d高職 d專科 d大學大專以上 a檢中區上一次通過率  )
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( 報考年齡 d高職 d專科 d大學大專以上   )
est store p檢het
noisily estimates table p檢cl地 p檢het ,stats(N)star
gen l2_次序 =0
 replace l2_次序 =1 if d1次 ==1
 replace l2_次序 = 2 if d2次 ==1
 replace l2_次序 = 3 if d3次 ==1
 replace l2_次序 = 4 if d4次 ==1
 replace l2_次序 = 5 if d5次 ==1
 replace l2_次序 = 6 if d6次 ==1
 replace l2_次序 = 7 if d7次 ==1
 replace l2_次序 = 8 if d8次 ==1
 replace l2_次序 = 9 if d9次 ==1
 replace l2_次序 = 10 if d10次 ==1
reg s檢驗員總分 d中 d南 d夜間班 d男性 c.報考年齡 d高職 d專科 d大學大專以上 d碩士 d科系 c班級人數 c滿意度 d同時報考 a檢上一期平均通過率 a檢北區上一次通過率 a檢中區上一次通過率 a檢南區上一次通過率 if d報檢驗員 == 1 , cluster ( l2_地區 ) robust
reg s檢驗員總分 d中 d南 d夜間班 d男性 c.報考年齡 d高職 d專科 d大學大專以上 d碩士 d科系 c班級人數 c滿意度 d同時報考 a檢上一期平均通過率 if d報檢驗員 == 1 , cluster ( l2_地區 ) robust
destring s檢驗員總分 , replace
destring s考驗員總分 , replace
destring s報檢學科 , replace
destring s報檢術科 , replace
destring s報考學科 , replace
destring s報考術科 , replace
reg s檢驗員總分 d中 d南 d夜間班 d男性 c.報考年齡 d高職 d專科 d大學大專以上 d碩士 d科系 c班級人數 c滿意度 d同時報考 a檢上一期平均通過率 if d報檢驗員 == 1 , cluster ( l2_地區 ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d中 ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d夜間班 ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d男性 ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d男性 報考年齡 ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 ln報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d男性 ln報考年齡 ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 ln報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d男性 d高職 ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 ln報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d男性 d專科 ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 ln報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d男性 d大學大專以上 ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 ln報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d男性 d碩士 ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 ln報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d男性 d碩士 c滿意度 ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d男性 d碩士 c滿意度 ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d男性 d碩士 a檢中區上一次通過率  ) robust
hetprobit 結果檢驗員  i.d中 i.d夜間班 i.d男性 報考年齡 i.d高職 i.d專科 i.d大學大專以上 i.d碩士 c滿意度  a檢上一期平均通過率 a檢中區上一次通過率  if d報檢驗員 == 1 ,het ( d男性 d碩士  ) robust
est store p檢hetrb
noisily estimates table p檢cl地 p檢het p檢hetrb ,stats(N)star
reg s報檢學科 d中 d南 d夜間班 d男性 c.報考年齡 d高職 d專科 d大學大專以上 d碩士 d科系 c班級人數 c滿意度 d同時報考 a檢上一期平均通過率 if d報檢驗員 == 1 , cluster ( l2_地區 ) robust
reg s報檢學科 d中 d南 d男性 c.報考年齡 d專科 d大學大專以上 d碩士  if d報檢驗員 == 1 , cluster ( l2_地區 ) robust
est store r檢學科cl地區rb
reg s報檢學科 d中 d南 d夜間班 d男性 c.報考年齡 d高職 d專科 d大學大專以上 d碩士 d科系 c班級人數 c滿意度 d同時報考 a檢上一期平均通過率 if d報檢驗員 == 1 , cluster ( l2_課堂編號 ) robust
reg s報檢學科 d男性 c.報考年齡  d大學大專以上 d碩士 if d報檢驗員 == 1 , cluster ( l2_課堂編號 ) robust
est store r檢學科cl班級rb
reg s報檢學科 d中 d南 d夜間班 d男性 c.報考年齡 d高職 d專科 d大學大專以上 d碩士 d科系 c班級人數 c滿意度 d同時報考 a檢上一期平均通過率 if d報檢驗員 == 1 , cluster ( l2_次序 ) robust
reg s報檢學科  d男性 c.報考年齡 d大學大專以上 d碩士 if d報檢驗員 == 1 , cluster ( l2_次序 ) robust
est store r檢學科cl次序rb
noisily estimates table r檢學科cl地區rb r檢學科cl班級rb r檢學科cl次序rb ,stats(N)star
reg s檢驗員總分 d中 d南 d夜間班 d男性 c.報考年齡 d高職 d專科 d大學大專以上 d碩士 d科系 c班級人數 c滿意度 d同時報考 a檢上一期平均通過率 if 結果檢驗員 == 1 , cluster ( l2_地區 ) robust
reg s檢驗員總分 d中 d南  d專科  d碩士 d科系 c班級人數  if 結果檢驗員 == 1 , cluster ( l2_地區 ) robust
est store r檢總分cl地區rb
reg s檢驗員總分 d中 d南 d夜間班 d男性 c.報考年齡 d高職 d專科 d大學大專以上 d碩士 d科系 c班級人數 c滿意度 d同時報考 a檢上一期平均通過率 if 結果檢驗員 == 1 , cluster ( l2_課堂編號 ) robust
reg s檢驗員總分 d中 d南 c.報考年齡  d專科  d科系  if 結果檢驗員 == 1 , cluster ( l2_課堂編號 ) robust
est store r檢總分cl班級rb
reg s檢驗員總分 d中 d南 d夜間班 d男性 c.報考年齡 d高職 d專科 d大學大專以上 d碩士 d科系 c班級人數 c滿意度 d同時報考 a檢上一期平均通過率 if 結果檢驗員 == 1 , cluster ( l2_次序 ) robust
reg s檢驗員總分 d中 d南 c.報考年齡 d專科 d科系 c班級人數  if 結果檢驗員 == 1 , cluster ( l2_次序 ) robust
est store r檢總分cl次序rb
noisily estimates table r檢總分cl地區rb r檢總分cl班級rb r檢總分cl次序rb ,stats(N)star
