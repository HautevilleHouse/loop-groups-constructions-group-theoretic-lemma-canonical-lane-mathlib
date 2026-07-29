import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

-- Affine Lie algebra associated to a loop group central extension

structure AffineLieAlgebra (G : LoopGroupConstruction) where
  underlyingSpace : Type u
  bracket : underlyingSpace → underlyingSpace → underlyingSpace
  jacobiIdentity : ∀ x y z, bracket x (bracket y z) + bracket y (bracket z x) + bracket z (bracket x y) = 0
  centralElement : underlyingSpace
  centralInBracket : ∀ x, bracket x centralElement = 0
  jacobiIdentityTerm : jacobiIdentity
  centralInBracketTerm : centralInBracket
  admissible : Prop
  admissibleTerm : admissible

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse