class BackboneApp.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null
    content: null

class BackboneApp.Collections.PostsCollection extends Backbone.Collection
  model: BackboneApp.Models.Post
  url: '/posts'
