import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

-- Representation of loop groups on a Hilbert space

structure LoopGroupRepresentation (G : LoopGroupConstruction) (V : Type u) [HilbertSpace V] where
  action : G.loopSpaceMap unit → (V → V)
  continuity : ∀ v : V, Continuous (λ g => action g v)
  unitarity : ∀ g, IsUnitary (action g)
  continuityTerm : continuity
  unitarityTerm : unitarity
  admissible : Prop
  admissibleTerm : admissible

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse