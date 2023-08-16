# Push action

This action commits and pushes the currently checked out workspace to a remote GitHub repository.

By default, the code is pushed to the repository and branch the workflow was triggered on,
with the credentials of the user that triggered the workflow.
However, both of these values can be customized to push to other branches, under other users.

It is important to note that the repository that is currently checked out will be used.
The easiest way to make sure you do not run into any issues here is to check whether you use
GitHub's [actions/checkout](https://github.com/actions/checkout) action.

# Usage

```yaml
- uses: amousavigourabi/push-action@v0
  with:
    # The commit message
    message: ''

    # The commit author
    #
    # Default: '${GITHUB_ACTOR}'
    author: ''

    # The commit author's email
    #
    # Default: '${GITHUB_ACTOR_ID}+${GITHUB_ACTOR}@users.noreply.github.com'
    email: ''

    # Whether Git uses rebasing for pulls
    #
    # Default: false
    rebase: ''

    # Whether Git uses fast-forwarding for pulls
    #
    # Default: true
    fast-forward: ''

    # The branch to push to
    #
    # Default: '${GITHUB_REF_NAME}'
    branch: ''

    # The files to commit and push
    #
    # Default: '.'
    files: ''

    # Allow empty commits to be pushed
    #
    # Default: false
    allow-empty: ''
```

# Scenarios

- [Updating the remote repository after applying linters](#Updating-the-remote-repository-after-applying-linters)
- [Storing generated files in the repository](#Storing-generated-files-in-the-repository)

## Updating the remote repository after applying linters

```yaml
- uses: amousavigourabi/push-action@v0
  with:
    message: 'Apply linters'
```

## Storing generated files in the repository

```yaml
- uses: amousavigourabi/push-action@v0
  with:
    message: 'Add generated files'
    rebase: true
    branch: 'reports'
    files: 'reports/'
    allow-empty: true
```

# Contributing

Contributions are more than welcome. If you spot a bug or have a feature request, you can open an issue for it
on GitHub. Pull requests for improvements or bugfixes are always appreciated. Please refer to the issue that
is being solved in the pull request description.

# License

This project is licensed under the [Apache-2.0 License](LICENSE).
