# osu! View (SR Calc Action)

This is the GH Action Repository implementation of our osu! View SR Calculation Project.

# Usage

Use my action in your GitHub Workflow.

For example:

```yaml
name: Run Eve-ning's osu!view SR calculator

on:
  pull_request:

jobs:
  sr-calc:
    runs-on: ubuntu-latest
    name: Osu!view SR calculator
    steps:
      - name: SR Calc
        uses: Eve-ning/osu-view-sr-calc@master
        with:
          db-url: 'https://data.ppy.sh/2023_10_01_performance_mania_top_1000.tar.bz2'
          files-url: 'https://data.ppy.sh/2023_10_01_osu_files.tar.bz2'
          files-sql-query: 'SELECT beatmap_id FROM osu_beatmaps WHERE playmode=3 AND approved=1 AND difficultyrating>5'
          osu-git: 'https://github.com/ppy/osu'
          osu-git-branch: 'master'
          osu-tools-git: 'https://github.com/ppy/osu-tools'
          osu-tools-git-branch: 'master'
```

- `db-url`: Database URL in data.ppy.sh. See `DB_URL` of [osu! Data on Docker](https://github.com/Eve-ning/osu-data-docker/#get-started)
- `files-url`: Files URL data.ppy.sh. See `FILES_URL` of [osu! Data on Docker](https://github.com/Eve-ning/osu-data-docker/#get-started)
- `files-sql-query`: SQL Query to pull relevant `beatmap_id` from the database. See `query.sql` of [osu! View](https://github.com/Eve-ning/osu-view/tree/master/projects/sr-calc)
- `osu-git`: Git Repository of `osu` to use. See `OSU_GIT` of [osu! Tools on Docker](https://github.com/Eve-ning/osu-tools-docker)
- `osu-git-branch`: Git Branch of the above
- `osu-tools-git`: Git Repository of `osu-tools` to use. See `OSU_TOOLS_GIT` of [osu! Tools on Docker](https://github.com/Eve-ning/osu-tools-docker)
- `osu-tools-git-branch`: Git Branch of the above

## Outputs

This will output an artifact that contains
- `nt.results.json`: Normal Time
- `ht.___`: Half Time
- `dt.___`: Double Time
- `...`: Other configuration files

All results will be stored in the 3 `results.json` file.

The JSON structure is exactly what `osu-tools difficulty` would output. So further formatting is necessary!
