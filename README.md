# HelloWorld

```
#plain ObjectScript
docker compose exec iris iris session iris -UHELLOWORLD 'test0'
docker compose exec iris iris session iris -UHELLOWORLD 'test0("Tokyo")'
docker compose exec iris iris session iris -UHELLOWORLD 'test0(1)'

#Use Generic BP
docker compose exec iris iris session iris -UHELLOWORLD 'test1'
#Use Message Router
docker compose exec iris iris session iris -UHELLOWORLD 'test2'
```

# Basic World Cities Databaseについて
https://simplemaps.com/data/world-cities

[license](license.txt)
