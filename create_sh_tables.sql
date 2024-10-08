DROP TABLE sales;
DROP TABLE customers;
DROP TABLE SHcountries;
DROP TABLE supplementary_demographics;
DROP TABLE costs;
DROP TABLE times;
DROP TABLE promotions;
DROP TABLE products;
DROP TABLE channels;

CREATE TABLE sales (
    prod_id             NUMBER          NOT NULL,
    cust_id             NUMBER          NOT NULL,
    time_id             DATE            NOT NULL,
    channel_id          NUMBER(6)       NOT NULL,
    promo_id            NUMBER          NOT NULL,
    quantity_sold       NUMBER(10,2)    NOT NULL,
    amount_sold         NUMBER(10,2)    NOT NULL);
    
CREATE TABLE costs (
    prod_id     NUMBER          NOT NULL,
    time_id     DATE            NOT NULL,
    promo_id    NUMBER          NOT NULL,
    channel_id  NUMBER(6)       NOT NULL,
    unit_cost   NUMBER(10,2)    NOT NULL,
    unit_price  NUMBER(10,2)    NOT NULL);

CREATE TABLE times (
    time_id                     DATE            NOT NULL,
    day_name                    VARCHAR2(9)     NOT NULL,
    day_number_in_week          NUMBER(1)       NOT NULL,
    day_number_in_month         NUMBER(2)       NOT NULL,
    calendar_week_number        NUMBER(2)       NOT NULL,
    fiscal_week_number          NUMBER(2)       NOT NULL,
    week_ending_day             DATE            NOT NULL,
    week_ending_day_id          NUMBER          NOT NULL,
    calendar_month_number       NUMBER(2)       NOT NULL,
    fiscal_month_number         NUMBER(2)       NOT NULL,
    calendar_month_desc         VARCHAR2(8)     NOT NULL,
    calendar_month_id           NUMBER          NOT NULL,
    fiscal_month_desc           VARCHAR2(8)     NOT NULL,
    fiscal_month_id             NUMBER          NOT NULL,
    days_in_cal_month           NUMBER          NOT NULL,
    days_in_fis_month           NUMBER          NOT NULL,
    end_of_cal_month            DATE            NOT NULL,
    end_of_fis_month            DATE            NOT NULL,
    calendar_month_name         VARCHAR2(9)     NOT NULL,
    fiscal_month_name           VARCHAR2(9)     NOT NULL,
    calendar_quarter_desc       CHAR(7)         NOT NULL,
    calendar_quarter_id         NUMBER          NOT NULL,
    fiscal_quarter_desc         CHAR(7)         NOT NULL,
    fiscal_quarter_id           NUMBER          NOT NULL,
    days_in_cal_quarter         NUMBER          NOT NULL,
    days_in_fis_quarter         NUMBER          NOT NULL,
    end_of_cal_quarter          DATE            NOT NULL,
    end_of_fis_quarter          DATE            NOT NULL,
    calendar_quarter_number     NUMBER(1)       NOT NULL,
    fiscal_quarter_number       NUMBER(1)       NOT NULL,
    calendar_year               NUMBER(4)       NOT NULL,
    calendar_year_id            NUMBER          NOT NULL,
    fiscal_year                 NUMBER(4)       NOT NULL,
    fiscal_year_id              NUMBER          NOT NULL,
    days_in_cal_year            NUMBER          NOT NULL,
    days_in_fis_year            NUMBER          NOT NULL,
    end_of_cal_year             DATE            NOT NULL,
    end_of_fis_year             DATE            NOT NULL );

CREATE TABLE products (
    prod_id                     NUMBER(6)       NOT NULL,
    prod_name                   VARCHAR2(50)    NOT NULL,
    prod_desc                   VARCHAR2(4000)  NOT NULL,
    prod_subcategory            VARCHAR2(50)    NOT NULL,
    prod_subcategory_id         NUMBER          NOT NULL,
    prod_subcategory_desc       VARCHAR2(2000)  NOT NULL,
    prod_category               VARCHAR2(50)    NOT NULL,
    prod_category_id            NUMBER          NOT NULL,
    prod_category_desc          VARCHAR2(2000)  NOT NULL,
    prod_weight_class           NUMBER(3)       NOT NULL,
    prod_unit_of_measure        VARCHAR2(20)    ,
    prod_pack_size              VARCHAR2(30)    NOT NULL,
    supplier_id                 NUMBER(6)       NOT NULL,
    prod_status                 VARCHAR2(20)    NOT NULL,
    prod_list_price             NUMBER(8,2)     NOT NULL,
    prod_min_price              NUMBER(8,2)     NOT NULL,
    prod_total                  VARCHAR2(13)    NOT NULL,
    prod_total_id               NUMBER          NOT NULL,
    prod_src_id                 NUMBER          ,
    prod_eff_from               DATE            ,
    prod_eff_to                 DATE            ,
    prod_valid                  VARCHAR2(1)     );

CREATE TABLE channels (
    channel_id                  NUMBER(6)          NOT NULL,
    channel_desc                VARCHAR2(20)    NOT NULL,
    channel_class               VARCHAR2(20)    NOT NULL,
    channel_class_id            NUMBER(6)          NOT NULL,
    channel_total               VARCHAR2(13)    NOT NULL,
    channel_total_id            NUMBER(6)          NOT NULL);

CREATE TABLE promotions (
    promo_id                    NUMBER(6)       NOT NULL,
    promo_name                  VARCHAR2(30)    NOT NULL,
    promo_subcategory           VARCHAR2(30)    NOT NULL,
    promo_subcategory_id        NUMBER          NOT NULL,
    promo_category              VARCHAR2(30)    NOT NULL,
    promo_category_id           NUMBER          NOT NULL,
    promo_cost                  NUMBER(10,2)    NOT NULL,
    promo_begin_date            DATE            NOT NULL,
    promo_end_date              DATE            NOT NULL,
    promo_total                 VARCHAR2(15)    NOT NULL,
    promo_total_id              NUMBER          NOT NULL);

CREATE TABLE customers (
    cust_id                     NUMBER          NOT NULL,
    cust_first_name             VARCHAR2(20)    NOT NULL,
    cust_last_name              VARCHAR2(40)    NOT NULL,
    cust_gender                 CHAR(1)         NOT NULL,
    cust_year_of_birth          NUMBER(4)       NOT NULL,
    cust_marital_status         VARCHAR2(20)    ,
    cust_street_address         VARCHAR2(40)    NOT NULL,
    cust_postal_code            VARCHAR2(10)    NOT NULL,
    cust_city                   VARCHAR2(30)    NOT NULL,
    cust_city_id                NUMBER          NOT NULL,
    cust_state_province         VARCHAR2(40)    NOT NULL,
    cust_state_province_id      NUMBER          NOT NULL,
    country_id                  NUMBER          NOT NULL,
    cust_main_phone_number      VARCHAR2(25)    NOT NULL,
    cust_income_level           VARCHAR2(30)    ,
    cust_credit_limit           NUMBER          ,
    cust_email                  VARCHAR2(50)    ,
    cust_total                  VARCHAR2(14)    NOT NULL,
    cust_total_id               NUMBER          NOT NULL,
    cust_src_id                 NUMBER          ,
    cust_eff_from               DATE            ,
    cust_eff_to                 DATE            ,
    cust_valid                  VARCHAR2(1)     );

CREATE TABLE SHcountries (
    country_id                  NUMBER          NOT NULL,
    country_iso_code            CHAR(2)         NOT NULL,
    country_name                VARCHAR2(40)    NOT NULL,
    country_subregion           VARCHAR2(30)    NOT NULL,
    country_subregion_id        NUMBER          NOT NULL,
    country_region              VARCHAR2(20)    NOT NULL,
    country_region_id           NUMBER          NOT NULL,
    country_total               VARCHAR2(11)    NOT NULL,
    country_total_id            NUMBER          NOT NULL,
    country_name_hist           VARCHAR2(40));


CREATE TABLE supplementary_demographics
  ( cust_id          		NUMBER NOT NULL,
    education        		VARCHAR2(21),
    occupation       		VARCHAR2(21),
    household_size   		VARCHAR2(21),
    yrs_residence    		NUMBER,
    affinity_card    		NUMBER(10),
    bulk_pack_diskettes 	NUMBER(10),
    flat_panel_monitor  	NUMBER(10),
    home_theater_package 	NUMBER(10),
    bookkeeping_application 	NUMBER(10),
    printer_supplies 		NUMBER(10),
    y_box_games 		NUMBER(10),
    os_doc_set_kanji 		NUMBER(10),
    comments         		VARCHAR2(4000));
	
	ALTER TABLE CHANNELS 
    ADD CONSTRAINT CHANNELS_PK PRIMARY KEY ( CHANNEL_ID ) NOVALIDATE ;
	
	ALTER TABLE SHCOUNTRIES 
    ADD CONSTRAINT COUNTRIES_PK PRIMARY KEY ( COUNTRY_ID ) NOVALIDATE ;
	
	ALTER TABLE CUSTOMERS 
    ADD CONSTRAINT CUSTOMERS_PK PRIMARY KEY ( CUST_ID ) NOVALIDATE ;
	
	ALTER TABLE PRODUCTS 
    ADD CONSTRAINT PRODUCTS_PK PRIMARY KEY ( PROD_ID ) NOVALIDATE ;
	
	ALTER TABLE PROMOTIONS 
    ADD CONSTRAINT PROMO_PK PRIMARY KEY ( PROMO_ID ) NOVALIDATE ;
	
	ALTER TABLE SUPPLEMENTARY_DEMOGRAPHICS 
    ADD CONSTRAINT SUPP_DEMO_PK PRIMARY KEY ( CUST_ID ) DISABLE NOVALIDATE ;
	
	ALTER TABLE TIMES 
    ADD CONSTRAINT TIMES_PK PRIMARY KEY ( TIME_ID ) NOVALIDATE ;

	ALTER TABLE COSTS 
    ADD CONSTRAINT COSTS_CHANNEL_FK FOREIGN KEY 
    ( 
     CHANNEL_ID
    ) 
    REFERENCES CHANNELS 
    ( 
     CHANNEL_ID
    ) 
    NOT DEFERRABLE 
;



ALTER TABLE COSTS 
    ADD CONSTRAINT COSTS_PRODUCT_FK FOREIGN KEY 
    ( 
     PROD_ID
    ) 
    REFERENCES PRODUCTS 
    ( 
     PROD_ID
    ) 
    NOT DEFERRABLE 
;



ALTER TABLE COSTS 
    ADD CONSTRAINT COSTS_PROMO_FK FOREIGN KEY 
    ( 
     PROMO_ID
    ) 
    REFERENCES PROMOTIONS 
    ( 
     PROMO_ID
    ) 
    NOT DEFERRABLE 
;



ALTER TABLE COSTS 
    ADD CONSTRAINT COSTS_TIME_FK FOREIGN KEY 
    ( 
     TIME_ID
    ) 
    REFERENCES TIMES 
    ( 
     TIME_ID
    ) 
    NOT DEFERRABLE 
;



ALTER TABLE CUSTOMERS 
    ADD CONSTRAINT CUSTOMERS_COUNTRY_FK FOREIGN KEY 
    ( 
     COUNTRY_ID
    ) 
    REFERENCES SHCOUNTRIES 
    ( 
     COUNTRY_ID
    ) 
    NOT DEFERRABLE 
;



ALTER TABLE SALES 
    ADD CONSTRAINT SALES_CHANNEL_FK FOREIGN KEY 
    ( 
     CHANNEL_ID
    ) 
    REFERENCES CHANNELS 
    ( 
     CHANNEL_ID
    ) 
    NOT DEFERRABLE 
;



ALTER TABLE SALES 
    ADD CONSTRAINT SALES_CUSTOMER_FK FOREIGN KEY 
    ( 
     CUST_ID
    ) 
    REFERENCES CUSTOMERS 
    ( 
     CUST_ID
    ) 
    NOT DEFERRABLE 
;



ALTER TABLE SALES 
    ADD CONSTRAINT SALES_PRODUCT_FK FOREIGN KEY 
    ( 
     PROD_ID
    ) 
    REFERENCES PRODUCTS 
    ( 
     PROD_ID
    ) 
    NOT DEFERRABLE 
;



ALTER TABLE SALES 
    ADD CONSTRAINT SALES_PROMO_FK FOREIGN KEY 
    ( 
     PROMO_ID
    ) 
    REFERENCES PROMOTIONS 
    ( 
     PROMO_ID
    ) 
    NOT DEFERRABLE 
;



ALTER TABLE SALES 
    ADD CONSTRAINT SALES_TIME_FK FOREIGN KEY 
    ( 
     TIME_ID
    ) 
    REFERENCES TIMES 
    ( 
     TIME_ID
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE SALES
DISABLE CONSTRAINT SALES_TIME_fk;

ALTER TABLE SALES
DISABLE CONSTRAINT SALES_CHANNEL_FK ;

ALTER TABLE SALES
DISABLE CONSTRAINT SALES_PROMO_FK;

ALTER TABLE SALES
DISABLE CONSTRAINT SALES_PRODUCT_FK;

ALTER TABLE SALES
DISABLE CONSTRAINT SALES_CUSTOMER_FK;

ALTER TABLE CUSTOMERS
DISABLE CONSTRAINT CUSTOMERS_COUNTRY_FK;
