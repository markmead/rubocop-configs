require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')
require('css/application.scss')
require('trix')
require('@rails/actiontext')

import 'controllers'

document.addEventListener('trix-file-accept', (event) => event.preventDefault())
