# EverythingStays
## Immutable & Distributed NodeJS Modules

![Distributed Network](distributed.jpg)

What if we could start distributing modules in a immutable and safe way?

Well, we can, we just have to change the install and publish process a bit.

<iframe src="http://ghbtns.com/github-btn.html?user=EverythingStays&amp;repo=EverythingStays&amp;type=watch&amp;count=true" allowtransparency="true" scrolling="0" frameborder="0" height="20" width="100"></iframe> <a href="https://twitter.com/share" class="twitter-share-button" data-text="Let's solve the #nodejs ecosystem and use immutable #npm packages!">Tweet</a>

NOTE: Currently, this is just a draft but feel free to leave input

## Introduction

During these last few days, the negative parts of having NPM being centralized with one company has been exposed to the light.

I set out to solve the problems that I saw, and I'd love your feedback and work to create a better module ecosystem for NodeJS

NOTE: If you're just interested in seeing the technical solution, skip all this mumbo-jumbo and go directly to [How we can do it](#how-we-can-do-it)

### Problems trying to solve

* No to reinventing the wheel 100% (in some cases is good)
* No to mutable modules
* No to be able to remove modules
* No to applications changing because of a new version of module was published
* No to centralization. There should be no organization owning modules and their names
* No to be involved in politics. The technology should be free from politics
* No to always-online to install modules
* No to always use company-provided CDN's (while it's possible, it shouldn't be the only way)
* No to always fetching remote when it exists locally or in LAN

Let's solve these issues, one at a time.

### How can we fix these issues?

TLDR: Let's use [IPFS](https://ipfs.io) for publishing and downloading modules

Longer version:

#### Do not re-invent the wheel

The proposed solution is using the filesystem support of the NPM cli (and ied + pnpm is supported too).

The only thing we have to change is our process, which is a difficult part but possible if we really care and engage ourselves in this.

#### Immutable modules

Today, the fate of a module is decided by NPM the company, and they are not afraid of deleting your module and letting someone else have it.

Modules should not be deletable. Instead, a module should live on, for as long as people are seeding the module and using it.

More popular modules will be seeded by more people, making it faster to download.

#### Applications changing from dependencies

Many popular modules broke because of a dependency was removed. Then a new version of the same module was published and everyone automatically started using that module. This is bad, because it's centralized and we just had luck that it was a good actor that choose to publish a proper module.

Next time, that might not be the case.

#### Distributed modules

Modules should not be controlled by one entity, that decides the fate of the module.

Modules should be owned by everyone. If we have a distributed network of modules, we can solve a lot of these issues.

Using a distributed network makes downloads faster, more efficient, safer and more democratic.

#### Care about technology, not politics

Let's focus on code sharing, not on who get what name. That is not interesting.

If we focus on building a network of packages that are immutable, and hosted by everyone ala Bittorrent, we can avoid 100% of the politics.

With that said, if you are sharing copyright-protected content or other illegal content in your country, you are responsible for that.

#### Offline first approach

With a offline first approach, we can make sure you can still install packages you installed before, if you are offline.

Or if you are installing modules on a machine in a isolated network, you should be able to do so, without having to pay NPM for it.

#### Everyone can be a CDN

While having a central registry of modules can be good, putting all of our collective trust in a company is no good.

Let's make everyone a CDN and make it as easy as possible to share code directly in between us.

## How we can do it

In this part, there is two sections. I recommend everyone to read through the "For module users" and for module owners, there is a section below.

## Requirements

* NodeJS version 4 or higher
* NPM version 3 or higher
* IPFS version 0.3.11 or higher
* FUSE version 2.8.3 or higher

These are the versions I've used for testing the proposed solution. It might work on earlier versions, so please try it out and let me know if it doesn't/does work, so I can update this part accordingly.

## Installation

I'm assuming you have NodeJS and NPM already installed.

The IPFS and FUSE install steps are the following:

