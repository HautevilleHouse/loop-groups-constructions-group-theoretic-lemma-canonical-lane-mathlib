import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure LoopGroupConstruction where
  loopSpaceMap : Type u -> Type u
  pointwiseMultiplication : {X : Type u} -> LoopGroupConstruction -> X -> X
  centralExtension : Type u
  coboundaryCondition : Prop
  admissible : Prop
  admissibleTerm : admissible

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse