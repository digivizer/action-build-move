# Convox Exec Action
This Action runs the [export Command](https://docs.convox.com/reference/cli/resources#resources-export) in a specific resource and creates a file with the output. The file created can be read and managed by any post action.

This Action performs an operation to move a given build from one rack to another.

Convox describe this process in [their documentation for build deployment](https://docsv2.convox.com/deployment/builds)

Caveat: the app name is assumed to be the same in both racks

## Inputs
### `rack`
**Required** The name of the [Convox Rack](https://docs.convox.com/introduction/rack) containing the app you wish to run the command against
### `app`
**Required** The name of the [app](https://docs.convox.com/deployment/creating-an-application) you wish to run the command against
### `build`
**Required** The id of the [build](https://docsv2.convox.com/deployment/builds) to move
### `source`
**Required** The name of of the rack to export the build from
### `destination`
**Required** The name of of the rack to import the build to

## Example usage
```
steps:
- name: login
  id: login
  uses: convox/action-login@v2
  with:
    password: ${{ secrets.CONVOX_DEPLOY_KEY }}

- name: Export database
  uses: convox/action-build-move@master
  with:
    rack: staging
    app: myapp
    build: RTMYCXTCPUY
    source: staging
    destination: production
```
