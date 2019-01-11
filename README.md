# CRUD OTP, HTTP Application without framework.

## Setup a project

```bash
bash> mkdir crud-otp-http; cd crud-otp-http
bash> mix new ./ --app crud --sup
```

```bash
iex> Crud.Server.show
iex> [item] = Crud.Server.add("hello")
iex> Crud.Server.toggle(item.id)
iex> Crud.Server.del(item.id)
```

```bash
bash> curl http://localhost:3000
```


### 11 Jan 2019 by Oleg G.Kapranov
