# EverythingStays
## Immutable & Distributed NodeJS Modules With IPFS

What if we could start distributing modules in a immutable and safe way?

Well, we can, we just have to change the install and publish process a bit.

<iframe src="http://ghbtns.com/github-btn.html?user=EverythingStays&amp;repo=EverythingStays&amp;type=watch&amp;count=true" allowtransparency="true" scrolling="0" frameborder="0" height="20" width="100"></iframe> <a href="https://twitter.com/share" class="twitter-share-button" data-text="Let's improve the #nodejs ecosystem and use immutable #npm packages!">Tweet</a>

NOTE: Currently, this is just a draft but feel free to leave input (https://github.com/EverythingStays/EverythingStays/issues/new)

## Introduction

The last few days have been chaotic for the NodeJS/NPM ecosystem. One companies
centralized registry removed the ability for many to install dependencies. We
don't think this is any good.

We set out to solve the problems that we saw and we just got something working.
We would love your feedback on this, and work together to create a better NodeJS ecosystem.

NOTE: If you're just interested in seeing the technical solution, skip all this
and go to [How we can do it](#how-we-can-do-it)

### Problems trying to solve

* Reinventing the wheel, not reusing existing technologies
* Having mutable modules
* Able to remove modules
* New published version of dependency breaking your application
* Centralization. There should be no organization owning modules and their names
* Involvement in politics. The technology should be free from politics
* Forced to always be online to install modules
* Always use company-provided CDN's (while it's possible, it shouldn't be the only way)
* Always fetching remote when it exists in LAN or local

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

#### New published version of dependency breaking your application

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

In this part, there is two sections. We recommend everyone to read through the "Installing Modules" and for module owners, there is another section called "Publishing Modules" below.

### Requirements

* NodeJS version 4 or higher
* NPM version 3 or higher
* IPFS version 0.3.11 or higher

These are the versions we've used for testing the proposed solution. It might work on earlier versions, so please try it out and let us know if it doesn't/does work, so we can update this part accordingly.

### Installation

We are assuming you have NodeJS and NPM already installed.

The IPFS install steps are the following:

* [IPFS Installation Guide](https://ipfs.io/docs/install/)
* Now you should have IPFS setup correctly, then run:
* `ipfs daemon --init` and wait for `Daemon is ready` to show up
* Now do `ipfs cat /ipfs/QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG/about` and you should see information about IPFS
* The only thing is missing is the everythingstays-cli, install it with `npm install -g everythingstays-cli`

Done! Now we're ready for installing and publishing modules!

NOTE: When you are publishing/installing modules, you will need to run `ipfs daemon --init` before, so you can download and upload modules.

### Publishing modules

To publish modules, simply run `es install` in your repository to install the script hooks.

Now when you run `npm publish`, you'll get a hash from IPFS before publishing to the actual registry. That hash you can use to specify the version to download.

We have some plans for a distributed repository of modules, but for now, include it with the description of your tags or in your package.json for example.

NOTE: The package will only be available for as long as you are running `ipfs daemon`. If you want to be able to share it from after that, you will need other peers in IPFS to have it and seed it for you. It can be a good idea for you to setup a quick instance in AWS or DigitalOcean with IPFS, and run `ipfs pin add $MODULE_HASH` there to share it from your own instance.

#### esDependencies

A key called `esDependencies` is used in your `package.json` to declare the IPFS ready modules we can download. It works the same way as `dependencies` but has a hash instead of a NPM version.

### Installing modules

So now we published a module, how we install our newly published module?

Easy! Just add a `esDependencies` key in your `package.json`, listing a dependency like this:

```
"esDependencies": {
  "lodash": "QmdKuh7znkjc6tqr4ReMLw1hTAQkQTZf1Gfz4HA3KKD9Np"
}
```

And after that, run `npm install` and the module have been installed!


NOTE: In the future, it will work something like this instead:

`es save $MODULE_NAME@$IPFS_HASH`

and now it's been added to `node_modules` and in your `package.json` for future `npm install` needs.

To show you a real example, I've added lodash 4.6.1 to IPFS and I'm seeding it from an instance. To install it, you run: `es save lodash@QmdKuh7znkjc6tqr4ReMLw1hTAQkQTZf1Gfz4HA3KKD9Np`

To good to be true? Almost.

# So what it's left to do?

If you agree with us that it's important to solve these issue, we need to start using this, and publishing our modules with both IPFS and NPM or only IPFS. Suggesting NPM + IPFS is to not stop people from being productive right now. But to allow people to move to IPFS when they are ready.

So what we want from you?

* Let's talk! Open an issue and describe everything we're wrong about and what you like about this solution. What you think is missing, what you think is bad and what you think is too much. Open an issue here: https://github.com/EverythingStays/EverythingStays/issues/new
* Spread this page to your circles. The more people who are aware of the problems, the more possible solutions we have. It doesn't matter if it's solved with IPFS, EverythingStays or other things, but we do need to learn from our mistakes and fix what is going on right now.
* Start publishing modules by using IPFS. This way, we will be able to build a registry ourselves of modules, that is hosted by everyone.
* (PS, I, Victor, will provide private bandwidth for seeding your module if you want, so feel free to email me at victorbjelkholm+es@gmail.com and I'll start seeding your module directly.)

Thanks for reading all this. We hope you have some ideas about how to fix these issues, or feel excited about creating a better NodeJS ecosystem. We know we are.

<iframe src="http://ghbtns.com/github-btn.html?user=EverythingStays&amp;repo=EverythingStays&amp;type=watch&amp;count=true" allowtransparency="true" scrolling="0" frameborder="0" height="20" width="100"></iframe> <a href="https://twitter.com/share" class="twitter-share-button" data-text="Let's improve the #nodejs ecosystem and use immutable #npm packages!">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

----------------------

http://everythingstays.com - https://github.com/EverythingStays
