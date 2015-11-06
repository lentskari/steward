== Steward

You'll need `postgresql`
`brew install postgres`

To develop: 
`bundle install``
`be rake db:setup`
`be rake db:migrate`

Install pow:
`curl get.pow.cx | sh`
```bash
cd ~./pow
ln -s <<path to steward>>
```

Run:
`rails server``
Navigate to: `http://steward.dev`
