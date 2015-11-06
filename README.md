Steward
====

You'll need `postgresql`
`brew install postgres`

To develop: 
`bundle install``
`be rake db:setup`
`be rake db:migrate`

Install pow (rack server):
`curl get.pow.cx | sh`
```bash
cd ~./pow
ln -s <<path to steward>>
```

Run:
Navigate to: `http://steward.dev`
