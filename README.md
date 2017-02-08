

#users table

| columns    | type        |  restriction |
|:-----------|------------:|:------------:|
| name       |      string | null false   |





#groups table

| columns    | type        |  restriction |
|:-----------|------------:|:------------:|
| name       |      string | null false   |



#chat table
| columns    | type        |  restriction |
|:-----------|------------:|:------------:|
| name       |      string | null false   |
| text       |      string |              |
| group_id   |     integer | null false   |
| user_id    |     integer |  null false   |



#users_groups table
| columns    | type        |  restriction |
|:-----------|------------:|:------------:|
| user_id    |     integer | null false   |
| group_id   |     integer | null false   |
