-- verification orer is about a list of records in the fl_lead, all belonging an export list (fl_export), to verify their emails.
-- user can request re-processing of a list by just creating a new order.
create table if not exists vrf_order (
    id uuid not null primary key,
    create_time timestamp not null,
    id_user uuid not null references "user"(id),
    id_export uuid not null references fl_export(id),
    stat_total_leads bigint null,
    stat_verified_leads bigint null
);

alter table vrf_order add column if not exists "name" int not null;
alter table vrf_order add column if not exists delete_time timestamp null;
alter table vrf_order add column if not exists "status" boolean not null;

-- pampa fields for verification
alter table fl_data add column if not exists verify_reservation_id varchar(500) null;
alter table fl_data add column if not exists verify_reservation_time timestamp null;
alter table fl_data add column if not exists verify_reservation_times int null;
alter table fl_data add column if not exists verify_start_time timestamp null;
alter table fl_data add column if not exists verify_end_time timestamp null;
alter table fl_data add column if not exists verify_success boolean null;
alter table fl_data add column if not exists verify_error_description text null;
