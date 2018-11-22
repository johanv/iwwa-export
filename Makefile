.PHONY: get-dump

get-dump: dumps/freddy.dump.gz

dumps/freddy.dump.gz: dumps
	ssh root@mijnvps "mysqldump civi | gzip" > dumps/freddy.dump.gz

dumps:
	mkdir dumps
