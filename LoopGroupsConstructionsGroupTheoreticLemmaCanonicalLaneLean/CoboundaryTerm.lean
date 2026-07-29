import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

-- The coboundary term that appears in loop group extensions

structure CoboundaryTerm (G : LoopGroupConstruction) where
  cocycle : G.loopSpaceMap unit -> G.loopSpaceMap unit -> ℝ
  coboundaryCondition : ∀ a b, cocycle a b = 0
  coboundaryConditionTerm : coboundaryCondition
  admissible : Prop
  admissibleTerm : admissible

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse