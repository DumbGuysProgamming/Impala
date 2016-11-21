create table datamart.client(
	client_guid char(32) NOT NULL,
    client_name varchar(50),
    client_phone char(14),
    client_email varchar(50),
    client_type_id bigint,
    scn bigint NOT NULL,
    PRIMARY KEY (client_guid)
);

create table datamart.client_type_map(
    client_type_id bigint NOT NULL,
    client_type varchar(50) NOT NULL,
    scn bigint NOT NULL,
    PRIMARY KEY (client_type_id)
);

create table datamart.vehicle(
    vehicle_guid char(32) NOT NULL,
    vehicle_year int,
    vehicle_make varchar(50),
    vehicle_model varchar(50),
    scn bigint NOT NULL,
    PRIMARY KEY (vehicle_guid)
);

create table datamart.ownership(
	client_guid char(32) NOT NULL,
    vehicle_guid char(32) NOT NULL,
    scn bigint NOT NULL,
    PRIMARY KEY (client_guid)
);

create table datamart.service_transaction(
    transaction_guid char(32) NOT NULL,
    client_guid char(32) NOT NULL,
    service_guid char(32) NOT NULL,
    transaction_mileage bigint,
    transaction_date varchar(12),
    scn bigint NOT NULL,
    PRIMARY KEY (transaction_guid)
);

create table datamart.service(
    service_guid char(32) NOT NULL,
    vehicle_guid char(32) NOT NULL,
    service_mileage float(12),
    service_time float(5),
    service_cost float(20),
    service_deviation float(20),
    scn bigint NOT NULL,
    PRIMARY KEY (service_guid)
);

create table datamart.shop (
    client_guid char(32) NOT NULL,
    shop_address varchar(50),
    scn bigint NOT NULL,
    PRIMARY KEY (client_guid)
);

create table datamart.shop_service (
    client_guid char(32) NOT NULL,
    service_guid char(32) NOT NULL,
    shop_service_cost float(20),
    shop_service_time float(10),
    scn bigint NOT NULL,
    CONSTRAINT shop_guid PRIMARY KEY (client_guid,service_guid)
);

create table metadata.datamart_change_log (
    scn bigint NOT NULL,
    connection_datetime varchar(50) NOT NULL,
    client_guid char(32) NOT NULL,
    PRIMARY KEY (scn)
);