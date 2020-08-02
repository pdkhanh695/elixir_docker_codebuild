#!/bin/bash

# mix deps.get

# mix ecto.create
# mix ecto.migrate

# mix test

# mix phx.server

# echo "## checking format"
# mix format --check-formatted

# echo "## run credo for linting"
# mix credo --strict

# echo "## running tests"
# mix test --trace

# echo "## run coverage"
# mix coveralls.html

# echo "## run dialyzer"
# mix dialyzer

# echo "## run sobelow security check"
# mix sobelow --ignore Config.HTTPS,Config.CSRF,Config.Headers --private --verbose --exit

echo "We are in test"
mix deps.get

mix test

mix test --cover

# echo "## run dialyzer"
mix dialyzer

# echo "## run coverage"
mix coveralls.html

# echo "## checking format"
mix format --check-formatted

# echo "## run credo for linting"
mix credo --strict

# echo "## running tests"
mix test --trace