.PHONY: get-dump start-db stop-db import-dump

get-dump: dumps/freddy.dump.gz

dumps/freddy.dump.gz: dumps
	ssh root@mijnvps "mysqldump civi | gzip" > dumps/freddy.dump.gz

dumps:
	mkdir dumps

start-db:
	docker-compose up -d

stop-db:
	docker-compose kill

import-dump: .stamps/import-dump

.stamps/import-dump: start-db get-dump
	zcat dumps/freddy.dump.gz | mysql -u dev -pDbDevPw -h 127.0.0.1 civi
	mkdir -p .stamps
	touch .stamps/import-dump
