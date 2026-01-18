preview:
	npx zenn preview

create-article:
	npx zenn new:article

create-book:
	@read -p "Enter book slug: " slug && npx zenn new:book --slug $$slug