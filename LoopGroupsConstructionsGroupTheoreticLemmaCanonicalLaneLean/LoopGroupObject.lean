import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure LoopGroupObject where
  carrier : Type
  topology : TopologicalSpace carrier
  groupStructure : Group carrier
  loopSpace : Type
  loopTopology : TopologicalSpace loopSpace
  loopGroupStructure : Group loopSpace
  centralExtension : Type
  centralExtensionGroup : Group centralExtension
  cocycleCondition : Prop
  conclusion : cocycleCondition

def LoopGroupWitnessClosed (O : LoopGroupObject) : Prop :=
  O.cocycleCondition

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse
