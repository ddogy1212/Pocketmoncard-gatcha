-- Supabase schema v8.1 (same as v8)
create table if not exists public.profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  username text unique not null,
  passhash text not null,
  phone text not null,
  created_at timestamptz default now()
);
alter table public.profiles enable row level security;
create policy "read own profile" on public.profiles for select using (auth.uid() = user_id);
create policy "upsert own profile" on public.profiles for insert with check (auth.uid() = user_id);
create policy "update own profile" on public.profiles for update using (auth.uid() = user_id);

create table if not exists public.inventories (
  user_id uuid primary key references auth.users(id) on delete cascade,
  inventory jsonb not null default '{"C":0,"U":0,"R":0,"RR":0,"RRR":0,"AR":0,"SAR":0,"등급카드":0}'::jsonb,
  credit integer not null default 0,
  updated_at timestamptz default now()
);
alter table public.inventories enable row level security;
create policy "read own inv" on public.inventories for select using (auth.uid() = user_id);
create policy "upsert own inv" on public.inventories for insert with check (auth.uid() = user_id);
create policy "update own inv" on public.inventories for update using (auth.uid() = user_id);
