# 📚 Plataforma de Gestão de Trabalhos Finais de Curso

Projeto desenvolvido no âmbito da unidade curricular de **Bases de Dados** da Universidade Lusófona.

O objetivo é desenvolver e estruturar uma **base de dados para uma plataforma de gestão de Trabalhos Finais de Curso (TFC)**, permitindo gerir todo o processo de inscrição, submissão, candidatura e atribuição de temas, bem como a informação associada a alunos, grupos, professores e orientações.

---

## 🎯 Objetivos

O projeto procura implementar uma estrutura de dados capaz de suportar:

* 👨‍🎓 Gestão de alunos e grupos
* 📖 Gestão de Trabalhos Finais de Curso
* 📝 Submissão e candidatura a temas
* 🎯 Atribuição de temas a alunos ou grupos
* 👨‍🏫 Gestão de orientadores e coorientadores
* 📊 Gestão de avaliações e ECTS
* 📜 Registo do histórico de alterações
* 🔎 Consultas e análise dos dados
* 🔐 Integridade e consistência da informação

---

## 🗄️ Base de Dados

O projeto parte de um modelo de dados destinado a suportar a plataforma de gestão de TFC.

Os dados são inicialmente carregados a partir de **ficheiros CSV**, sendo posteriormente tratados, normalizados e transformados para as tabelas definitivas.

Entre os dados utilizados encontram-se:

* Alunos
* Grupos
* TFC
* Inscrições
* Professores
* Empresas e entidades externas
* Cursos
* Tecnologias
* Disciplinas
* Avaliações
* Histórico de alterações

---

## ⚙️ Funcionalidades Implementadas

### 🧹 Tratamento e normalização

* Carregamento dos dados provenientes dos ficheiros de input
* Limpeza de valores inconsistentes
* Remoção e tratamento de dados duplicados
* Verificação da integridade referencial
* Normalização do modelo de dados
* Aplicação da **Terceira Forma Normal (FN3)**

### 🔑 Integridade da Base de Dados

* Chaves primárias
* Chaves estrangeiras
* Restrições de unicidade
* Restrições `NOT NULL`
* `CHECK CONSTRAINTS`
* Validação de referências entre tabelas
* Utilização de chaves naturais quando aplicável

### 🔍 Consultas e análise

Foram desenvolvidas consultas para, entre outros casos:

* Listar candidaturas ordenadas
* Consultar temas atribuídos
* Listar orientações
* Identificar alunos sem trabalho atribuído
* Consultar temas disponíveis
* Listar trabalhos atribuídos por aluno
* Consultar o histórico de um tema
* Contabilizar orientações por docente
* Identificar candidatos de acordo com avaliações e ECTS

### 🧠 Programação SQL

O projeto inclui ainda a utilização de diferentes mecanismos de programação de bases de dados:

* **Views**
* **Funções escalares**
* **Funções vectoriais**
* **Procedimentos**
* **Triggers**
* **Transações**

---

## 🏗️ Etapas do Projeto

### 1️⃣ Etapa 1 — Estrutura e tratamento dos dados

* Criação das tabelas
* Importação dos ficheiros
* Criação de índices
* Limpeza dos dados
* Identificação de duplicados
* Verificação da integridade das referências

### 2️⃣ Etapa 2 — Integridade e melhoria do modelo

* Criação de chaves primárias
* Adição e preenchimento de ECTS
* Restrições de integridade
* Chaves estrangeiras
* Utilização de chaves naturais
* Gestão do estado dos alunos
* Normalização para FN3

### 3️⃣ Etapa 3 — Queries e programação

* Criação de Views
* Funções de cálculo
* Consultas de análise
* Triggers para alterações automáticas
* Procedimentos com transações
* Validação da elegibilidade dos alunos
* Gestão das atribuições e respetivo histórico

---

## 💡 Regras de Negócio

Entre as principais regras consideradas encontram-se:

* Um aluno necessita de estar registado para se candidatar a temas.
* Cada candidatura pode indicar entre **3 e 6 temas**, por ordem de preferência.
* Um TFC possui obrigatoriamente um orientador.
* Um TFC pode ter, no máximo, um coorientador.
* Um aluno ou grupo apenas pode ter uma atribuição.
* Alunos com menos de **90 ECTS** são excluídos da atribuição de temas.
* Os temas podem ser propostos por docentes, entidades externas ou alunos.
* As alterações aos temas devem ficar registadas no histórico.
* As atribuições e alterações de estado devem respeitar as regras de integridade definidas.

---

## 🛠️ Tecnologias

* **SQL**
* **Docker**
* **Azure**

---

## 🎓 Contexto Académico

**Universidade Lusófona de Humanidades e Tecnologias**
Licenciaturas: **LEI, LEIRT e LIG**
Unidade Curricular: **Bases de Dados**

Projeto desenvolvido como trabalho prático de avaliação contínua.

---
