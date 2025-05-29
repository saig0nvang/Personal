creat table detail as
    select
    CustomerID,
    DATEDIFF('2022-09-01', max(Purchase_Date)) as Recentcy,

    count(Purchase_Date) * 1.0 /
    case
        when year('2022-01-01') - year(created_date) = 0 then 1
        else year('2022-01-01') - year(created_date)*1.0
    end as Frequency,

    1.0 * sum(GMV) /
    case
        when year('2022-01-01') - year(created_date) = 0 then 1
        else year('2022-01-01') - year(created_date)*1.0
    end as Monetary

from Customer_Transaction ct
join Customer_Registered cs on ct.CustomerID = cs.ID
where CustomerID != 0
group by CustomerID, created_date;

select count( ID) from  customer_registered

;with rn as (select *, row_number() over (order by Recentcy) as rn_recentcy,
        row_number() over (order by Frequency) as rn_frequency,
        row_number() over (order by Monetary) as rn_monetary,
        count(*) over (  ) as total
from detail
),
rfm as(
select *,
    case
        when rn.rn_recentcy <= total* 0.2 then '5'
        when rn.rn_recentcy <= total* 0.4 then '4'
        when rn.rn_recentcy <= total* 0.6 then '3'
        when rn.rn_recentcy <= total* 0.8 then '2'
        else '1'
    end as R_score,
    case
        when rn.rn_Frequency <= total* 0.2 then '1'
        when rn.rn_Frequency <= total* 0.4 then '2'
        when rn.rn_Frequency <= total* 0.6 then '3'
        when rn.rn_Frequency <= total* 0.8 then '4'
        else '5'
    end as F_score,
    case
        when rn.rn_Monetary <= total* 0.2 then '1'
        when rn.rn_Monetary <= total* 0.4 then '2'
        when rn.rn_Monetary <= total* 0.6 then '3'
        when rn.rn_Monetary <= total* 0.8 then '4'
        else '5'
    end as M_score
from rn)
select *,count(RFM) over (partition by RFM) as RFM_count,
       case
           WHEN RFM = 555 THEN 'Champions'
           WHEN RFM = 454 THEN 'Champions'
           WHEN RFM = 545 THEN 'Champions'
           WHEN RFM = 543 THEN 'Loyal'
           WHEN RFM = 524 THEN 'Loyal'
           WHEN RFM = 535 THEN 'Loyal'
           WHEN RFM = 344 THEN 'Need Attention'
           WHEN RFM = 333 THEN 'Need Attention'
           WHEN RFM = 444 THEN 'Need Attention'
           WHEN RFM = 451 THEN 'Potential Loyalist'
           WHEN RFM = 431 THEN 'Potential Loyalist'
           WHEN RFM = 432 THEN 'Potential Loyalist'
           WHEN RFM = 445 THEN 'Promising'
           WHEN RFM = 425 THEN 'Promising'
           WHEN RFM = 435 THEN 'Promising'
           WHEN RFM = 253 THEN 'At Risk'
           WHEN RFM = 234 THEN 'At Risk'
           WHEN RFM = 245 THEN 'At Risk'
           WHEN RFM = 122 THEN 'Cannot Lose Them'
           WHEN RFM = 113 THEN 'Cannot Lose Them'
           WHEN RFM = 124 THEN 'Cannot Lose Them'
           WHEN RFM = 411 THEN 'New Customers'
           WHEN RFM = 421 THEN 'New Customers'
           WHEN RFM = 412 THEN 'New Customers'
           WHEN RFM = 213 THEN 'About To Sleep'
           WHEN RFM = 222 THEN 'About To Sleep'
           WHEN RFM = 231 THEN 'About To Sleep'
           WHEN RFM = 212 THEN 'Hibernating customers'
           WHEN RFM = 223 THEN 'Hibernating customers'
           WHEN RFM = 132 THEN 'Hibernating customers'
           WHEN RFM = 112 THEN 'Lost customers'
           WHEN RFM = 123 THEN 'Lost customers'
           WHEN RFM = 111 THEN 'Lost customers'
           ELSE 'Unclassified'
       end as segment
from (
select *,R_score*100+F_score*10+M_score as RFM from rfm) RF
