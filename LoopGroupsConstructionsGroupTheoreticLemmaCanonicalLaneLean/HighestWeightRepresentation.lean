import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure HighestWeightRepresentation (G : Type*) [TopologicalSpace G] [Group G] where
  highestWeight : ℤ × ℤ
  representation : Type*
  representationAction : G → representation → representation
  integrability : Prop
  highestWeightRepClosed : Prop

structure HighestWeightRepresentationEvidence (G : Type*) [TopologicalSpace G] [Group G] (H : HighestWeightRepresentation G) where
  integrabilityClosed : H.integrability
  highestWeightRepClosedTerm : H.highestWeightRepClosed

def HighestWeightRepresentationClosed (G : Type*) [TopologicalSpace G] [Group G] (H : HighestWeightRepresentation G) : Prop :=
  H.integrability ∧ H.highestWeightRepClosed

theorem highest_weight_representation_closed_from_evidence (G : Type*) [TopologicalSpace G] [Group G] (H : HighestWeightRepresentation G) (E : HighestWeightRepresentationEvidence G H) : HighestWeightRepresentationClosed G H :=
  And.intro E.integrabilityClosed E.highestWeightRepClosedTerm

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse