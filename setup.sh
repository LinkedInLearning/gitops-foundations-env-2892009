#!/bin/bash
find . -type f ! -path "./.git/*" -exec sed -i 's/{dockerHubUsername}/'$1'/g' {} +
