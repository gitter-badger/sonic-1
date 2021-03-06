---
title: Settings
---

You can adjust the behavior of sonic and set some handy default values with `settings.yml` files.  There can exist multiple settings files which all get loaded and merged. The options from the files follow the following precedence rules:

1. current folder - The current folder's `.sonic/settings.yml` values take the highest precedence. The current folder is typically the project folder.
2. user - The user's `~/.sonic/settings.yml` values take the second highest precedence.
3. default - The [default settings](https://github.com/boltopslabs/sonic/blob/master/lib/sonic/default/settings.yml) bundled with the tool takes the lowest precedence.

Here is an `settings.yml` example:

```yaml
bastion: # cluster_host mapping
  default: # default is nil - which means a bastion host wont be used
  # Examples:
  # prod: bastion.mydomain.com
  # stag: ubuntu@bastion-stag.mydomain.com
host_key_check: false
service_cluster:
  default: # defaults to nil
  hi-web-prod: prod
  hi-clock-prod: prod
  hi-worker-prod: prod
  hi-web-stag: stag
  hi-clock-stag: stag
  hi-worker-stag: stag
user: ec2-user
```

The following table covers the different setting options:

Setting  | Description | Default
------------- | ------------- | -------------
bastion  | Bastion mapping allows you to set a bastion host on a per ECS cluster basis.  The bastion host is used as the jump host. Examples: bastion.mydomain.com, myuser@bastion.myuser.com or 123.123.123.123. | (no value)
host_key_check  | Controls whether or not use the strict host checking ssh option.  Since EC2 server host changes often the default value is false. | false
service_cluster  | Service to cluster mapping.  This is a Hash structure that maps the service name to cluster names. | (no value)
user  | User to ssh into the server with. This can be overriden at the CLI with the user@host notation but can be set in the settings.yml file also. | ec2-user

The default settings are located tool source code at [lib/sonic/default/settings.yml](https://github.com/boltopslabs/sonic/blob/master/lib/sonic/default/settings.yml).

### Bastion cluster to host mapping

Provided this example:

```yaml
bastion: # cluster_host mapping
  default: ec2-user@bastion.mydomain.com
  prod: ec2-user@bastion.mydomain.com
  stag: ubuntu@bastion-stag.mydomain.com
```

This results in

```sh
sonic ssh --cluster prod [IDENTIFER] # ec2-user@bastion.mydomain.com used as the bastion host
sonic ssh --cluster stag [IDENTIFER] # ubuntu@bastion-stag.mydomain.com used as the bastion host
sonic ssh --cluster whatever [IDENTIFER] # ec2-user@bastion.mydomain.com used as the bastion host
```

### Service to Cluster Mapping

One of the useful options is the `service_cluster`.  This option maps service names to cluster names.  This saves you from  typing the `--cluster` option over and over.  Here is an example `~/.sonic/settings.yml`:

```yaml
user: ec2-user
service_cluster:
  default: my-default-cluster
  hi-web-prod: prod
  hi-clock-prod: prod
  hi-worker-prod: prod
  hi-web-stag: stag
  hi-clock-stag: stag
  hi-worker-stag: stag
```

This results in shorter commands:

```
sonic ssh hi-web-prod
sonic ssh hi-clock-prod
sonic ssh hi-worker-stag
```

Instead of what you normally would have to type:

```
sonic ssh hi-web-prod --cluster prod
sonic ssh hi-clock-prod --cluster prod
sonic ssh hi-worker-stag --cluster stag
```


<a id="prev" class="btn btn-basic" href="{% link _docs/tutorial-list.md %}">Back</a>
<a id="next" class="btn btn-primary" href="{% link _docs/help.md %}">Next Step</a>
<p class="keyboard-tip">Pro tip: Use the <- and -> arrow keys to move back and forward.</p>
