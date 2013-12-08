module Prelude.Functor

import Prelude.Category

class Category t => Functor (f : t -> t) where
    map : (a ~> b) -> f a ~> f b

class (Category t, VerifiedCategory t, Functor f) => VerifiedFunctor (f : t -> t) where
    mapId : map idC = idC
    mapCompose : (f : y ~> z) -> (g : x ~> y) -> map (f <.> g) = map f <.> map g
