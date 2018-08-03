require './config/environment'

use Rack::MethodOverride

use MonksAndNinjasController
use MovementsController
use PostsController
use RegistrationsController
use SessionsController
use UsersController

run ApplicationController
