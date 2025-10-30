select coalesce(bhd.log_date, fim.log_date, pg.log_date) as report_date,
       coalesce(bhd.total, 0)                            as bhd_clients,
       coalesce(fim.total, 0)                            as fplus_clients,
       coalesce(pg.total, 0)                             as sub_clients
from (select count(distinct CustomerID) as total, cast(DATE as date) as log_Date
      from Log_BHD_MovieID bhdt
               left join MV_Properties_cleaned mv
                         on bhdt.MovieID = mv.id
      where isDRM = 1
      group by cast(DATE as date)) bhd
         full join(select count(distinct CustomerID) as total, cast(date as date) as log_Date
                   from Log_Fimplus_MovieID fi
                            left join MV_Properties_cleaned mv
                                      on mv.id = fi.MovieId
                   where isDRM = 1
                   group by cast(date as date)) fim
                  on bhd.log_Date = fim.log_Date
         full join (select count(distinct L.CustomerID) as total, cast(L.Date as date) as log_date
                    from Log_Get_DRM_List L
                             left join customerservice c on L.CustomerID = c.CustomerID
                    group by cast(L.Date as date)) pg
                   on bhd.log_Date = pg.log_date
order by report_date



