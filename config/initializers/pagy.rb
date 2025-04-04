require 'pagy/extras/bootstrap'
require 'pagy/extras/overflow'

Pagy::DEFAULT[:items] = 25 
Pagy::DEFAULT[:size]  = [1, 4, 4, 1] 
Pagy::DEFAULT[:bootstrap] = { nav_class: 'pagination pagination-sm' }