# GOALS

The goal of this project is to provide an easy to use openAPI specification for the Cloud Foundry PCF, CFAR 
and K8S platforms that will enable the development of services that will interface at API level. To interact from the
command line use [CF CLI](https://github.com/cloudfoundry/cli).

## Scope
1. The scope is to consider only the hosting of applications in a CRUD pattern and also to include
management features such as start, stop and restage. It is assumed that the target platform already
has the required users, quotas and roles configured.
2. Must include management of organisations and spaces.
3. Must include http route management.
4. Must include network policy management.
5. Must handle UAA tokens.

## Implementation

For this project we could use the CF CLI as our implementation being called from a shell operator
such as [JPROC](https://github.com/fleipold/jproc) which would work fine but then we would have to
possibly add the binary to our package and calling the command shell might not be as reliable as a
simple REST API call from for exammple SpringBoot webclient.

Another option would be to put a [REST API written in golang](https://nordicapis.com/7-frameworks-to-build-a-rest-api-in-go/) in front of the CF CLI. 

## References
* [CF CLI](https://github.com/cloudfoundry/cli)
* [CF 4 K8S](https://cf-for-k8s.io/docs/)
* [Cloud Foundry V3 API](http://v3-apidocs.cloudfoundry.org/version/3.114.0/index.html)
* [Cloud Foundry Networking](https://github.com/cloudfoundry/cf-networking-release)
* [Stratos API Defintion](https://raw.githubusercontent.com/cloudfoundry/stratos/master/docs/apiDefinition.json)
