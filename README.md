
## users table

| columns    | type        |  restriction |
|:-----------|------------:|:------------:|
| name       |      string | null false   |
| email      |      string | null false   |
| password   |      string | null false   |

### assosiation

` has_many :messages `  
` has_many :users_groups`  
` has_many :groups, through: :users_groups `

## groups table

| columns    | type        |  restriction |
|:-----------|------------:|:------------:|
| name       |      string | null false   |

### assosiation

` has_many :messages`      
` has_many :users_groups`   
` has_many :users, through: :users_groups `

## messages table

| columns    | type        |  restriction     |
|:-----------|------------:|:----------------:|
| text       |      string |                  |
| image      |      string |                  |
| group_id   |     integer | foreign_key true |
| user_id    |     integer | foreign_key true |

### assosiation

` belongs_to :user `  
` belongs_to :group `

## users_groups table

| columns    | type        |  restriction     |
|:-----------|------------:|:----------------:|
| user_id    |     integer | foreign_key true |
| group_id   |     integer | foreign_key true |

### assosiation

` belongs_to :user `  
` belongs_to :group `
