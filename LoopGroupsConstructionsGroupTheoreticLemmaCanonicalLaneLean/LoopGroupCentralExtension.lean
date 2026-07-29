import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure LoopGroupCentralExtension (G : Type*) [TopologicalSpace G] [Group G] where
  loopGroup : Type*
  loopTopology : TopologicalSpace loopGroup
  loopGroupMultiplication : loopGroup → loopGroup → loopGroup
  centralExtension : Type*
  extensionCocycle : (loopGroup → loopGroup → ℂ)
  cocycleCondition : Prop
  centralExtensionClosed : Prop

structure LoopGroupCentralExtensionEvidence (G : Type*) [TopologicalSpace G] [Group G] (L : LoopGroupCentralExtension G) where
  cocycleConditionClosed : L.cocycleCondition
  centralExtensionClosedTerm : L.centralExtensionClosed

def LoopGroupCentralExtensionClosed (G : Type*) [TopologicalSpace G] [Group G] (L : LoopGroupCentralExtension G) : Prop :=
  L.cocycleCondition ∧ L.centralExtensionClosed

theorem loop_group_central_extension_closed_from_evidence (G : Type*) [TopologicalSpace G] [Group G] (L : LoopGroupCentralExtension G) (E : LoopGroupCentralExtensionEvidence G L) : LoopGroupCentralExtensionClosed G L :=
  And.intro E.cocycleConditionClosed E.centralExtensionClosedTerm

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse