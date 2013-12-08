module Prelude.Category

infixr 1 ~>
infixl 9 <.>

class Category (obj : Type) (mor : obj -> obj -> Type) where
    (<.>) : (mor y z) -> (mor x y) -> (mor x z)
    idC : mor x x

(~>) : Category obj mor => obj -> obj -> Type
(~>) = mor


class Category obj mor => VerifiedCategory (obj : Type) (mor : obj -> obj -> Type) where
    leftIdentity : (m : mor x y) -> idC <.> m = m
    rightIdentity : (m : mor x y) -> m <.> idC = m
    associativity : (f : mor z w) -> (g : mor y z) -> (h : mor x y) -> f <.> (g <.> h) = (f <.> g) <.> h

instance Category Type (let mor x y = x -> y in mor) where
    (<.>) = (.)
    idC = id

{-instance VerifiedCategory Type where
    leftIdentity f = refl
    rightIdentity f = refl
    associativity f g h = refl -}
