module Prelude.Category

infixr 1 ~>
infixl 9 <.>

class Category (obj : Type) where
    (~>) : obj -> obj -> Type
    (<.>) : (y ~> z) -> (x ~> y) -> (x ~> z)
    idC : x ~> x

{-class Category obj => VerifiedCategory (obj : Type) where
    leftIdentity : (m : x ~> y) -> idC <.> m = m
    rightIdentity : (m : x ~> y) -> m <.> idC = m
    associativity : (f : z ~> w) -> (g : y ~> z) -> (h : x ~> y) -> f <.> (g <.> h) = (f <.> g) <.> h-}

instance Category Type where
    a ~> b = a -> b
    (<.>) = (.)
    idC = id

{-instance VerifiedCategory Type where
    leftIdentity f = refl
    rightIdentity f = refl
    associativity f g h = refl -}
