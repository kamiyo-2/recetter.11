

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |


### Association

- has_many :recipes
- has_many :comments

## resipes テーブル
| Column        | Type         | Options            |
| ------------- | ------------ | ------------------ |
| title         | string       | null: false        |
| details       | text         | null: false        |
| process       | text         | null: false        |
| main_image_id | string       | null: false        |
| user          | references   |  foreign_key: true |

### Association

- belongs_to :user
- has_many   :foodstuffs
- has_many   :texts
- has_many   :resipe_tag_relations
- has_many   :tags, through: :tweet_tag_relations
- has_many   :commentss
- attachment :main_image

## foodstuff テーブル

| Column     | Type         | Options                |
| ---------- | ------------ | ---------------------- |
| material   | string       | null: false            |
| quantity   | string       | null: false            |
| recipe     | references   | foreign_key: true      |

### Association

- belongs_to :recipe

## text テーブル

| Column        | Type          | Options                |
| ------------- | ------------- | ---------------------- |
| text          | text          | null: false            |
| text_image_id | string        | null: false            |
| recipe        | references    | foreign_key: true      |

### Association

- belongs_to :recipe
- attachment :text_image

## tags テーブル

| Column     | Type         | Options     |
| ---------- | ------------ | ----------- |
| name       | text         | null: false |

### Association

- has_many   :resipe_tag_relations
- belongs_to :resipe, through: :tweet_tag_relations


## recipe_tag_relations テーブル

| Column     | Type         | Options           |
| ---------- | ------------ | ----------------- |
| text       | text         | null: false       |
| tad        | references   | foreign_key: true |
| recipe     | references   | foreign_key: true |

### Association

- belongs_to :tag
- belongs_to :resipe

## comments テーブル

| Column     | Type         | Options                |
| ---------- | ------------ | ---------------------- |
| text       | text         | null: false            |
| user       | references   | foreign_key: true      |
| recipe     | references   | foreign_key: true      |

### Association

- belongs_to :user
- belongs_to :resipe

