import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure AffineLieAlgebraConstruction (G : Type*) [TopologicalSpace G] [Group G] where
  loopAlgebra : Type*
  centralExtension : Type*
  lieBracket : loopAlgebra → loopAlgebra → loopAlgebra
  centralExtensionAction : centralExtension → loopAlgebra → loopAlgebra
  jacobiIdentity : Prop
  affineLieAlgebraClosed : Prop

structure AffineLieAlgebraConstructionEvidence (G : Type*) [TopologicalSpace G] [Group G] (A : AffineLieAlgebraConstruction G) where
  jacobiIdentityClosed : A.jacobiIdentity
  affineLieAlgebraClosedTerm : A.affineLieAlgebraClosed

def AffineLieAlgebraConstructionClosed (G : Type*) [TopologicalSpace G] [Group G] (A : AffineLieAlgebraConstruction G) : Prop :=
  A.jacobiIdentity ∧ A.affineLieAlgebraClosed

theorem affine_lie_algebra_construction_closed_from_evidence (G : Type*) [TopologicalSpace G] [Group G] (A : AffineLieAlgebraConstruction G) (E : AffineLieAlgebraConstructionEvidence G A) : AffineLieAlgebraConstructionClosed G A :=
  And.intro E.jacobiIdentityClosed E.affineLieAlgebraClosedTerm

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse