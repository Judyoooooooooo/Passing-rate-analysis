import excel "C:\Users\ouyijun\Desktop\考驗員dummy.xls", sheet("學員資料") firstrow
logit 結果考驗員 d中 d南 d班別 d性別 報考年齡 d高中 d大專以上 d相關科系 d非本科系
gen linear考 = _b[ d中 ]* d中+ _b[ d南 ]* d南+ _b[ d班別 ]* d班別+_b[ d性別 ]* d性別+_b[ 報考年齡  ]* 報考年齡+_b[ d高中 ]* d高中+_b[ d大專以上 ]* d大專以上+_b[ d相關科系 ]* d相關科系+_b[ d非本科系 ]* d非本科系+ _b[_cons]
gen logit結果考驗員 = exp( linear考 ) / (1+exp( linear考 ))
gen linear顯著考 = _b[ 報考年齡  ]* 報考年齡+_b[ d大專以上 ]* d大專以上+_b[ _cons]
gen logit顯著結果考驗員 = exp( linear顯著考 ) / (1+exp( linear顯著考 ))
logit 結果考驗員 d中 d南 d班別 d性別 報考年齡 d高中 d大專以上 d相關科系 d非本科系 if d報檢驗員 == 0
gen linear純考 = _b[ d中 ]* d中+ _b[ d南 ]* d南+ _b[ d班別 ]* d班別+_b[ d性別 ]* d性別+_b[ 報考年齡  ]* 報考年齡+_b[ d高中 ]* d高中+_b[ d大專以上 ]* d大專以上+_b[ d相關科系 ]* d相關科系+_b[ d非本科系 ]* d非本科系+ _b[_cons]
gen logit結果純考驗員 = exp( linear純考 ) / (1+exp( linear純考 ))
gen linear顯著純考 =_b[ d中 ]* d中 +_b[ d南 ]* d南 +  _b[ 報考年齡  ]* 報考年齡+_b[ d大專以上 ]* d大專以上+_b[ _cons]
gen logit顯著結果純考驗員 = exp( linear顯著純考 ) / (1+exp( linear顯著純考 ))
logit 結果考驗員 d中 d南 d班別 d性別 報考年齡 d高中 d大專以上 d相關科系 d非本科系 if 考驗員學科檢定結果 == 1
save "C:\Users\ouyijun\Desktop\考驗員.dta"
