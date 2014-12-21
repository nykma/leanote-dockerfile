## leanote Dockerfile

[LEANOTE](http://leanote.com/) is a notebook platform, which you can host by yourself.

## Build

```bash
git clone && cd leanote-dockerfile
docker build --tag="leanote:1.0b2" .
```

## Prepare

Please modify `conf/app.conf` to meet your demands. Focusing on these:

- `site.url`
- `app.secret`

> There's no need to modify the settings of `db` - They're done in `addUser.js` and `start.sh`. Check these two files if you want to do more customization like a boss.

## Run

```bash
docker run -v <YOUR DATABASE DIR>:/root/notedata -v <YOUR CONF DIR>:/root/leanote/conf -p <YOUR PORT>:80 -d --name leanote leanote:1.0b2
```

## Known issue

The container's initial start will fail. you must manually

```bash
docker start leanote
```

again to let it work properly. Wondering why. Please fix it if you find out the reason.