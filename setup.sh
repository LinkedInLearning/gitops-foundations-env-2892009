#!/bin/bash
find ./arc -type f -exec sed -i 's/{dockerHubUsername}/'$1'/g' {} +
find ./argo -type f -exec sed -i 's/{dockerHubUsername}/'$1'/g' {} +
find ./flagger -type f -exec sed -i 's/{dockerHubUsername}/'$1'/g' {} +
find ./flux -type f -exec sed -i 's/{dockerHubUsername}/'$1'/g' {} +
find ./terraform -type f -exec sed -i 's/{dockerHubUsername}/'$1'/g' {} +
