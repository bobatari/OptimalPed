# OptimalPed
Script lets you change your ped to a ped listed in the config file. This is not permanent and can be used for costume parties.
This was created on qb-core.

## Configure what peds to be swapped in the config. You can find peds on your own, I believe in you.

```
Config.Peds = { --Add as many peds as you'd like here. 
    {
        model = 'jackskellington', --This should be the ped spawn name. 
        location = vector3(241.94, -1398.34, 30.53), --Where to have the peds show up for 3rd eye'ing them.
        heading = 135.0 --Direction they're facing.
    },
    {
        model = 'Brook',
        location = vector3(245.00, -1395.00, 30.53),
        heading = 90.0
    }, --dont forget the comma's
    {
        model = 'Cuphead',
        location = vector3(250.00, -1390.00, 30.53),
        heading = 180.0
    }
```
Preview:
https://youtu.be/DhkxDat4W8I
