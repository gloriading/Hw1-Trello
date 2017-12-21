# BLOG
- Posts
    belongs to user
    has many comments
- Comments
    belongs to post  
    belongs to user      
- User
    has many posts
    has many comments
    authentication - has access to make new post
    authorization - can edit/delete own posts
    can update its own name/email
    can update its own password
    forgot password feature (not yet...) <<
- style
    basic bootstrap styling
    icon - font awesome http://fontawesome.io/icons/
    search - show results in another page. but need to fix nav search alignment
    add background (HomePage ok)
    show individual page title for each post
    change posts index page.
      - display one on top with a dummy picture
      - six others below in 2 rows
    add pagination to index page https://github.com/kaminari/kaminari
      (> rails g kaminari:views bootstrap4)
    social media footer. need to add copyright and contact <<
