.PHONY: start-db stop-db import-dump clean

MYSQL = mysql -u root -pblablablaroot -h 127.0.0.1 civi

dumps/freddy.dump.gz: dumps
	ssh root@mijnvps "mysqldump civi | gzip" > dumps/freddy.dump.gz

dumps:
	mkdir dumps

export:
	mkdir export

start-db: .stamps/start-db

stop-db:
	docker-compose kill
	rm .stamps/start-db


import-dump: .stamps/import-dump

.stamps:
	mkdir .stamps

.stamps/import-dump: .stamps .stamps/start-db dumps/freddy.dump.gz
	zcat dumps/freddy.dump.gz | $(MYSQL)
	touch .stamps/import-dump

.stamps/start-db: .stamps
	docker-compose up --force -d
	sleep 2
	touch .stamps/start-db

export/individuals.csv: .stamps/import-dump queries/individuals.sql
	cat queries/individuals.sql | $(MYSQL) > export/individuals.csv

clean:
	rm .stamps/*
