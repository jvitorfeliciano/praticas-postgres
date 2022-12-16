SELECT users.id, users.name, roles.name AS role, companies.name AS company, experiences."startDate" FROM experiences JOIN users ON experiences."userId"=users.id JOIN roles ON experiences."roleId" = roles.id  JOIN  companies ON  experiences."companyId"=companies.id WHERE users.id=50 AND experiences."endDate" IS NULL;

/*como estou importando várias tabelas (user, companies, experiences roles) preciso usar <nome da tabela>.<nome da coluna> para trazer a informação;*/
/* quando não se usa AS na hora de importar as infos o campo vem o com o próprio nome da tabela*/