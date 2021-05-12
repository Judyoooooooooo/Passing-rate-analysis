import excel "C:\Users\ouyijun\Desktop\畢專\1217.xls", sheet("Sheet1") firstrow clear
set l 90
//考驗員通過率
probit 結果考驗員 d中 d夜間班 報考年齡 d高職 d專科 c滿意度  a考上一期平均通過率 if d報考驗員 == 1 ,cluster( l2_地區 )
est store p考cl地區
margin, dydx( d中 d夜間班 報考年齡 d高職 d專科 c滿意度 a考上一期平均通過率 )
//考驗員總分
reg  s考驗員總分 d中 d南 d專科 a考上一期平均通過率 if 結果考驗員 == 1 ,cluster( l2_地區 )
est store r考總分cl地區
//考驗員學科
reg  s報考學科 d中 d南 報考年齡 d高職 d大學大專以上 d同時報考 a考上一期平均通過率 if d報考驗員 == 1 ,cluster( l2_地區 )
est store r考學科cl地區

//檢驗員通過率
probit 結果檢驗員  i.d中  i.d夜間班 i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上  c滿意度  a檢上一期平均通過率  if d報檢驗員 == 1 ,cluster ( l2_地區 ) robust
est store p檢cl地rb
//檢驗員總分
reg  s檢驗員總分  i.d中 i.d南  i.d專科  i.d科系 c班級人數  c滿意度  if 結果檢驗員 == 1 ,cluster ( l2_地區 ) robust
est store r檢總分cl地rb
//檢驗員學科
reg  s報檢學科    i.d男性 c.報考年齡 i.d高職 i.d專科 i.d大學大專以上  c滿意度   if d報檢驗員 == 1 ,cluster ( l2_地區 ) robust
est store r檢學科cl地rb

//me地區 檢驗員及格與否
meprobit 結果檢驗員 d中 d南 d夜間班 d男性 報考年齡  d高職 d專科 d大學大專以上 d科系 c滿意度 c班級人數 d同時報考 if d報檢驗員 == 1 ||l2_地區 :
meprobit 結果檢驗員 d中 d男性 報考年齡  d大學大專以上  a檢上一期平均通過率   if d報檢驗員 == 1 ||l2_地區 :
est store me檢結果
//me地區 考驗員及格與否（後續loglikelihood不太好收斂）
meprobit 結果考驗員 d中 d南 d夜間班 d男性 報考年齡   d高職 d專科 d大學大專以上 d科系 c滿意度 c班級人數 d同時報考 if d報考驗員 == 1 ||l2_地區 :
meprobit 結果考驗員 d中  d夜間班  報考年齡 d高職   c滿意度 d同時報考 a考上一期平均通過率 if d報考驗員 == 1 ||l2_地區 :
est store me考結果
//melinear 檢驗員全體學科 （若在意常數項z值 則最後一式子可加滿意度控制）
mixed s報檢學科 d中 d南 d夜間班 d男性 報考年齡  d大學大專以上 d高職 d專科  d科系 c滿意度 c班級人數 d同時報考 a檢上一期平均通過率 if d報檢驗員 == 1 ||l2_地區 :
mixed s報檢學科  d南  d男性 報考年齡  d大學大專以上 d高職 d專科   c班級人數   if d報檢驗員 == 1 ||l2_地區 :
est store me檢學科
//melinear 考驗員全體學科 （若在意常數項z值 則最後一式子可加滿意度控制）
mixed s報考學科 d中 d南 d夜間班 d男性 報考年齡  d大學大專以上 d高職 d專科  d科系 c滿意度 c班級人數 d同時報考 a考上一期平均通過率 if d報考驗員 == 1 ||l2_地區 :
mixed s報考學科 d中 d南 報考年齡  d大學大專以上 d同時報考 a考上一期平均通過率 if d報考驗員 == 1 ||l2_地區 :
est store me考學科
//melinear 檢驗員通過者總分 （若在意常數項z值 則最後一式子可加滿意度控制）
mixed s檢驗員總分 d中 d南 d夜間班 d男性 報考年齡  d大學大專以上 d高職 d專科  d科系 c滿意度 c班級人數 d同時報考 a檢上一期平均通過率 if 結果檢驗員 == 1 ||l2_地區 :
mixed s檢驗員總分 d中 d南 報考年齡 d科系 if 結果檢驗員 == 1 ||l2_地區 :
est store me檢總分
//melinear 考驗員通過者總分 （若在意常數項z值 則最後一式子可加滿意度控制）
mixed s檢驗員總分 d中 d南 d夜間班 d男性 報考年齡  d大學大專以上 d高職 d專科  d科系 c滿意度 c班級人數 d同時報考 a檢上一期平均通過率 if 結果檢驗員 == 1 ||l2_地區 :
mixed s考驗員總分 報考年齡  d大學大專以上 c滿意度 a考上一期平均通過率 if 結果考驗員 == 1 ||l2_地區 :
est store me考總分

//
noisily est tab p檢cl地rb r檢總分cl地rb me檢總分 r檢學科cl地rb me檢學科
mixed s檢驗員總分 d中 d南 d夜間班 d男性 報考年齡  d大學大專以上 d高職 d專科  d科系 c滿意度 c班級人數 d同時報考 a檢上一期平均通過率 if 結果檢驗員 == 1 ||l2_地區 :
test d中= d南
noisily est tab p考cl地區 me考結果 r考總分cl地區 me考總分 r考學科cl地區 me考學科
noisily est tab p考cl地區 me考結果 r考總分cl地區 me考總分 r考學科cl地區 me考學科, star
noisily est tab p考cl地區 me考結果 , star
noisily est tab  r考總分cl地區 me考總分 r考學科cl地區 me考學科, star
noisily est tab  r考總分cl地區 me考總分 , star
noisily est tab  r考學科cl地區 me考學科, star
