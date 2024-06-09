# README

Notes to self:
- After the idle/sing animation finishes, the game immediately transitions to (and loops, if enabled in the JSON) the `-hold` animation.
  - In `dad.json` and `parents-christmas.json`, this is used to keep their eyes flickering during long notes.
  - In `mom-car.json`, this animation is used to keep her hair blowing while singing, and between bops of her idle.

## Example:
```jsonc
{
  "version": "1.0.0",
  "renderType": "sparrow",
  "offsets": [0, 0],
  "danceEvery": 1,
  "scale": 1.0,
  "name": "Daddy Dearest",
  "flipX": true,
  "cameraOffsets": [0, 0],
  "singTime": 8.0,
  "startingAnimation": "idle",
  "isPixel": false,
  "assetPath": "characters/daddyDearest",
  "healthIcon": {
    "offsets": [0, 0],
    "id": "dad",
    "flipX": false,
    "isPixel": false,
    "scale": 1
  },
  "pixelIcon": {
    "id": "daddy"
  },
  "animations": [
    {
      "name": "idle",
      "prefix": "idle",
      "looped": false,
      "frameRate": 24,
      "flipY": false,
      "flipX": false,
      "offsets": [0, 0]
    },
    {
      "name": "idle-hold",
      "prefix": "idle",
      "looped": true,
      "frameRate": 24,
      "flipY": false,
      "flipX": false,
      "frameIndices": [11, 12],
      "offsets": [0, 0]
    },
    {
      "name": "singLEFT",
      "prefix": "singLEFT",
      "looped": false,
      "flipY": false,
      "flipX": false,
      "offsets": [-10, 10]
    },
    {
      "name": "singLEFT-hold",
      "prefix": "singLEFT",
      "looped": true,
      "frameRate": 24,
      "flipY": false,
      "flipX": false,
      "frameIndices": [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
      "offsets": [-10, 10]
    },
    {
      "name": "singDOWN",
      "prefix": "singDOWN",
      "looped": false,
      "flipY": false,
      "flipX": false,
      "offsets": [0, -30]
    },
    {
      "name": "singDOWN-hold",
      "prefix": "singDOWN",
      "looped": true,
      "frameRate": 24,
      "flipY": false,
      "flipX": false,
      "frameIndices": [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
      "offsets": [0, -30]
    },
    {
      "name": "singUP",
      "prefix": "singUP",
      "looped": false,
      "flipY": false,
      "flipX": false,
      "offsets": [-6, 50]
    },
    {
      "name": "singUP-hold",
      "prefix": "singUP",
      "looped": true,
      "frameRate": 24,
      "flipY": false,
      "flipX": false,
      "frameIndices": [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
      "offsets": [-6, 50]
    },
    {
      "name": "singRIGHT",
      "prefix": "singRIGHT",
      "looped": false,
      "flipY": false,
      "flipX": false,
      "offsets": [0, 27]
    },
    {
      "name": "singRIGHT-hold",
      "prefix": "singRIGHT",
      "frameRate": 24,
      "flipY": false,
      "flipX": false,
      "looped": true,
      "frameIndices": [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
      "offsets": [0, 27]
    }
  ]
}
```
