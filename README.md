# InSpec GCP Deep Dive Profile 

This InSpec profile contains four example InSpec GCP testing scenarios. These were originally discussed in a [Chef blog post](https://blog.chef.io/2018/06/19/inspec-gcp-deep-dive/). 
 
The included tests cover the following scenarios:
* Testing that a single GCP zone is available for use
* Checking all GCP zones are available for use
* Ensuring no firewall rules allow SSH/HTTP
* Checking all compute instances to ensure none have a particular label

## Running the tests

With InSpec installed, run the following command from the root directory of the profile to execute the tests.  Note that the *attributes.yml* file should be updated with your GCP project name.
```
$ inspec exec . -t gcp:// --attrs attributes.yml
```

## Useful Links

The following links have relevant information:
* [Introductory blog post](https://lollyrock.com/articles/inspec-cloud-gcp-setup/)
* [InSpec GCP Deep Dive blog post](https://blog.chef.io/2018/06/19/inspec-gcp-deep-dive/)
* [inspec-gcp resource pack](https://github.com/inspec/inspec-gcp)
* [InSpec](https://www.inspec.io/)

## Support

The InSpec GCP resources are community supported. For bugs and features, please open a github issue [here](https://github.com/inspec/inspec-gcp/issues) and label it appropriately.