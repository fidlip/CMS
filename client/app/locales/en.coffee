en =
  cms:
    general:
      appName: "Simple CMS"

      placeholder: "Enter a %@1..."

      registration: "Registration"

      button:
        add: "Add"
        delete: "Delete"
        cancel: "Cancel"

      select:
        prompt: "please select ..."

    menu:
      home: "Home"
      users: "Users"
      posts: "Posts"
      loggedUser: "Logged user"
      login: "Login"
      logout: "Logout"
      profile: "Profile"

    users:
      user: "User"
      newUser: "New user"
      username: "User name"
      firstName: "First name"
      lastName: "Last name"
      password: "Password"
      passwordAgain: "Password again"
      userType: "User type"
      types: {
        user: "User"
        editor: "Editor"
        redactor: "Redactor"
        admin: "Admin"
      }

    posts:
      post: "Post"
      newPost: "New post"
      title: "Title"
      text: "Text"

    server:
      error:
        unexpectedError: "Unexpected error!"
        noSessionUser: "No user connected with session!"

        unknownUser: "Unknown user!"
        invalidPassword: "InvalidPassword!"
        permissionDenied: "Permission denied!"
        unknownGrantType: "Unknown grant type!"
        missingAuthorizationHeader: "Missing authorization header!"
        badAuthorizationHeader: "Bad authorization header!"
        badAuthorizationScheme: "Bad authorization scheme!"
        tokensDoNotEqual: "Tokens do not equal!"

`export default en;`
