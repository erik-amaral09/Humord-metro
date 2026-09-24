# Humordômetro

App de casal pra registrar seu humor do dia (com foto de macaquinho) e ver o humor um do outro, ao vivo.

## 1. Criar o banco (Supabase, grátis)

1. Cria conta em [supabase.com](https://supabase.com) e um novo projeto (escolhe uma senha de banco, guarda ela).
2. Espera o projeto terminar de provisionar (~2 min).
3. Menu lateral > **SQL Editor** > **New query**, cola o conteúdo do arquivo `setup.sql` deste pacote e clica em **Run**.
4. Menu lateral > **Settings** > **API**. Copia dois valores:
   - **Project URL**
   - **anon public key**

## 2. Configurar o site

Abre o `index.html` num editor de texto, procura por:

```js
var SUPABASE_URL = "COLE_AQUI_A_SUA_SUPABASE_URL";
var SUPABASE_ANON_KEY = "COLE_AQUI_A_SUA_SUPABASE_ANON_KEY";
```

E troca pelos dois valores que você copiou. Salva o arquivo.

## 3. Subir no GitHub Pages

1. Cria um repositório novo no GitHub (pode ser público ou privado).
2. Sobe os arquivos `index.html` e a pasta `img/` inteira pra raiz do repositório.
3. **Settings** do repositório > **Pages** > em "Build and deployment", Source: **Deploy from a branch** > Branch: **main**, pasta **/(root)** > **Save**.
4. Espera 1-2 minutos. O link fica algo como `https://seu-usuario.github.io/nome-do-repo/`.

## 4. Usar

Abre o link no seu celular e no dela/dele. Cada um:
1. Na primeira vez que alguém abrir, cadastra os dois nomes (só precisa fazer uma vez).
2. Toca em quem é ("trocar" no topo muda isso depois, se errar).
3. Toca no próprio card pra escolher o humor (com a foto de macaquinho) e, se quiser, escrever o motivo.

O humor de cada um aparece pro outro automaticamente, sem precisar atualizar a página.

## Sobre segurança

Por ser um site 100% estático (sem servidor próprio), a chave do Supabase fica visível pra quem olhar o código do site. Isso é normal pra esse tipo de projeto, mas por isso a tabela guarda só humor + apelido — nunca coloque informação sensível nela. Se quiser mais tarde, dá pra travar mais isso com login (Supabase Auth), mas foge do escopo desse app simples.
