#!/bin/bash
find . -type f -exec sed -i 's/{dockerHubUsername}/'$1'/g' {} +
