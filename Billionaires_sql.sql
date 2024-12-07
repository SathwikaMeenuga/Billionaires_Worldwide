select * from `billionaires-by-country-2024`;
/* check any duplicates*/
select 
count(distinct BillionairesRichestBillionaire2023),
count(BillionairesRichestBillionaire2023),
sum(BillionairesRichestNetWorth2023) as total_networth
from `billionaires-by-country-2024`;
/* we have 72 billionaires*/
select region,
count(BillionairesRichestBillionaire2023) as num_of_billionaires,
round(avg(BillionairesTotalNetWorth2023),2) avg_networth,
round(sum(BillionairesTotalNetWorth2023),2) as total_networth
from `billionaires-by-country-2024`
group by 1
order by 4 desc;
-- count and avg networth by region --
with data as (
select  region,
count(BillionairesRichestBillionaire2023) as num_of_billionaires,
round(avg(BillionairesTotalNetWorth2023),2) avg_networth,
round(sum(BillionairesTotalNetWorth2023),2) as total_networth
from `billionaires-by-country-2024`
group by 1
order by 4 desc
)
select 
 round(sum(case when region = 'Africa' then total_networth else 0 end )/sum(total_networth) * 100,2) as pct_networth_africa,
round(sum(case when region = 'Europe' then total_networth else 0 end )/sum(total_networth) * 100,2) as pct_networth_Europe,
round(sum(case when region = 'Asia' then total_networth else 0 end )/sum(total_networth) * 100,2) as pct_networth_Asia,
round(sum(case when region = 'North America' then total_networth else 0 end )/sum(total_networth) * 100,2) as pct_networth_North_America,
round(sum(case when region = 'South America' then total_networth else 0 end )/sum(total_networth) * 100,2) as pct_networth_South_America,
round(sum(case when region = 'Oceania' then total_networth else 0 end )/sum(total_networth) * 100,2) as pct_networth_Oceania,
sum(total_networth) as total_networth
 from data;

-- 'Europe' 'Asia' 'North America' 'South America' 'Oceania' --
/* top 5 billionaires*/
select BillionairesRichestBillionaire2023,
BillionairesTotalNetWorth2023,country,region
from `billionaires-by-country-2024`
order by 2 desc
limit 5;

select region,
round(avg(BillionairesTotalNetWorth2023),2) as avg_networth,
round(avg(population_density_km),2) as avg_popden,
round(avg(Population_growthRate),2) as avg_popgrowth
from `billionaires-by-country-2024`
group by 1
order by 2 desc;

select unMember,
round(avg(BillionairesTotalNetWorth2023),2),
round(sum(BillionairesTotalNetWorth2023),2)
from `billionaires-by-country-2024`
group by 1;









