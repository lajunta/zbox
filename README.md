## Mongoid monkey patch added

when mongoid is included , dynamic method is added

when you need remove a grid file , you just need to 

```ruby
  # xxx is a special field with hash type containing grid_id
	after_destroy :remove_xxx 
  
  # if xxx is plurals
  after_destory :remove_xxx
``` 

when you remove a page that contains a field like content that contains some grid fs image

so you need following methods to remove these embed grid file

```ruby
	after_destroy -> {delete_medias :content}
```

## Plug::Mixin 

when this module is included, you can use class method 

```ruby
  array_attr :x,:y,:z..
  # x, y, z a array filed 
```

this method add two method

```
  x_list=(v) 
  x_list 
```

this two methods convert array field to string between model and view
