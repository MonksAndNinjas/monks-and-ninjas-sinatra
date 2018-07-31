require './config/environment'

use Rack::MethodOverride

use MonksAndNinjasController
use RegistrationsController
use UsersController
use PostsController
use MovementsController

run ApplicationController