* [IPFS Installation Guide](https://ipfs.io/docs/install/)
* [IPFS + FUSE Setup Guide](https://github.com/ipfs/go-ipfs/blob/master/docs/fuse.md)
* Now you should have IPFS and FUSE setup correctly, then run:
* `ipfs daemon --init --mount` and wait for `Daemon is ready` to show up
* Now do `cat /ipfs/QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG/about` and you should see information about IPFS

Done! Now we're ready for installing and publishing modules!

NOTE: When you are publishing/installing modules, you will need to run `ipfs daemon --init --mount` before, so you can download and upload modules.

## Publishing modules

Now, to publish modules, it's similar to using `npm publish` but we replace it with `ipfs add -r .`. You will something like this:

```
added Qma4Ghae5gB9uVYmBU4iHcje9x56Kzke1WKZRFnvtTPToG lodash/vendor/underscore/LICENSE
added QmeJmpz3cxy9c4wNFm5yhV56kAL47HAvzBEE12XsuTuG6g lodash/vendor/underscore/test/arrays.js
added Qmbujb5jTRJdWPRGiHqBv7GjJx6e4oggr5kYXGfRHQqgPQ lodash/vendor/underscore/test/chaining.js
added QmYgMqKALfGnErEhok3Yir1dLZ2m8wH7nFsNH3zPJmjBvh lodash/vendor/underscore/test/collections.js
added QmYfk12PLA6eaTxVYsbdPyUyYaTTFfzyEQXx1bprhbM3uK lodash/vendor/underscore/test/cross-document.js
added QmeJsLD33jnCNYXY5e7BQPCaWu1i6nwrLgqmSqmJi7hh57 lodash/vendor/underscore/test/functions.js
added QmaCx3hh71wWztKcccKWD2eXF1k3ookE3N8vea8iFottuS lodash/vendor/underscore/test/objects.js
added QmfPckmowMhuppmYVet4LZ3Uts68MocJUWDHzPUoGnyGWj lodash/vendor/underscore/test/utility.js
added QmbFwDm2HfNq3LbjbHtTjDMW4iSd62RGEG23FrCLcTxTL4 lodash/vendor/underscore/test
added Qmctn1uc7EwG4Mf9Uii4CiZxw6bMXR2nVAGWjRmjTUeYc3 lodash/vendor/underscore/underscore-min.js
added QmULVtkwBFBDBcust6LALSnqCzCwwoNL7q9tS35eoKCqss lodash/vendor/underscore/underscore.js
added QmVyqekeV3HvmGnpyAdvEMYS7SYBS2DLCjP7sF5KZr16GP lodash/vendor/underscore
added QmdSWsC2cyHQHhTUCG9zAuYxZp1hnyqVPcJtWPxQFk39Ns lodash/vendor
added QmavS7Hh4xt71Ap7errH6PTzf3kV5kcTS6F5U9Ux7wuZU7 lodash
```

The hash you see in the end, that's the hash you care about. Include this hash in places where you publish your module. I have some plans for a distributed repository of modules, but for now, include it with the description of your tags or in your package.json for example.

A handy command for this is `ipfs add -r . | tail -n1 | cut -d ' ' -f 2` which will just print out the hash in the end, for all of your scripting needs

NOTE: The package will only be available for as long as you are running `ipfs daemon`. If you want to be able to share it from after that, you will need other peers in IPFS to have it and seed it for you. It can be a good idea for you to setup a quick instance in AWS or DigitalOcean with IPFS, and run `ipfs pin add $MODULE_HASH` there to share it from your own instance.

## Installing modules

So now we published a module, how we install our newly published module?

Easy! Just do

`npm install --save $MODULE_NAME@/ipfs/$IPFS_HASH`

and now it's been added to `node_modules` and in your `package.json` for future `npm install` needs.

To show you a real example, I've added lodash 4.6.1 to IPFS and I'm seeding it from an instance. To install it, you run: `npm install --save lodash@/ipfs/QmavS7Hh4xt71Ap7errH6PTzf3kV5kcTS6F5U9Ux7wuZU7 `

To good to be true? Almost.


# So what it's left to do?

If you agree with me that it's important to solve these issue, we need to start using this, and publishing our modules with both IPFS and NPM or only IPFS. Suggesting NPM is to not stop people from being productive right now.

So what I want from you?

* Let's talk! Open an issue and describe everything I'm wrong about and what you like about this solution. What you think is missing, what you think is bad and what you think is too much. Open an issue here:
* Spread this page to your circles. The more people who are aware of the problems, the more possible solutions we have. It doesn't matter if it's solved with IPFS or other things, but we do need to learn from our mistakes and fix what is going on right now.
* Start publishing modules by using IPFS. This way, we will be able to build a registry ourselves of modules, that is hosted by everyone. I will provide private bandwidth for hosting your module, so feel free to email me at victorbjelkholm@gmail.com and I'll start seeding your module directly.

Thanks for reading all this. I hope you have some ideas about how to fix these issues, or feel excited about creating a better NodeJS ecosystem. I know I am.

<iframe src="http://ghbtns.com/github-btn.html?user=EverythingStays&amp;repo=EverythingStays&amp;type=watch&amp;count=true" allowtransparency="true" scrolling="0" frameborder="0" height="20" width="100"></iframe> <a href="https://twitter.com/share" class="twitter-share-button" data-text="Let's solve the #nodejs ecosystem and use immutable #npm packages!">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

----------------------

Sincerely,

Victor Bjelkholm

victorbjelkholm@gmail.com - http://everythingstays.com
