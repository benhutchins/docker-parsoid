# Parsoid

MediaWiki uses its custom [Parsoid](https://www.mediawiki.org/wiki/Parsoid) service as part of its new WYSIWYG, [VisualEditor](https://www.mediawiki.org/wiki/VisualEditor). This is a simple container to run an instance of it.

This Docker container expects the MediaWiki URL to be provided as an environment variable `-e MW_URL=http://wiki` and exposes the Parsoid service on port 8000. Example:

	docker run -p 8142:8142 -e MW_URL="http://wiki" benhutchins/parsoid

## Interested in running MediaWiki inside Docker?

Check out [benhutchins/docker-mediawiki](https://github.com/benhutchins/docker-mediawiki).
