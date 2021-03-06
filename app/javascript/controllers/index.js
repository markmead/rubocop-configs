import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import { RevealController } from 'stimulus-reveal'
import { RemoteController } from 'stimulus-remote'

const application = Application.start()
const context = require.context('controllers', true, /_controller\.js$/)
application.load(definitionsFromContext(context))
application.register('reveal', RevealController)
application.register('remote', RemoteController)
