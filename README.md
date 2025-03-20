# ElasticSearch Demo

Data sources from [here](https://github.com/sckott/elastic_data)

# Requirements

* Docker / Docker Compose

# Installation

In order to start the underlying infrastructure run the following command from the top-level project directory:

```bash
docker-compose up -d
```

This will spin up two containers with the following ports forwarded to your local host machine:

| Service       | Ports |
|---------------|--------|
| ElasticSearch | 9200, 9300 |
| Kibana        | 5601 |

## Bootstrapping Data

In order to bootstrap ElasticSearch with some data to use run the following script:

```bash
./import_shakespeare.sh
```

You should see the results of the import via a large json blob.

# Example Commands/API

The [Elastic API] is very exhaustive, and allows for different types of CRUD operations. 

Provided below are a couple of examples to help illustrate some basic queries to fetch data:

## Count Data

In order to get a count of a target index (in this case `shakespeare`) the following command can be run:

```bash
curl -H "Content-Type: application/json" -X GET "localhost:9200/shakespeare/_count?pretty" -d '{
	"query": {
		"match_all": {}
	}
}'
```

## Query for Specific ID from a Target Index

In order to target and pull out a specific ID, from an index the following command can be run:

Assuming the target ID is `1`:

```bash
curl -X GET "localhost:9200/shakespeare/_doc/1?pretty"
```

## Search All Indexes for a Match

```bash
curl -H "Content-Type: application/json" -XGET "localhost:9200/_search?pretty" -d '
{
  "query": {
    "query_string": {
      "query": "(harm) OR (fashion)",
      "default_field": "text_entry"
    }
  }
}
'
```