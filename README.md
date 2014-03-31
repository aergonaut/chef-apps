# chef-apps

A cookbook based on pivotal_workstation for installing OS X apps. Unlike Sprout or Kitchenplan, this cookbook does not use Homebrew Cask, but instead prefers to download files directly from the providers.

## Contributing

### Adding a new recipe

1. Fork the repo
2. Create a new branch like `add-cool-app-recipe`
3. Commit your recipe to the `recipes` directory
4. Open a pull request named like "Add Cool App" and tag it with the "new recipes" tag

## Usage

### Recipes

Recipes to install individual applications can be found in the `recipes` directory. To install an app, simply include it's recipe.

```
include_recipe apps::sublime_text_2
include_recipe apps::google_chrome
```

### Resources/Providers

#### apps_zip

The `apps_zip` LWRP provides a way to download and extract a Mac app from a zip file.

##### Example

```ruby
apps_zip "1Password" do
  source "https://d13itkw33a7sus.cloudfront.net/dist/1P/mac4/1Password-4.2.2.zip"
end
```

##### Actions

Action  | Description
--------|-----------------------------------
install | **Default.** Installs the package.

##### Attributes

Attribute   | Description                                                                      | Default
------------|----------------------------------------------------------------------------------|----------------
app         | **Name attribute.** The name of the app to install.                              | `nil`
source      | URL to download the zip file from.                                               | `nil`
zip_file    | Name of the zip file if it is different than the last part of the URL.           | `nil`
checksum    | Checksum of the zip file. If set, Chef will fail if the checksum does not match. | `nil`
destination | Directory to unpack the zip file to.                                             | `/Applications`

## License

The MIT License (MIT)

Copyright (c) 2014 Chris Fung

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
