# Projeto Conceitual de Banco de Dados
[![Anurag's GitHub stats](https://github-readme-stats.vercel.app/api?username=Gustavo-H-Martins)](https://github.com/anuraghazra/github-readme-stats)
## Modelo Ordem de Serviço
[Modelo OS](https://github.com/Gustavo-H-Martins/Projeto-Conceitual-de-Banco-de-Dados/blob/main/1-ORDEM%20DE%20SERVI%C3%87O%20-%20Projeto%20Conceitual%20de%20Banco%20de%20Dados.png)
### Contexto:
    Dentro de uma empresa os clientes demandam ao helpdesk algumas ações.
    Essas ações são convertidas em ordem de serviço
    Os clientes realizam um pedido
    O pedido é convertido em ordem de serviço caso possa ser realizado
    O técnico executa a ordem de serviço. Após sua finalização a mesma é arquivada

### Entidades: 
    Cliente, Responsável, Pedido e Ordem de Serviço
### Relacionamentos
    Solicita, Analisa, Executa, Arquiva

## Modelo Universidade
[Modelo Universidade](https://github.com/Gustavo-H-Martins/Projeto-Conceitual-de-Banco-de-Dados/blob/main/2-UNIVERSIDADE%20-%20Projeto%20Conceitual%20de%20Banco%20de%20Dados.png)
### Contexto:
    Alunos
        A universidade possui diversos alunos que podem estar matriculados em mais de um curso (graduação);
        Os alunos podem fazer cursos extras fornecidos externa e internamente (universidade) para contar como horas complementares;
        Não há restrição quanto ao número de matérias puxadas se não houver sobreposição de horário;
        Os alunos são submetidos a duas provas por semestre para cada disciplina. Eventuais trabalhos devem ser tratados pelo professor para compor a nota da prova.

    Disciplinas
        As disciplinas podem ser comuns a cursos distintos. Ex: Cálculo 1 para computação e engenharia;
        O ciclo de vida da disciplina é semestral.

    Professores
        Os professores que ministram as disciplinas estão associados as coordenações de seus respectivos cursos Ex: Computação, Física, Engenharia …
### Entidades: 
    Alunos, Disciplina, Curso, Professor, Extensão, Pré Requisitos, Período, Departamento
    
### Relacionamentos:
    Matrícula, Horas Complementares, Oferta de Disciplina, Requisitos das disciplinas.
  
## Modelo E-commerce
[Modelo E-commerce](https://github.com/Gustavo-H-Martins/Projeto-Conceitual-de-Banco-de-Dados/blob/main/3-ECOMMERCE%20-%20Projeto%20Conceitual%20de%20Banco%20de%20Dados.png)
### Contexto
    Produtos
        Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos (terceiros);
        Cada produto possui um fornecedor;
        Um ou mais produtos podem compor um pedido.
    Clientes
        O cliente pode se cadastrar no site com seu CPF ou CNPJ;
        O Endereço do cliente irá determinar o valor do frete;
        Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.
    Pedido
        O pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega;
        Um produto ou mais compoem o pedido;
        O pedido pode ser cancelado.
    Fornecedor
        Fornece produtos, e pode ser cliente também;
        Existe um vendedor terceiro, para o marketplace.

    Estoque
        Mantem estoque de produtos de fornecedores e vendedores terceiros.

### Entidades: 
    Fornecedor, Vendedr terceiro, Estoque, Cliente (PF e PJ), Pedido, Pagamento, Formas de Pagamento.
### Relacionamentos:
    Histórico de Pagamento, Entrega, Itens de Pedido, Estoque de Produtos, Fornecimento, Venda Marketplace.
    
