-- Rode isso no Supabase: painel do projeto > SQL Editor > New query > Run

create table if not exists casal_humor (
  role text primary key check (role in ('a', 'b')),
  name text,
  mood_id text,
  note text,
  updated_at timestamptz
);

alter table casal_humor enable row level security;

-- Sem login de usuário, então liberamos leitura e escrita pra quem tiver
-- a URL + chave anônima do projeto (ambas ficam visíveis no código do site,
-- é inevitável num site 100% estático). Como só guarda humor + apelido,
-- o risco é baixo, mas não guarde nada sensível nessa tabela.
create policy "leitura publica" on casal_humor
  for select using (true);

create policy "escrita publica" on casal_humor
  for insert with check (true);

create policy "atualizacao publica" on casal_humor
  for update using (true);

-- Habilita o realtime (é o que faz o humor aparecer sozinho no celular do outro)
alter publication supabase_realtime add table casal_humor;
